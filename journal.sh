#!/bin/bash
#
# Simple journaling script. Records journals in dated markdown files
# and timestamps each entry.

# define journal location here
JOURNAL=$HOME/documents/journal

# gets date and time stamps
DATE=$(date +%Y-%m-%d)
TIME=$(date +%I:%M\ %p)

# writes timestamp to today's journal
echo $TIME' -  ' >> $JOURNAL/$DATE'.md'

# opens today's journal
vim '+ normal GA' $JOURNAL/$DATE'.md'
