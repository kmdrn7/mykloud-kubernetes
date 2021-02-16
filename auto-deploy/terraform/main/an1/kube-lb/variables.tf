variable "node_network" {
  description = "node network"
  type = string
}

variable "node_ip" {
  description = "node ip"
  type = string
}

variable "node_ip_public" {
  description = "node ip public"
  type = string
}

variable "node_preemptible" {
  description = "node preemptible"
  type = bool
  default = false
}