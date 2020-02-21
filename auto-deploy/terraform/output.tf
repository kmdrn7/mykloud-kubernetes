output "kube-master-1-ip" {
  value = "${google_compute_instance.kube-master-1.*.network_interface.0.access_config.0.nat_ip}"
}

output "kube-node-1-ip" {
  value = "${google_compute_instance.kube-node-1.*.network_interface.0.access_config.0.nat_ip}"
}