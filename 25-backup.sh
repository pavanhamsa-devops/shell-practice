#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[Default 14days]"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi