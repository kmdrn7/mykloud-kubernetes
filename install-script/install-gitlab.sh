# update centos repo
yum -y install epel-release curl policycoreutils-python

# install and run postfix for notification
yum -y install postfix
systemctl enable postfix
systemctl start postfix
systemctl status postfix

# set gitlab-ce repository
curl -sfL https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sh -

# install gitlab with external url
EXTERNAL_URL="https://gitlab.mykloud.lokal" yum -y install gitlab-ce

# reload gitlab config
gitlab-ctl reconfigure

# check gitlab with rake
gitlab-rake gitlab:check

# add gitlab to firewall
firewall-cmd --permanent --add-service={ssh,http,https}
firewall-cmd --reload