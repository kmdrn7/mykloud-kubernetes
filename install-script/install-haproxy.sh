# install net tools
yum -y install net-tools

# install haproxy
yum -y install haproxy

# set selinux setting
setsebool -P haproxy_connect_any 1