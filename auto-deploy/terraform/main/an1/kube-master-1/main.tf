module "kube-master-1" {
  source = "../../../modules/compute"
  // =============================
  node_name = "kube-master-1"
  node_type = "e2-medium"
  node_image = "centos-cloud/centos-7-v20210122"
  node_region = "asia-northeast1"
  node_region_zone = "asia-northeast1-a"
  node_network = var.node_network
  node_ip = var.node_ip
  is_preemptible = var.node_preemptible
  inventory_name = "master"
}