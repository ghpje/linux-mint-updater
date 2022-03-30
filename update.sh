#!/bin/bash

# Clears terminal screen
clear

# Log file variable
LOGFILE=update-log-$(date +%Y%m%d-%H%M%S).txt

# Set working directory variable to directory containing script
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

echo ""

# Change working directory to log directory
cd $WD/log

echo "================================" | tee $LOGFILE
printf "Update Log - " | tee -a $LOGFILE
date | tee -a $LOGFILE
echo "--------------------------------" | tee -a $LOGFILE
echo "*** CHECKING FOR UPDATES ***" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
sudo apt-get update | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "*** AVAILABLE UPDATES ***" | tee -a $LOGFILE
sudo apt list --upgradable | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "*** UPDATING PACKAGES AND DEPENDENCIES ***" | tee -a $LOGFILE
sudo apt-get dist-upgrade -y | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "*** REMOVING UNNECESSARY PACKAGES ***" | tee -a $LOGFILE
sudo apt-get autoremove -y | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "*** ALL DONE ***" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "See log file: $WD/log/$LOGFILE"