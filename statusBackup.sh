#!/bin/bash

##### statusBackup.sh
# A small backup status script for rdiff-backup

# define hostname of backup
HOST="pi"
BACKUP="pi::/mnt/raid1/backup/home"

# test connection. If is is, return "-"
if ping -c 1 $HOST &> /dev/null
then
        # test if rdiff-backup is running. If it is, return "*"
        if ! pgrep "rdiff-backup" > /dev/null
        then
                 # fine the time of the most recent backup
                TIME=$(rdiff-backup -l --parsable-output $BACKUP | tail -1 | grep -o -E '[0-9]+')
                # get the current time in Ecoch
                NOW=$(date +%s)
                # find time difference in seconds
                DIFF=$(expr $NOW - $TIME)
                # find time difference in days
                DAYS=$(expr $DIFF / 24 / 3600)
                echo $DAYS
        else
                echo "*"
        fi
else
        echo "-"
fi
