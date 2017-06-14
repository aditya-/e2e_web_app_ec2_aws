#!/bin/bash
# created for automatic push
commit_name=$1
branch_name=$2

if [[ -n "$commit_name" && "$branch_name" ]]; then
    git add .
    git commit -am "$1"
    # git pull origin master
    git push origin "$2"
# ssh vm_srvr << EOF
#  cd /etc/ansible/roles/aws_automation && sh pull.sh
#  exit
# EOF
else
    echo "argument error"
fi
