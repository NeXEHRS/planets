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

###コンテナ起動
(cd "${DOCKER_DIR}/" && docker-compose build --progress plain)
(cd "${DOCKER_DIR}/" && docker-compose up -d)

###経過時間表示
time_elapsed

###正常終了
echo -e "\e[1;37;45m[警告]\e[m\tOpenFRUCtoSに初期データを投入する場合は、./docker_data_of.sh ${TARGET_DIR} を実行してください"
echo -e "\e[1;37;44m[情報]\e[m\tすべての処理が正常に完了しました"
