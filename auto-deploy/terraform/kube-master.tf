resource "google_compute_instance" "kube-master-1" {
  name          = "kube-master-1"
  machine_type  = "n1-standard-1"
  zone          = "${var.region_zone}"
  tags          = ["kube-cluster"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7-v20200205"
    }
  }

  network_interface {
    network = "${google_compute_network.kubernetes.name}"
    access_config {
      # Ephemeral
    }
  }

  metadata = {
    ssh-keys = "root:${file("${var.public_key_path}")}"
  }

  metadata_startup_script = <<SCRIPT
adduser -m linux1-user
mkdir -p /home/linux1-user/.ssh
cat <<EOF > /home/linux1-user/.ssh/authorized_keys
${chomp(file("${var.public_key_path}"))}
EOF
chown -R linux1-user:linux1-user /home/linux1-user/.ssh
chmod 700 /home/linux1-user/.ssh
chmod 600 /home/linux1-user/.ssh/authorized_keys
echo "linux1-user   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
SCRIPT

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "linux1-user"
      host		    = "${google_compute_instance.kube-master-1.network_interface.0.access_config.0.nat_ip}"
      private_key = "${file("${var.private_key_path}")}"
      agent       = false
    }
  }

  scheduling {
    automatic_restart = false
    preemptible       = true
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}
