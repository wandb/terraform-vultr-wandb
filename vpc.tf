########################################
# variables
########################################
locals {
  subnet_info = split("/", var.v4_network_cidr)
}

variable "v4_network_cidr" {
  description = "The IPv4 subnet assigned to this VPC"
  nullable    = false
  type        = string
}


########################################
# resources
########################################
resource "vultr_vpc2" "wandb" {
  description    = "wandb-${var.namespace}"
  ip_type        = "v4"
  region         = var.region
  ip_block       = local.subnet_info[0]
  prefix_length  = local.subnet_info[1]
}


