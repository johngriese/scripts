#!/bin/bash
#
# Simple journaling script. 
# Records journals in date and time stamped markdown files.
# files are organized by year and month in a default or user-specified location.

# USER CONFIG #

# define default journal location here:
JOURNAL="$HOME/documents/journal"

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

# gets timestamp and datestamp for journal entry
TIMESTAMP=$(date +%I:%M\ %P)
DATESTAMP=$(date +%A\ %b\ %d)

# defines time/datestamp function
stamp () {
  if grep -Fxq '## '"$DATESTAMP"' ##' "$1"
    then
      echo "" >> "$1"
      echo '### '"$TIMESTAMP"' ###' >> "$1"
      echo "" >> "$1"
    else
      echo "" >> "$1"
      echo '## '"$DATESTAMP"' ##' >> "$1"
      echo "" >> "$1"
      echo '### '"$TIMESTAMP"' ###' >> "$1"
      echo "" >> "$1"
  fi
}

# opens today's journal appending to last line
append () { 
  vim '+ normal G$' +star "$1"
}
# checks for the given file or folder.
# makes one if not found.
fileCheck () {
  if ! [ -e "$1" ]
  then
    touch "$1"
  fi
}

dirCheck () {
  if ! [ -e "$1" ]
  then
    mkdir -p "$1"
  fi
}

# MAIN FUNCTION #

# check for BASE and DEFAULT
dirCheck "$BASE/$DEFAULT"

# check for specified DIR
# ask for user input if not existing

# gets file name of today's journal
FILE="$JOURNAL/$MONTH/$DATE.md"

# make an entry at today's file
dirCheck "$JOURNAL/$MONTH"
fileCheck "$FILE"
stamp "$FILE"
append "$FILE"
exit 0
