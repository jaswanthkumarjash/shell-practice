#!/bin/bash

USERID=$(id -u)
echo "Userid is $USERID"

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user or using sudo"
    exit 1
fi
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "MySQL installation failed"
    exit 2
fi