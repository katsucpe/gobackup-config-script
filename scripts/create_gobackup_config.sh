#!/bin/sh

CURR_DIR=$(pwd)
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

echo $DATE

TARGET_FILE=./scripts/gobackup.yml 
cp ./scripts/gobackup.template.yml ${TARGET_FILE}

sed -i  "s;<<CURR_DIR>>;${CURR_DIR};g" ${TARGET_FILE}
sed -i  "s;<<MYSQL_HOST>>;${MYSQL_HOST};g" ${TARGET_FILE}
sed -i   "s;<<MYSQL_PORT>>;${MYSQL_PORT};g" ${TARGET_FILE}
sed -i   "s;<<MYSQL_USER>>;${MYSQL_USER};g" ${TARGET_FILE}
sed -i  "s;<<MYSQL_PASSWORD>>;${MYSQL_PASSWORD};g" ${TARGET_FILE}

mkdir -p ~/.gobackup
cp ${TARGET_FILE} ~/.gobackup/
