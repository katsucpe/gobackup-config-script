.PHONY: backup

backup:
	docker run --rm -v ${current_dir}:/data  -w /data --entrypoint=/bin/sh -e TZ=Asia/Bangkok -e MYSQL_HOST=${MYSQL_HOST} -e MYSQL_PORT=${MYSQL_PORT} -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD="${MYSQL_PASSWORD}"  huacnlee/gobackup -c  "apk add mysql-client; scripts/create_gobackup_config.sh; gobackup perform;"

