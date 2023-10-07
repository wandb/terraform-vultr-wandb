########################################
# resources
########################################
resource "vultr_object_storage" "wandb" {
  cluster_id = 2 # this is the silicon valley location
  label = "wandb-${var.namespace}"
}






