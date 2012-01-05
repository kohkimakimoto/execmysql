#!/bin/bash

# Configurations
MYSQL_CMD="mysql -uyouruser -pyourpassword -h127.0.0.1 databasename --default-character-set=utf8 --batch"

# Initialize process
CMD_DIR=$(cd $(dirname $0);pwd)
SQL_DIR=${CMD_DIR}/../sql
OUTPUT_DIR=${CMD_DIR}/../output

# Execute sql
find ${SQL_DIR} -name '*.sql' | while read sql; do
  echo `date '+%Y-%m-%d'`
  sqlfile=`basename ${sql}`
  $MYSQL_CMD < ${sql} > ${OUTPUT_DIR}/${sqlfile}.txt
done;





