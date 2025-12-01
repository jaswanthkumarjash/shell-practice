#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: You are not root user"
    exit 1
fi


DISK_USAGE=$(df -hT | grep -v Filesystem)
THRESHOLD=2
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

for l in "${DISK_USAGE[@]}"
do
    USAGE=$(echo $l | awk '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $l | awk '{print $7F}')
    if [ $USAGE -ge $THRESHOLD ]; then
        MESSAGE+="High Disk usage on $PARTITION : $USAGE % <br>"
    fi
done

echo "Message Body : $MESSAGE"

sudo sh mail.sh "jaswanthkumarjash2000@gmail.com" "High Disk Usage Alert" "High Disk Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team"


# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# MESSAGE_BODY=$4
# IP_ADDRESS=$5