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
            echo -e "$2 ERROR:: $1 installation failed $5"
            exit 1
            else
                echo -e "$3 $1 installation completed $5"
        fi
        else
            echo -e "$4 Already installed $1, no need to install again $5"
        fi
}

INSTALL $a $R $G $Y $N
INSTALL $b
INSTALL $c