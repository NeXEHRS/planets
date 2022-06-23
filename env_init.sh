#! /bin/bash

if [ -f "${HOME}/.bash_profile" ]; then
	set +eu; source ${HOME}/.bash_profile; set -eu;
fi
if [ -f "${HOME}/.profile" ]; then
	set +eu; source ${HOME}/.profile; set -eu;
fi
source ${SCRIPT_DIR}/common/common.sh
source ${SCRIPT_DIR}/common/common_docker.sh
source ${SCRIPT_DIR}/common/env_common.sh
source ${SCRIPT_DIR}/env_proxy.sh
source ${SCRIPT_DIR}/env_url.sh
