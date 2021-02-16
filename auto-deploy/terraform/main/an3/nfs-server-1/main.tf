module "nfs-server-1" {
  source = "../../../modules/compute"
  // =============================
  node_name = "nfs-server-1"
  node_type = "g1-small"
  node_image = "centos-cloud/centos-7-v20210122"
  node_region = "asia-northeast3"
  node_region_zone = "asia-northeast3-a"
  node_network = var.node_network
  is_preemptible = var.node_preemptible
  inventory_name = "tools"
}