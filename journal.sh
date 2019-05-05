#!/bin/bash
#
# Simple journaling script. 
# Records journals in date and time stamped markdown files.
# files are organized by year and month in a default or user-specified location.

# USER CONFIG #

# define default journal location here:
JOURNAL="$HOME/journal"

# USAGE #

usage="
$(basename "$0") [-h] -- small bash journaling script

OPTIONS: 
  -h       -- show this help text

CONFIGURATION:
Set the DIR user variable to where you'd like your journal saved
By default, entries are stored in: \$HOME/documents/journal
"
# OPTIONS #
while getopts "hd:" OPT; do
  case $OPT in
    h)
      echo "$usage"
      exit 0
      ;;
    :) 
      printf "missing argument for -%s\n" "$OPTARG"
      echo "use \"-h\" for usage and instructions"
      exit 1
      ;;
    \?) 
      echo "use \"-h\" for usage and instructions"
      exit 1
      ;;
    esac
done
shift $((OPTIND - 1))

# DEFINITIONS #

# gets date and time and records stamps
MONTH=$(date +%Y-%m)
DATE=$(date +%Y-%m-%d)

# gets file name of today's journal
FILE="$JOURNAL/$MONTH/$DATE.md"

# MAIN FUNCTION #

# check if $JOURNAL exists
# if not, exit with error
if ! [ -e "$JOURNAL" ] ; then
    echo "Journal directory not found: $JOURNAL"
    echo "Make the directory or edit the journal script to set a new one."
    echo "Aborting."
    exit 1
fi

# create a month directory if one isn't already present
if ! [ -e "$JOURNAL/$MONTH" ] ; then
    mkdir "$JOURNAL/$MONTH"
fi

# make an entry at today's file
touch "$FILE"
echo "" >> "$FILE"
datestamp "$FILE"
timestamp "$FILE"
echo "" >> "$FILE"
append "$FILE"
exit 0
