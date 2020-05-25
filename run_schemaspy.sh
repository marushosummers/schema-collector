#!/bin/sh

set -e

echo "Run Schemaspy..."

/usr/local/bin/schemaspy -t $DB_TYPE \
                        -host $DB_HOST \
                        -port $DB_PORT \
                        -db $DB_NAME \
                        -u $DB_USER \
                        -p $DB_PASSWORD \
                        -s $DB_NAME \
                        -connprops useSSL\\=false 

echo "Done Schemaspy"