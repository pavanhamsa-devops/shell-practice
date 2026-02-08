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

USAGE(){
    echo -e "$R USAGE:: udo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[Default 14days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R $SOURCE_DIR does not exist $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R $DEST_DIR does not exist $N"
    exit 1
fi