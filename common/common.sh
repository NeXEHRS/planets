#! /bin/bash

#共通関数
_initialized() {
	echo "存在チェック用ダミー関数"
}
multitrap() {
	local command
	local signal_name
	local signal_file
	command="${1}"
	shift
	for signal_name in $* ; do
		signal_file=${MULTI_TRAP_TMPDIR}/${signal_name}
		echo "${command}" >> ${signal_file}
		trap "_multitrap_on_signal ${signal_file}" ${signal_name}
	done
	trap _multitrap_on_exit EXIT
}
_multitrap_on_signal() {
	source ${1}
}
_multitrap_on_exit() {
	if [ -n "${MULTI_TRAP_TMPDIR}" ] ; then
		if [ -f "${MULTI_TRAP_TMPDIR}/EXIT" ] ; then
			source "${MULTI_TRAP_TMPDIR}/EXIT"
		fi
		rm -rf ${MULTI_TRAP_TMPDIR}
	fi
}
init_file() {
	local file_owner
	local sudo_command=
	[ -f ${1} ] || return 0

	file_owner=${EXEC_USER}
	[ -f ${1} ] && file_owner=$(stat -c %U ${1})
	[ "${file_owner}" = "${EXEC_USER}" ] || sudo_command="sudo "

	[ -f ${1}.default ] || ${sudo_command}cp -dp ${1}{,.default}
	${sudo_command}cp -dp ${1}{,.${DATETIME}}
	${sudo_command}cp -dp ${1}{.default,}
}
backup_file() {
	local file_owner
	local sudo_command=
	[ -f ${1} ] || return 0

	file_owner=${EXEC_USER}
	[ -f ${1} ] && file_owner=$(stat -c %U ${1})
	[ "${file_owner}" = "${EXEC_USER}" ] || sudo_command="sudo "

	[ -f ${1}.default ] || ${sudo_command}cp -dp ${1}{,.default}
	${sudo_command}cp -dp ${1}{,.${DATETIME}}
}
touch_default_file() {
	[ -f "${1}.default" ] && return 0
	if ${2}; then
		touch ${1}.default
	else
		sudo touch ${1}.default
	fi
}
normalize_file() {
	local file_owner
	local sudo_command=

	file_owner=${EXEC_USER}
	[ -f ${1} ] && file_owner=$(stat -c %U ${1})
	[ "${file_owner}" = "${EXEC_USER}" ] || sudo_command="sudo "

	${sudo_command}sed -i -e '/^$/{N; /^\n$/D;}' ${1}
}
diff_file() {
	local file_owner
	local sudo_command=

	file_owner=${EXEC_USER}
	[ -f ${1} ] && file_owner=$(stat -c %U ${1})
	[ "${file_owner}" = "${EXEC_USER}" ] || sudo_command="sudo "

	set +e; ${sudo_command}diff ${1} ${2}; set -e
	${sudo_command}cp ${2} ${1}
}
check_file() {
	local file_owner
	local sudo_command=

	file_owner=${EXEC_USER}
	[ -f ${1} ] && file_owner=$(stat -c %U ${1})
	[ "${file_owner}" = "${EXEC_USER}" ] || sudo_command="sudo "

	set +e; ${sudo_command}diff ${1} ${2}; set -e
	set +e; confirm_continue "上記変更を反映しますか？"; answer=$?; set -e
	if [ ${answer} -eq 0 ]; then
		${sudo_command}cp ${2} ${1}
	else
		[ -f ${1}.${DATETIME} ] && ${sudo_command}rm -f ${1}.${DATETIME}
		exit 1
	fi
}
finalize_file() {
	local file_owner
	local sudo_command=
	[ -f ${1}.${DATETIME} ] || return 0

	file_owner=${EXEC_USER}
	[ -f ${1} ] && file_owner=$(stat -c %U ${1})
	[ "${file_owner}" = "${EXEC_USER}" ] || sudo_command="sudo "

	local tmp_line
	tmp_line=
	set +e; [ -f ${1}.${DATETIME} ] && tmp_line=$(${sudo_command}diff ${1}{.${DATETIME},}); set -e
	if [ -z "${tmp_line}" ]; then
		${sudo_command}rm -f ${1}.${DATETIME}
	fi
	set +e; [ -f ${1}.${DATETIME} ] && tmp_line=$(${sudo_command}diff ${1}{.${DATETIME},.default}); set -e
	if [ -z "${tmp_line}" ]; then
		${sudo_command}rm -f ${1}.${DATETIME}
	fi

}
_escape_line() {
	tmp_line_escaped=$(echo "${1}" | sed -z 's/\\/\\\\/g' | sed -z 's/\//\\\//g' | sed -z 's/\[/\\\[/g' | sed -z 's/\]/\\\]/g' | sed -z 's/\&/\\\&/g')
}
_escape_block() {
	tmp_line_escaped=$(cat "${1}" | sed -z 's/\\/\\\\/g' | sed -z 's/\//\\\//g' | sed -z 's/\[/\\\[/g' | sed -z 's/\]/\\\]/g' | sed -z 's/\&/\\\&/g' | sed -z 's/\n/\\n/g')
}
edit_line() {
	local file_owner
	local sudo_command=

	file_owner=${EXEC_USER}
	[ -f ${1} ] && file_owner=$(stat -c %U ${1})
	[ "${file_owner}" = "${EXEC_USER}" ] || sudo_command="sudo "

	local tmp_src
	local tmp_replace
	_escape_line "${2}" && tmp_src=${tmp_line_escaped}
	_escape_line "${3}" && tmp_replace=${tmp_line_escaped}
	local tmp_line
	local tmp_line2
	tmp_line=
	tmp_line2=
	[ -f ${1} ] && tmp_line=$(sed -n -e "/${tmp_src}/p" ${1})
	[ -f ${1} ] && tmp_line2=$(sed -n -e "/${tmp_replace}/p" ${1})
	if [ -z "${tmp_line}" ]; then
		if [ -z "${tmp_line2}" ]; then
			set +u; ${sudo_command}sh -c "echo \"${4}${3}\" >> ${1}"; set -u
		fi
	else
		${sudo_command}sed -i -r -e "0,/${tmp_src}/ s/${tmp_src}.*/${tmp_replace}/" ${1}
	fi
}
edit_yml_block() {
	local tmp_line
	local tmp_yml
	sed -i -e "/^$/d" ${3}
	_escape_block "${3}" && tmp_yml=${tmp_line_escaped}
	tmp_line=$(sed -n -e "/^  ${2}:$/p" ${1})
	if [ -z "${tmp_line}" ]; then
		echo "" >> ${1}
		cat ${3} >> ${1}
	else
		sed -i -e "/^  ${2}:$/,/^$/c##########${2}##########" ${1}
		sed -i -e "s/##########${2}##########/${tmp_yml}/" ${1}
	fi
}
delete_yml_block() {
	local tmp_line
	tmp_line=$(sed -n -e "/^  ${2}:$/p" ${1})
	if [ -z "${tmp_line}" ]; then
		echo -e "\e[1;37;45m[警告]\e[m\t${2} は既に削除されています"
	else
		sed -i -e "/^  ${2}:$/,/^$/d" ${1}
	fi
}
check_user() {
	[ "${EXEC_USER}" = "${1}" ] || (echo -e "\e[1;37;45m[警告]\e[m\t${1} ユーザで実行して下さい" && exit 1)
}
check_dir() {
	[ -d "${1}" ] || (echo -e "\e[1;37;45m[警告]\e[m\t${1} ディレクトリを作成します" && mkdir ${1})
}
confirm_wait() {
	local input=
	echo -en "\e[1;37;44m[入力]\e[m\t確認したらエンターを入力して下さい : "
	read input
	return 0
}
confirm_continue() {
	local input=
#	if ${ENV_CONFIRM}; then
		while [ "${input}" != 'y' -a "${input}" != 'n' ]; do
			echo -en "\e[1;37;44m[入力]\e[m\t${1}(y/n) : "
			read input
			[ "${input}" = 'n' ] && return 1
		done
#	fi
	return 0
}
confirm_exit() {
	local input=
	while [ "${input}" != 'y' -a "${input}" != 'n' ]; do
		echo -en "\e[1;37;44m[入力]\e[m\t継続するとシステムが変更されます(y/n) : "
		read input
		[ "${input}" = 'n' ] && return 1
	done
	return 0
}
error_input() {
	echo -e "\e[1;37;45m[警告]\e[m\t入力値が不正です" && exit 1
}
win_to_posix() {
	echo "$1" | sed 's@^\([a-zA-Z]\):@/\L\1@' | sed 's@\\@/@g'
}
posix_to_win() {
	echo "$1" | sed 's@^/\([a-zA-z]\)@\U\1:@' | sed 's@/@\\@g'
}
time_elapsed() {
	CURRENT=$(date +%s)
	ELAPSED=$(expr ${CURRENT} - ${START})
	echo -e "\e[1;37;44m[情報]\e[m\t経過時間：${ELAPSED}秒"
}
