#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
MESSAGE=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%s") | $1"
}

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=5

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')

        if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
            MESSAGE+="High disk usage on $PARTITION:$USAGE \n"
        fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"

sh mail.sh "pavanhamsa2023@gmail.com" "High disk utilisation alert on $IP_ADDRESS" "$MESSAGE" "HIGH_DISK_USAGE" "$IP_ADDRESS" "DevOps Team" 