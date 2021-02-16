module "kube-lb" {
  source = "../../../modules/compute_public"
  // =============================
  node_name = "kube-lb"
  node_type = "g1-small"
  node_image = "centos-cloud/centos-7-v20210122"
  node_region = "asia-northeast1"
  node_region_zone = "asia-northeast1-a"
  node_network = var.node_network
  node_ip = var.node_ip
  node_ip_public = var.node_ip_public
  is_preemptible = var.node_preemptible
  inventory_name = "lb"
}