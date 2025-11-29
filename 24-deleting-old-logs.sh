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

if [ ! -d $SOURCE_DIR ]; then
    echo -e "ERROR:: $SOURCE_DIR does not exist"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f)

echo ${FILES[@]}

for f in ${FILES[@]}
do
    FILE_NAME=$( echo $f | awk -F "/" '{print $NF}' )
    echo "Deleting the file: $FILE_NAME"
    rm -rf $f
    echo "Deleted file: $FILE_NAME"
done