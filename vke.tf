########################################
# variables
########################################
variable "vke_k8s_version" {
  description = "The version of k8s to use. See https://api.vultr.com/v2/kubernetes/versions."
  nullable    = false
  type        = string
}

variable "vke_node_plan" {
  description = "The plan for nodes in the node pool (which defines the characteristics such as vCPUs and RAM)"
  nullable    = false
  type        = string
}

########################################
# data sources
########################################
// we use the id of the first node in the node pool
// to create a data.vultr_instance type. this type
// provides up with more information than can be retrieve
// from the nested resource -- namely, the id of the VPC
// that is automatically created for k8s.
data "vultr_instance" "first_k8s_node" {
  filter {
    name   = "id"
    values = [vultr_kubernetes.wandb.node_pools[0].nodes[0].id]
  }
}

########################################
# resources
########################################
resource "vultr_kubernetes" "wandb" {
  region  = var.region
  label   = "wandb-${var.namespace}"
  version = var.vke_k8s_version

  node_pools {
    node_quantity = 1
    plan          = "vc2-2c-4gb"
    label         = "wandb-${var.namespace}"
    auto_scaler   = true
    min_nodes     = 1
    max_nodes     = 2
  }
}





