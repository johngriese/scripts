#!/bin/bash
#
# Simple journaling script. 
# Records journals in date and time stamped markdown files.
# files are organized by year and month in a default or user-specified location.

# USER CONFIG #

# define default journal location here:
BASE="$HOME/documents/journal"
DEFAULT="main"

# USAGE #

usage="
$(basename "$0") [-h] [-f foo] -- small bash journaling script

OPTIONS: 
  -h       -- show this help text
  -d foo   -- writes journal in directory 'foo' rather than the default.

CONFIGURATION:
Set the DIR user variable to where you'd like your journal saved
By default, entries are stored in: \$HOME/documents/journal
"

# TODO: add -l flag to list existing sub-directories in the base directory.

# OPTIONS #

# initialize DIR to DEFAULT
DIR="$DEFAULT"

while getopts "hd:" OPT; do
  case $OPT in
    h)
      echo "$usage"
      exit 0
      ;;
    d)
      DIR="$OPTARG"
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
JOURNAL="$BASE/$DIR"
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

if ! [ -e "$BASE/$DIR" ]
then 
  echo "Journal directory '$DIR' does not exist!"
  read -r -p "Create directory? [y]es/[N]o? " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then 
    mkdir -p "$BASE/$DIR"
  else
    echo "Entry aborted."
    exit 0
  fi
fi

# gets file name of today's journal
FILE="$JOURNAL/$MONTH/$DATE.md"

# make an entry at today's file
dirCheck "$JOURNAL/$MONTH"
fileCheck "$FILE"
stamp "$FILE"
append "$FILE"
exit 0
