output "compute-ip" {
  value = google_compute_instance.compute.*.network_interface.0.access_config.0.nat_ip
}