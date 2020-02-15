# install utility for docker to run
yum -y install yum-utils device-mapper-persistent-data lvm2

# add docker repo
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# install docker
yum -y install docker-ce docker-ce-cli containerd.io

# enable docker at startop and start docker
systemctl enable docker
systemctl start docker
systemctl status docker

# add vagrant user to docker group
usermod -aG docker vagrant

# add nc tools to check services
yum -y install 2:nmap-ncat-6.40-19.el7.x86_64