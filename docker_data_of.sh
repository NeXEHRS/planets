#! /bin/bash
set -euo pipefail

###変数、共通関数
SCRIPT_DIR=$(cd $(dirname $0); pwd)
SCRIPT_NAME=$(basename $0 | sed 's/\.[^\.]*$//')
source "${SCRIPT_DIR}"/env_init.sh

###引数取得
function usage() {
	echo -e "Usage :\t${0} target" 1>&2
	echo -e "Param :\ttarget : [処理対象のフォルダ名]" 1>&2
	exit 1
}

if [ $# -lt 1 ]; then
	usage
fi

if [ ! -d "${SCRIPT_DIR}/${1}" ]; then
	echo -e "\e[1;37;45m[警告]\e[m\t処理対象のフォルダが存在しません"
	usage
fi

###個別変数設定
TARGET_DIR=${1}
DOCKER_DIR="${SCRIPT_DIR}/${TARGET_DIR}"
source "${SCRIPT_DIR}"/env_scaling.sh

###コンテナ起動チェック
for target_schema in ${OPENFRUCTOS_PSQL_SCHEMA_LIST}; do
	target_url_name="${target_schema}_url"
	target_url=$(eval echo '$'${target_url_name})
	set +e
	of_alive=$(curl -X GET --noproxy '*' -H "Content-Type: application/json" ${target_url}/Organization -o /dev/null -m ${CURL_TIMEOUT} -w '%{http_code}' -s)
	set -e
	if [ "${of_alive}" != "200" ]; then
		echo -e "\e[1;37;45m[警告]\e[m\tOpenFRUCtoS(${target_schema})が起動していません"
		echo -e "\t起動直後の場合はしばらく待って再実行して下さい"
		exit 1
	fi
	touch "${SCRIPT_DIR}"/json/${target_schema}.registered
done

###データ登録
for target_schema in ${OPENFRUCTOS_PSQL_SCHEMA_LIST}; do
	target_url_name="${target_schema}_url"
	target_url=$(eval echo '$'${target_url_name})
	while read -d $'\0' target_file; do
		set +e
		tmp_line=$(grep "${target_file}" "${SCRIPT_DIR}"/json/${target_schema}.registered)
		set -e
		[ -z "${tmp_line}" ] || continue
		target_resource=$(echo ${target_file} | cut -d '_' -f 2)
		of_succeed=$(curl -X POST --noproxy '*' -H "Content-Type: application/json" ${target_url}/${target_resource}/ -o /dev/null -m ${CURL_TIMEOUT} -w '%{http_code}\n' -s -d @${target_file})
		if [ "${of_succeed}" != 201 ]; then
			echo -e "\e[1;37;45m[警告]\e[m\t以下のファイルのOpenFRUCtoS(${target_schema})への登録に失敗しました"
			ls -l ${target_file}
			exit 1
		fi
		echo -e "\e[1;37;44m[情報]\e[m\t以下のファイルをOpenFRUCtoS(${target_schema})に登録しました"
		ls -l ${target_file}
		echo "${target_file}" >> "${SCRIPT_DIR}"/json/${target_schema}.registered
	done < <(find "${SCRIPT_DIR}"/json/ -type f -name "*${target_schema}*.json" -print0)
done

###正常終了
echo -e "\e[1;37;44m[情報]\e[m\tすべての処理が正常に完了しました"
