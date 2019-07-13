# created for automatic deployement to Git and Server
read -p "Commit description: " desc
git add . && \
git add -u && \
git commit -m "$desc" && \
git push origin master
ssh aws_ansi_devel << EOF
 cd /etc/ansible/roles/e2e_web_app_ec2_aws/ && git pull origin master
 exit
EOF