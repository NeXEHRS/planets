#! /bin/bash

### Customize this section.
PROXY_SCHEMA=
PROXY_HOST=
PROXY_PORT=
PROXY_NO_PROXY=
###

PROXY_URL=
if [ ! -z "${PROXY_HOST}" ]; then
	PROXY_URL="${PROXY_SCHEMA}://${PROXY_HOST}:${PROXY_PORT}"
fi

if [ ! -z "${PROXY_URL}" ]; then
	export http_proxy=${PROXY_URL}
	export https_proxy=${PROXY_URL}
	export HTTP_PROXY=${PROXY_URL}
	export HTTPS_PROXY=${PROXY_URL}
fi
if [ ! -z "${PROXY_NO_PROXY}" ]; then
	export no_proxy=${PROXY_NO_PROXY}
	export NO_PROXY=${PROXY_NO_PROXY}
fi
