#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "ERROR:: Try running this script as root user"
    exit 1
fi

VALIDATE () {

if [ $1 -ne 0 ]; then
    echo "ERROR:: $2 installation failed"
    exit 1
    else
        echo "$2 installation successfull"
fi

}

dnf install "mysql" -y
VALIDATE $? "mysql"

dnf install nginx" -y
VALIDATE $? "nginx"

dnf install "python3" -y
VALIDATE $? "python3"