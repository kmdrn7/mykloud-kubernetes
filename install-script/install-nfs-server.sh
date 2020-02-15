# install nfs-utils
yum -y install nfs-utils

# create share directory for nfs share
mkdir /var/nfs-share
chmod -R 755 /var/nfs-share
chown nfsnobody:nfsnobody /var/nfs-share

# start and enable rpcbind
systemctl enable rpcbind
systemctl start rpcbind

# start and enable nfs-server
systemctl enable nfs-server
systemctl start nfs-server

# start and enable nfs-lock
systemctl enable nfs-lock
systemctl start nfs-lock

# start and enable nfs-idmap
systemctl enable nfs-idmap
systemctl start nfs-idmap

# export nfs-share folder to out world
echo "/var/nfs-share    *(rw,sync,no_root_squash,no_all_squash)" > /etc/exports
exportfs -a

# restart nfs server
systemctl restart nfs-server

# setup firewall
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload
systemctl start firewalld
systemctl enable firewalld