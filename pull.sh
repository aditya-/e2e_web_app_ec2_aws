#!/bin/bash
# created for automatic push
branch_name=$1

if [[ -n "$branch_name" ]]; then
    git add .
    git commit -am "before pull to $1"
    # git pull origin master
    git pull origin "$1"
# ssh vm_srvr << EOF
#  cd /etc/ansible/roles/aws_automation && sh pull.sh
#  exit
# EOF
else
    echo "argument error"
fi