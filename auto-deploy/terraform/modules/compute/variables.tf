variable "node_name" {
  description = "Name of node"
  type = string
}

variable "node_type" {
  description = "Type of node"
  type = string
  default = "e2-medium"
}

variable "node_image" {
  description = "node image"
  type = string
  default = "centos-cloud/centos-7-v20210122"
}

variable "node_region" {
  description = "node region"
  type = string
	default = "us-central1"
}

variable "node_region_zone" {
  description = "node region zone"
  type = string
  default = "us-central1-a"
}

variable "node_network" {
  description = "node network"
  type = string
}

variable "public_key_path" {
  description = "node public key path"
  type = string
  default = "~/.ssh/gcp-key.pub"
}

variable "private_key_path" {
  description = "node privat key path"
  type = string
  default = "~/.ssh/gcp-key"
}

variable "is_preemptible" {
  description = "is node preemtible"
  type = bool
  default = true
}

variable "inventory_name" {
  description = "inventory name"
  type = string
  default = ""
}