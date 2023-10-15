########################################
# imported resources
########################################
resource "vultr_instance" "wandb_0" {
  depends_on = [vultr_kubernetes.wandb]

  firewall_group_id = vultr_firewall_group.wandb.id
  plan   = var.vke_node_plan
  region = var.region
}

import {
  to = vultr_instance.wandb_0
  id = vultr_kubernetes.wandb.node_pools[0].nodes[0].id
}