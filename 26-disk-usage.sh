#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
DAYS=${3:-14}

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1
fi

mkdir -p $LOGS_FOLDER

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%s") | $1" | tee -a $LOGS_FILE
}