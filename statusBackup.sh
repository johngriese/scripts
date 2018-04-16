#!/bin/bash

# define hostname of backup
HOST="pi"

# test connection. If is is, return "-"
if ping -c 1 $HOST &> /dev/null
then
        # test if rdiff-backup is running. If it is, return "*"
        if ! pgrep "rdiff-backup" > /dev/null
        then
                BACKUP="pi:/mnt/raid1/backup"
                 # fine the time of the most recent backup
                TIME=$(rdiff-backup -l --parsable-output pi::/mnt/raid1/backup | tail -1 | grep -o -E '[0-9]+')
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
# define where the backup is
    #BACKUP="pi:/mnt/raid1/backup"
     # fine the time of the most recent backup
    #TIME=$(rdiff-backup -l --parsable-output pi::/mnt/raid1/backup | tail -1 | grep -o -E '[0-9]+')
    # get the current time in Ecoch
    #NOW=$(date +%s)
    # find time difference in seconds
    #DIFF=$(expr $NOW - $TIME)
    # find time difference in days
    #DAYS=$(expr $DIFF / 24 / 3600)
    #echo $DAYS
