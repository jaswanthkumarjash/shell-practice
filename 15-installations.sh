#!/bin/bash

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
        dnf install "$a" -y
        if [ $? -ne 0 ]; then
            echo "ERROR:: $1 installation failed"
            exit 1
            else
                echo "$1 installation completed"
        fi
        else
            echo "Already installed, no need to install again"
}

INSTALL $a
INSTALL $b
INSTALL $c