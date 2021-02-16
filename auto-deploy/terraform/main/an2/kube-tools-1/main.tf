module "kube-tools-1" {
  source = "../../../modules/compute"
  // =============================
  node_name = "kube-tools-1"
  node_type = "e2-small"
  node_image = "centos-cloud/centos-7-v20210122"
  node_region = "asia-northeast2"
  node_region_zone = "asia-northeast2-a"
  node_network = var.node_network
  is_preemptible = var.node_preemptible
  inventory_name = "tools"
}