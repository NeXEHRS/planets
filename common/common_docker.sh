#! /bin/bash

#共通関数
_initialized_docker() {
	echo "存在チェック用ダミー関数"
}
wait_up() {
	echo -e "\e[1;37;44m[情報]\e[m\t${1} コンテナの起動を待機しています"
	local tmp_line
	while true; do
		sleep 10
		set +e; tmp_line=$(cd ${DOCKER_DIR}/ && docker-compose ps | grep "^${1} " | grep -e "healthy" -e "running"); set -e
		[ -z "${tmp_line}" ] || break
	done
	return 0
}
wait_url() {
	wait_url_sutatus_code ${1} ${2} ${3} "200"
	return 0
}
wait_url_unauthorized() {
	wait_url_sutatus_code ${1} ${2} ${3} "401"
	return 0
}
wait_url_sutatus_code() {
	echo -e "\e[1;37;44m[情報]\e[m\t${1} コンテナの応答を待機しています"
	local tmp_line
	while true; do
		sleep 10
		set +e
		tmp_line=$(curl --noproxy localhost -H "Content-Type: application/json" -LI ${2} -m ${3} -o /dev/null -w '%{http_code}' -s)
		[ "${tmp_line}" = "${4}" ] && break
		set -e
	done
	return 0
}
check_url() {
	local tmp_line
	tmp_line=$(curl --noproxy localhost -H "Content-Type: application/json" -LI ${1} -m ${2} -o /dev/null -w '%{http_code}' -s)
	[ "${tmp_line}" = "${3}" ] && return 0 || return 1
}
clean_docker() {
	echo -e "\e[1;37;44m[情報]\e[m\t不要なコンテナ、イメージを削除します"
	sudo docker system prune --force --volumes
	sudo docker system prune --force --all
	return 0
}
