#!/bin/bash

USERID=$(id -u)
R="\E[31M"
G="\E[32M"
Y="\E[33M"
N="\E[0m"
LOGFOLDER="/var/log/shellscript"
SCRIPT_NAME=$( ECHO $0 | CUT -d "." -f1 )
LOGFILE="$LOGFOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGFOLDER

echo "Script started executing at: $(date)"
if [ $USERID -ne 0 ]; then
    echo  "Please run this script as root user or using sudo"


