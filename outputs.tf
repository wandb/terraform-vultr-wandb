

output "endpoint" {
  value = local.vke_endpoint
}

output "k8s_default_vpc" {
  value = data.vultr_instance.first_k8s_node.vpc2_ids[0]
}

output "k8s_first_node_id" {
  value = vultr_kubernetes.wandb.node_pools[0].nodes[0].id
}

output "k8s_kubelet_auth" {
  value = {
    ca-certificate     = "${vultr_kubernetes.wandb.cluster_ca_certificate}"
    client_certificate = "${vultr_kubernetes.wandb.client_certificate}"
    client-key         = "${vultr_kubernetes.wandb.client_key}"
  }

  sensitive = true
}

output "k8s_node_ids" {
  value = vultr_kubernetes.wandb.node_pools[0].nodes[*].id
}