#!/usr/bin/env bash

if [ -z ${TOOL+x} ]; then
	TOOL=clickhouse-server
fi

ln -s /programs/clickhouse /programs/${TOOL}
cd /programs

if [[ "${TOOL}" == "clickhouse-server" ]]; then
	./${TOOL} --config /etc/clickhouse-server/config.xml $@
else
	./${TOOL} $@
fi
