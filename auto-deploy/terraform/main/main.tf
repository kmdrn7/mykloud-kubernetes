module "kube-master-1" {
  source = "./an1/kube-master-1"
  node_network = google_compute_network.kubernetes.name
}

module "kube-worker-1" {
  source = "./an2/kube-worker-1"
  node_network = google_compute_network.kubernetes.name
}

module "kube-worker-2" {
  source = "./an2/kube-worker-2"
  node_network = google_compute_network.kubernetes.name
}

module "kube-lb" {
  source = "./an1/kube-lb"
  node_network = google_compute_network.kubernetes.name
}

# module "nfs-server" {
#   source = "./an2/nfs-server"
#   node_network = google_compute_network.kubernetes.name
# }

resource "null_resource" "generate_ansible_inventory" {
  depends_on = [
    module.kube-master-1,
    module.kube-worker-1,
    module.kube-worker-2,
    module.kube-lb,
  ]

  provisioner "local-exec" {
    command = "cat /dev/null > ../../ansible/inventory; echo [master] > ../../ansible/inventory; cat ../../ansible/inven/inventory_master >> ../../ansible/inventory; echo [worker] >> ../../ansible/inventory; cat ../../ansible/inven/inventory_worker >> ../../ansible/inventory; echo [lb] > ../../ansible/inventory; cat ../../ansible/inven/inventory_lb >> ../../ansible/inventory;"
  }
}