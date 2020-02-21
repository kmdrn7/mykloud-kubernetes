resource "google_compute_firewall" "kube-firewall" {
  name    = "kube-firewall"
  network = "${google_compute_network.kubernetes.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = [22]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kube-cluster"]
}

resource "google_compute_network" "kubernetes" {
  name = "kube-cluster"
}