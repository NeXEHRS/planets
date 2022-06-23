#! /bin/bash

source ${DOCKER_DIR}/.env

OPENFRUCTOS_PSQL_SCHEMA_LIST=
if [ "${PLAT_PROFILE}" = 'remote' ]; then
	if [ "${PLAT_SCALING}" = '1' ]; then
		OPENFRUCTOS_PSQL_SCHEMA_LIST="of1 of2"
	elif [ "${PLAT_SCALING}" = '2' ]; then
		OPENFRUCTOS_PSQL_SCHEMA_LIST="of1 of2 of4"
	fi
elif [ "${PLAT_PROFILE}" = 'localX' ]; then
	OPENFRUCTOS_PSQL_SCHEMA_LIST="of3"
elif [ "${PLAT_PROFILE}" = 'localY' ]; then
	OPENFRUCTOS_PSQL_SCHEMA_LIST="of5"
fi

for target_schema in ${OPENFRUCTOS_PSQL_SCHEMA_LIST}; do
	url_name="OPENFRUCTOS_URL_$(echo ${target_schema} | tr '[a-z]' '[A-Z]')"
	eval ${target_schema}_url=$(eval echo '$'${url_name})
done
