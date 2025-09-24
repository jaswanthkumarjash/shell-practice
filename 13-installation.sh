#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: Run this script as root user"
    exit 1
fi

echo -e "\n Step1"

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "MYSQL installation failed"
    exit 2
else
    echo "MYSQL installation successfull"
fi 

echo -e "\n Step2"

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "NGINX installation failed"
    exit 2
else
    echo "NGINX installation is successfull"
fi

echo -e "\n Step3"

dnf install python3 -y

if [ $? -ne 0 ]
    echo "PYTHON# installation failed"
    exit 3
else
    echo "PYTHON3 installation is successfull"
fi