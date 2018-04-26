#!/bin/bash

##### bkp.sh #####
# A tiny backup script using rdiff-backup.

rdiff-backup \
        -v5 \
        --exclude $HOME'/.*' \
        --exclude $HOME/temp \
        --exclude $HOME/downloads \
        $HOME \
        pi::/mnt/raid1/backup/home

rdiff-backup \
        -v5 \
        /var/lib/dokuwiki/data \
        pi::/mnt/raid1/backup/dokuwiki/data

rdiff-backup \
        -v5 \
        /etc/webapps/dokuwiki \
        pi::/mnt/raid1/backup/dokuwiki/conf
