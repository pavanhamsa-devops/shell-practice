#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then  
    echo "$2... FAILURE"
    else
        echo "$2...SUCCESS"
    fi
}

echo "Installing nginx"
dnf install nginx -y
VALIDATE $? "Installing Nginx"

echo "Installing mysql"
dnf install mysql -y
VALIDATE $? "Installing mysql"

echo "Installing nodejs"
dnf install nodejs -y
VALIDATE $? "Installing nodejs"