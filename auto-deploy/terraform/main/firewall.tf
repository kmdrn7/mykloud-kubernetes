resource "google_compute_network" "kubernetes" {
  name = "kube-cluster"
}

resource "google_compute_firewall" "kube-firewall" {
  name    = "kube-firewall"
  network = google_compute_network.kubernetes.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = [22, 6443, 443, 80, 8080, 8088]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kube-cluster"]
}

resource "google_compute_firewall" "kube-firewall-internal" {
  name    = "kube-firewall-internal"
  network = google_compute_network.kubernetes.name

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "ipip"
  }

  allow {
    protocol = "icmp"
  }

  source_tags   = ["kube-cluster"]
  source_ranges = ["10.96.0.0/12", "10.244.0.0/16"]
  target_tags   = ["kube-cluster"]
}

resource "google_compute_firewall" "kube-firewall-lb" {
  name    = "kube-firewall-lb"
  network = google_compute_network.kubernetes.name

  allow {
    protocol = "tcp"
    ports = [22, 80, 443, 6443]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kube-lb"]
}

resource "google_compute_firewall" "kube-tools" {
  name    = "kube-tools"
  network = google_compute_network.kubernetes.name

  allow {
    protocol = "tcp"
    ports = [22, 8080]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["kube-tools"]
}