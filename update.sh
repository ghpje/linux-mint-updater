#!/bin/bash

echo "*** CHECKING FOR UPDATES ***"
sudo apt update
echo ""
echo "*** AVAILABLE UPDATES ***"
sudo apt list --upgradable
echo ""
echo "*** WAITING 3 SECONDS ***"
echo ""
sleep 3
echo "*** INSTALLING UPDATES ***"
sudo apt upgrade -y
echo ""
echo "*** WAITING 3 SECONDS ***"
echo ""
sleep 3
echo "*** UPDATING DEPENDENCIES ***"
sudo apt dist-upgrade -y
echo ""
echo "*** WAITING 3 SECONDS ***"
echo ""
sleep 3
echo "*** REMOVING UNNECESSARY PACKAGES ***"
sudo apt autoremove -y
echo ""
echo "*** ALL DONE ***"
echo ""
echo "*** CLOSING IN 5 SECONDS ***"
sleep 5