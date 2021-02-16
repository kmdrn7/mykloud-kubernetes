module "kube-lb" {
  source = "./an1/kube-lb"
  node_network = google_compute_network.kubernetes.name
  node_ip = "10.146.0.10"
  node_ip_public = "34.84.99.128"
}

module "kube-master-1" {
  source = "./an1/kube-master-1"
  node_network = google_compute_network.kubernetes.name
  node_ip = "10.146.0.11"
}

module "kube-master-2" {
  source = "./an1/kube-master-2"
  node_network = google_compute_network.kubernetes.name
  node_ip = "10.146.0.12"
}

module "kube-master-3" {
  source = "./an1/kube-master-3"
  node_network = google_compute_network.kubernetes.name
  node_ip = "10.146.0.13"
}

module "kube-worker-1" {
  source = "./an2/kube-worker-1"
  node_network = google_compute_network.kubernetes.name
  node_ip = "10.174.0.11"
}

module "kube-worker-2" {
  source = "./an2/kube-worker-2"
  node_network = google_compute_network.kubernetes.name
  node_ip = "10.174.0.12"
}

module "kube-tools-1" {
  source = "./an2/kube-tools-1"
  node_network = google_compute_network.kubernetes.name
  node_ip = "10.174.0.31"
}

resource "null_resource" "generate_ansible_inventory" {
  depends_on = [
    module.kube-master-1,
    module.kube-master-2,
    module.kube-master-3,
    module.kube-worker-1,
    module.kube-worker-2,
    module.kube-tools-1,
    module.kube-lb,
  ]

  provisioner "local-exec" {
    command = "cat /dev/null > ../../ansible/inventory; echo [master] > ../../ansible/inventory; cat ../../ansible/inven/inventory_master >> ../../ansible/inventory; echo [worker] >> ../../ansible/inventory; cat ../../ansible/inven/inventory_worker >> ../../ansible/inventory; echo [lb] >> ../../ansible/inventory; cat ../../ansible/inven/inventory_lb >> ../../ansible/inventory;"
  }
}