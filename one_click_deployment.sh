#!/bin/bash
# created for automatic deployement to Git and Server
commit_name=$1

if [[ -n "$commit_name" ]]; then
    git add .
    git commit -am "$1"
    git push origin master
# Automatic code deployment to server    
ssh ansi_aws << EOF
 cd /etc/ansible/roles/e2e_web_app_ec2_aws/ && sh pull.sh
 exit
EOF
else
    echo "argument error"
fi