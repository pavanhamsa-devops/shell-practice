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

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%s") | $1" | tee -a $LOGS_FILE
}
if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Source directory: $SOURCE_DIR does not exist $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination directory: $DEST_DIR does not exist $N"
    exit 1
fi

#Find the files
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "backup started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"

#To check if variable is empty or not
if [ -z "$FILES" ]; then
    log "no files to archive"
else
    #app-logs-$timestamp.zip - format of zip file
    log "$G files found to archive: $FILES $N"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    echo "Archive name: $ZIP_FILE_NAME"
fi