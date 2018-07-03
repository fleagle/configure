#!/bin/bash

# 
# @(#)TEMPLATE.sh.tpl
# Author: Zachary.Ma
# Date: 07 Jun 2017
# Discription:
#

# Only run script as root
[ `id -ur` -eq 0 ] || { echo "ERROR:: Local proxy should only be run as root" 1>&2; exit 0; }

/usr/bin/ss-local > /var/log/shadowsocks.log 2>&1 &
