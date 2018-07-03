#!/bin/bash

# 
# @(#)TEMPLATE.sh.tpl
# Author: Zachary.Ma
# Date: 07 Jun 2017
# Discription:
#
#    Mount mobile phone for transmission file by mtp protocol
#
#    need install   apt-get install jmtpfs
#
# Only run script as root
[ `id -ur` -eq 0 ] || { echo "ERROR:: System mount only be run as root" 1>&2; exit 0; }

jmtpfs -o allow_other /media/zachary/
