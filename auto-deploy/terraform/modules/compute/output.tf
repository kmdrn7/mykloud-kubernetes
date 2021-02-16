output "compute-ip" {
  value = google_compute_instance.compute.*.network_interface.0.network_ip
}