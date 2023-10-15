terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.4"
    }

    vultr = {
      source  = "vultr/vultr"
      version = "2.16.2"
    }

  }
}

provider "kubernetes" {
  host = local.vke_endpoint

  client_certificate     = base64decode(vultr_kubernetes.wandb.client_certificate)
  client_key             = base64decode(vultr_kubernetes.wandb.client_key)
  cluster_ca_certificate = base64decode(vultr_kubernetes.wandb.cluster_ca_certificate)
}

provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 100
  retry_limit = 10
}