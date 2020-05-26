#!/bin/bash

set -e

echo "Dump from $DB_NAME..."

readonly local DUMP_FILE="/dump/$DB_NAME.dump.sql"
readonly local DIFF_FILE="/diff/diff_${DB_NAME}_$(date +"%Y-%m-%dT%H%M%SZ").dump.sql"

readonly local DUMP_OPTIONS=""
readonly local MYSQL_HOST_OPTS="-h ${DB_HOST} -P ${DB_PORT} -u${DB_USER} -p${DB_PASSWORD}"

mysqldump ${MYSQL_HOST_OPTS} -d --single-transaction ${DB_NAME} > ${DUMP_FILE}

echo "Completed dump"

OLD_DUMP_FILE="/repo/${SAVE_PATH}/dump/${DB_NAME}.dump.sql"

if [ -e $OLD_DUMP_FILE ]; then
echo "Old dump file exists."
echo "Make diff file"
diff -F "^CREATE" -c -I "Dump completed on" \
<(cat $OLD_DUMP_FILE | sed "s/\(AUTO_INCREMENT=\)[0-9][0-9]*/\1/") \
<(cat $DUMP_FILE | sed "s/\(AUTO_INCREMENT=\)[0-9][0-9]*/\1/") | tee -a $DIFF_FILE

if [ -s $DIFF_FILE ]; then
echo "Find diff !!"
else
echo "No diff..."
rm $DIFF_FILE
fi
fi

