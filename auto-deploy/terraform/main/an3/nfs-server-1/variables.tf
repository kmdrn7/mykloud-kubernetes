variable "node_network" {
  description = "node network"
  type = string
}

variable "node_preemptible" {
  description = "node preemptible"
  type = bool
  default = false
}