#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: You are not root user"
    exit 1
fi

dnf install zip -y

LOG_FOLDER=/"var/log/shell-log"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

if [ $# -lt 2 ]; then
    echo "You have to give SOURCE_DIRECTORY DESTINATION_DIRECTORY and DAYS"
    exit 1
fi


if [ ! -d $SOURCE_DIR ]; then
    echo "There is no such source directory"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]; then
    echo "There is no such destination directory"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ]; then
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DESTINATION_DIR/app-log-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"
    if [ -f $ZIP_FILE_NAME ]; then
        for f in ${FILES[@]}
        do
            FILE=$( echo $f | awk -F "/" '{print $NF}')
            echo "Deleting the file: $FILE"
            rm -rf $f
            echo "Deleted the file: $FILE"
        done
    else
        echo "Archiving the old logs failed"
    fi
else
    echo "There are no files exists with that specifications"
fi

