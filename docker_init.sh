#! /bin/bash
set -euo pipefail

###変数、共通関数
SCRIPT_DIR=$(cd $(dirname $0); pwd)
SCRIPT_NAME=$(basename $0 | sed 's/\.[^\.]*$//')
source "${SCRIPT_DIR}"/env_init.sh

###個別変数設定
PLAT_SCALING=1
TARGET_DIR="remote"
DOCKER_DIR="${SCRIPT_DIR}/${TARGET_DIR}"

###コンテナ展開サイズ設定
input=
if [ $# -gt 0 ]; then
	input=${1}
else
	echo -en "\e[1;37;44m[入力]\e[m\tコンテナ展開サイズを入力して下さい (1/2) [規定値 : 1] : "
	read input
fi
if [ ! -z "${input}" ]; then
	[ "${input}" = '1' -o "${input}" = '2' ] && PLAT_SCALING=${input} || error_input
fi
sed -i -e "s/^PLAT_SCALING=.*/PLAT_SCALING=${PLAT_SCALING}/" "${DOCKER_DIR}"/.env

###ファイルコピー
rm -f "${DOCKER_DIR}"/docker-compose.yml
cp "${DOCKER_DIR}"/docker-compose-${PLAT_SCALING}.yml "${DOCKER_DIR}"/docker-compose.yml

###正常終了
echo -e "\e[1;37;44m[情報]\e[m\tすべての処理が正常に完了しました"
