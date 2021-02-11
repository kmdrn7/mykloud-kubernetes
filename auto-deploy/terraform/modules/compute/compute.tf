resource "google_compute_instance" "compute" {
  name          = var.node_name
  machine_type  = var.node_type
  zone          = var.node_region_zone
  tags          = ["kube-cluster"]

  boot_disk {
    initialize_params {
      image = var.node_image
    }
  }

  network_interface {
    network = var.node_network
    access_config {
      # Ephemeral
    }
  }

  can_ip_forward = true

  metadata = {
    ssh-keys = "root:${file(var.public_key_path)}"
  }

  metadata_startup_script = <<SCRIPT
adduser -m linux1-user
mkdir -p /home/linux1-user/.ssh
cat <<EOF > /home/linux1-user/.ssh/authorized_keys
${chomp(file(var.public_key_path))}
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
      host		    = google_compute_instance.compute.network_interface.0.access_config.0.nat_ip
      private_key = file(var.private_key_path)
      agent       = false
    }
  }

  scheduling {
    automatic_restart = false
    preemptible       = var.is_preemptible
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}
