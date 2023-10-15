########################################
# variables
########################################

variable "cache_plan" {
  description = "The database plan (which defines the characteristics such as vCPUs and RAM"
  nullable    = false
  type        = string
}

variable "cache_ipv4_access_list" {
  description = "A list of IPv4 addresses allowed to access the redis instance"
  nullable    = true
  type        = list(string)
}

variable "cache_password" {
  nullable = false
  type     = string
}



########################################
# resources
########################################
resource "vultr_database" "cache" {
  database_engine         = "redis"
  database_engine_version = "7"
  label                   = "wandb-${var.namespace}"
  maintenance_dow         = "sunday"
  maintenance_time        = "02:00"
  plan                    = var.cache_plan
  redis_eviction_policy   = "allkeys-lru"
  region                  = var.region
  tag                     = "wandb-${var.namespace}"
  #trusted_ips = distinct(concat(var.cache_ipv4_access_list, [ cidrhost(vultr_kubernetes.wandb.ip, 32 )]))
  trusted_ips = var.cache_ipv4_access_list
  vpc_id      = data.vultr_instance.first_k8s_node.vpc2_ids[0]
}

#resource "vultr_database_user" "cache" {
#  database_id = vultr_database.cache.id
#  username    = "wandb"
#  password = var.cache_password
#}
