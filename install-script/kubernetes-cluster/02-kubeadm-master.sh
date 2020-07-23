# matikan swap
swapoff -a

# pastikan docker atau cri lainnya sudah terinstall
# tambah repo kubernetes
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# matikan selinux, karna kubernetes belum disupport selinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# install kubelet kubeadm kubectl
yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

# enable kubelet
systemctl enable --now kubelet

# tweak kernel centos
cat <<EOF > /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

# reload konfigurasi kernel
sysctl --system

# check apakah modul sudah diload pada kernel
lsmod | grep br_netfilter

# restart kubelet
systemctl daemon-reload
systemctl restart kubelet

# init kubernetes dengan kubeadm
kubeadm init --apiserver-advertise-address "192.168.10.101" --pod-network-cidr "10.10.0.0/16"

# create home folder for kube config
mkdir -p $HOME/.kube

# copy kube config
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

# change owner for kube config file
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# install calico
# setup calico yaml agar pod cidr nya sama
kubectl apply -f calico.yaml