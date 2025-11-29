#!/bin/bash
: << "EOF"
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: You dont have root access"
    exit 1
fi
EOF

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-practice"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

SOURCE_DIR="/home/ec2-user/app-logs"

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime -14)

for f in ${FILES}
do
    echo "Deleting the file: $f"
    rm -rf $f
    echo "Deleted the file: $f"
done