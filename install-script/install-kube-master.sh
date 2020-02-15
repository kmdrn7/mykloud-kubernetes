# matikan swap
swapoff -a

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