#!/bin/bash

set -e

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

# VALIDATE(){
#     if [ $1 -ne 0 ]; then  
#     echo -e "$2... $R FAILURE $N" | tee -a $LOGS_FILE
#     else
#         echo -e "$2...$R SUCCESS $N" | tee -a $LOGS_FILE
#     fi
# }

for package in $@ # sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0]; then
        echo "$package is not installed, installing it now"
        dnf install $package -y &>>$LOGS_FILE
        # VALIDATE $? "$package installation"
    else
        echo -e "$package is already installed, $Y skipping $N"
    fi
done