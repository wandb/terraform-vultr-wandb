

output "endpoint" {
  value = local.vke_endpoint
}

output "k8s_default_vpc" {
  value = data.vultr_instance.first_k8s_node.vpc2_ids[0]
}

output "k8s_first_node_id" {
  value = vultr_kubernetes.wandb.node_pools[0].nodes[0].id
}