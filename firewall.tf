########################################
# variables
########################################

########################################
# resources
########################################

resource "vultr_firewall_group" "wandb" {
  description = "Firewall for all resources"
}

