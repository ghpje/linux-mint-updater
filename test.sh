#!/bin/bash

# Clear terminal screen
clear

# Log file variable
LOGFILE=update-log-$(date +%Y%m%d-%H%M%S).txt

# Working directory variable
WD="$(dirname "$(readlink -f "$0")")"

# Create directory to store log file if it does not exist
if [ ! -d "$WD/log" ] 
then
    echo "Directory \"$WD/log\" DOES NOT exist."
    mkdir -p "$WD/log"
    echo "Created directory \"$WD/log\""
else
    echo "Found directory \"$WD/log\"."
    echo "Log file will be saved here,"
fi

# Change working directory to log directory
cd $WD/log

# Creates log file or overwrites existing log
printf "Update Log - " | tee $LOGFILE

# append date to log file
date | tee -a $LOGFILE

# Print working directory
pwd | tee -a $LOGFILE

echo "See log file: $WD/log/$LOGFILE"