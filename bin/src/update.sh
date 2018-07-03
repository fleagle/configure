#!/bin/bash

# 
# @(#)TEMPLATE.sh.tpl
# Author: Zachary.Ma
# Date: 07 Jun 2017
# Discription:
#

# Only run script as root
[ `id -ur` -eq 0 ] || { echo "ERROR:: System update should only be run as root" 1>&2; exit 0; }

apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoremove && apt-get autoclean

