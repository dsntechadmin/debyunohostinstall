#!/bin/sh

# Welcome to the YUNOHOST INSTALL TOOL FOR DEBIAN 12 VPS OR VDS
# (THIS IS NOT FOR OVH HOSTED VPS DEBIAN 12 SERVERS)
# Made by Sean Campbell from Chat Safe Media, and it is used for a
# Sean's Tech Talk HOW TO Video available on YouTube and CSPTube
# This combines the three things that usually take a long time to type!
# PLEASE RUN AS ROOT ONLY
# REBOOT.
# PLEASE RUN THIS SCRIPT ON A TEST MACHINE BEFORE USING THIS ON A PRODUCTION SERVER

# set your domain / website as your hostname for the store and
# set the hosts file as per examples using these config settings
# SAVE THESE AS WHEN YOU REBOOT, THIS WILL BE YOUR URL IF YOU DECIDE TOUSE THESE IN NPM
# IF YOU HAVE IPv6 ADD THE FINAL LINE
# 127.0.0.1	domain.needed
# 127.0.1.1	domain.needed
# ::1		domain.needed
nano /etc/hostname && nano /etc/hosts && timedatectl set-timezone Australia/Sydney

# updating repos and upgrading for debian 12
apt update && apt -y upgrade


# FROM THIS POINT ON THE FOLLOWING IS AUTOMATED AND WILL REBOOT AUTOMATICALLY
# PLEASE WAIT UP TO 5 MINUTES BEFORE ACCESSING SSH AGAIN

# installing the programs needed for yunohost, plus build tools
apt -y install ca-certificates gnupg build-essential curl wget apt-transport-https nano nodejs npm


# INSTALLING VTOP and installing Y U NO Host
npm install -g vtop && curl https://install.yunohost.org | bash

# NOW REBOOTING, REMOVING OLD KERNEL PACKAGES AND OLD GRUB ENTRIES
apt -y autoremove && reboot
