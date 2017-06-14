#!/bin/bash
# created for automatic push
commit_name=$1
branch_name=$2

if [[ -n "$commit_name" && "$branch_name" ]]; then
    git add .
    git commit -am "$1"
    # git pull origin master
    git push origin "$2"
ssh ansi_aws << EOF
 cd /etc/ansible/roles/aws_automation-Multi-Tier_Application && sh pull.sh "$2"
 exit
EOF
else
    echo "argument error"
fi