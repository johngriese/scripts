#!/bin/bash
#
# Simple script for recording notes. Records entries in dated markdown files
# and timestamps each entry.

# define notebook location here
NOTEBOOK=$HOME/documents/notebook

# gets date and time stamps
DATE=$(date +%F)
MONTH=$(date +%Y-%m)
TIMESTAMP=$(date +%F\ %I:%M\ %P)

# writes timestamp to today's notebook
echo "" >> $NOTEBOOK/$MONTH'.md'
echo '### '$TIMESTAMP':' >> $NOTEBOOK/$MONTH'.md'
echo "" >> $NOTEBOOK/$MONTH'.md'

# opens today's notebook
vim '+ normal Go' +star $NOTEBOOK/$MONTH'.md'
