provider "google" {
  version     = "~> 3.9"
	region      = "${var.region}"
	project     = "${var.project_name}"
	credentials = "${file("${var.credentials_file_path}")}"
}

provider "null" {
  version     = "~> 2.1"
}

provider "template" {
  version     = "~> 2.1"
}