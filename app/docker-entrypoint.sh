#!/bin/sh

# log format
# [2019-12-13 09:23:32.070 +08:00] [INFO] (GoID:01172) (controller.Proxy.Proxy:15)  Request received:  GET /mgr/organizations

set -e

logdir='/var/log/myapp/default'
[[ -d "${logdir}" ]] || mkdir -p "${logdir}"
logfile=stdout.log
logfile="$logdir/$logfile"
log() {
	# alpine中date不支持 %:z
	# local time=$(date +'%Y-%m-%d %H:%M:%S.%s %:z')
	local time=$(date +'%Y-%m-%d %H:%M:%S.%s')
	time="$time +08:00"
	local level="${1:-INFO}"
	local goid="$RANDOM"
	local func="simulate.func.log:$RANDOM"
	local msg="${2:-no-message-passed}"

	local host=`echo "$RANDOM$(date)" | md5sum | sed 's/-//g' | sed 's/\s*$//g'`

	echo "[${time}] [${level}] (GoID:${goid}) (${func}) ${msg}" >> "${logfile}"
	
	# 模拟两种日志格式
	echo "[${host}] [${time}] [${level}] (GoID:${goid}) (${func}) ${msg}" >> "${logfile}"
}

while true; do
	log
	interval=$((1+RANDOM%5)) # 1-5 seconds
	sleep $interval
done
