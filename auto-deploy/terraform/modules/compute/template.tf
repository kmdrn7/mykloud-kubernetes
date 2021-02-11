data "template_file" "inventory" {
  template = file("../templates/inventory.tpl")

  depends_on = [
    google_compute_instance.compute,
  ]

  vars = {
    masters = join("\n", google_compute_instance.compute.*.network_interface.0.access_config.0.nat_ip)
  }
}

resource "null_resource" "cmd" {
  triggers = {
    template_rendered = data.template_file.inventory.rendered
  }

  provisioner "local-exec" {
    command = "echo '${data.template_file.inventory.rendered}' >> ../../ansible/inven/inventory_${var.inventory_name}"
  }
}