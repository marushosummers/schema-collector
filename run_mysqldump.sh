#!/bin/sh

set -e

echo "Domping for ${MYSQLDUMP_DATABASE_OPTION} from ${MYSQL_HOST}..."

readonly local OUTPUT_FILE="/dumpfiles/$(date +"%Y-%m-%dT%H%M%SZ").dump.sql"
readonly local MYSQL_HOST_OPTS="-h ${MYSQL_HOST} -P ${MYSQL_PORT} -u${MYSQL_USER} -p${MYSQL_PASSWORD}"

mysqldump ${MYSQL_HOST_OPTS} ${MYSQLDUMP_OPTIONS} ${MYSQLDUMP_DATABASE_OPTION} > "${OUTPUT_FILE}"

echo "Successfully dumped"