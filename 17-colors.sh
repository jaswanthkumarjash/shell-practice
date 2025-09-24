#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $? -ne 0 ]; then
    echo "ERROR:: Try running this script as root user"
    exit 1
fi

a=$1
b=$2
c=$3

INSTALL () {
    dnf list installed "$1"
    if [ $? -ne 0 ]; then
        echo "Not Installed yet, We need to install"
        dnf install "$1" -y
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