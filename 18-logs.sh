#!/bin/bash

USERID=$(id -u)
R="\E[31M"
G="\E[32M"
Y="\E[33M"
N="\E[0m"

LOGFOLDER="/var/log/shellscript"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGFILE="$LOGFOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGFOLDER
echo "Script started executing at: $(date)"

if [ $USERID -ne 0 ]; then
    echo  "Please run this script as root user or using sudo"
    exit 1
fi

a=$1
b=$2
c=$3

INSTALL () {
    dnf list installed "$1" &>> $LOGFILE
    if [ $? -ne 0 ]; then
        echo "Not Installed yet, We need to install"
        dnf install "$1" -y &>> $LOGFILE
        if [ $? -ne 0 ]; then
            echo -e "$R ERROR:: $1 installation failed $N"
            exit 1
            else
                echo -e "$G $1 installation completed $N"
        fi
        else
            echo -e "$Y Already installed $1, no need to install again $N"
        fi
}

INSTALL $a
INSTALL $b
INSTALL $c