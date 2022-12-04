.PHONY: backup

export MYSQL_HOST = localhost
export MYSQL_PORT = 3306
export MYSQL_USER = root
export MYSQL_PASSWORD = P@ssw0rd
current_dir = $(shell pwd)

backup:
	docker run --rm -v ${current_dir}:/data  -w /data --entrypoint=/bin/sh -e TZ=Asia/Bangkok -e MYSQL_HOST=${MYSQL_HOST} -e MYSQL_PORT=${MYSQL_PORT} -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD="${MYSQL_PASSWORD}"  huacnlee/gobackup -c  "apk add mysql-client; scripts/create_gobackup_config.sh; gobackup perform;"

