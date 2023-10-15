########################################
# variables
########################################

variable "db_plan" {
  description = "The database plan (which defines the characteristics such as vCPUs and RAM"
  nullable    = false
  type        = string
}

variable "db_ipv4_access_list" {
  description = "A list of IPv4 addresses allowed to access the database"
  nullable    = true
  type        = list(string)
}

variable "db_password" {
  nullable = false
  type     = string
}


########################################
# resources
########################################
resource "vultr_database" "sql" {
  cluster_time_zone         = "UTC"
  database_engine           = "mysql"
  database_engine_version   = "8"
  label                     = "wandb-${var.namespace}"
  maintenance_dow           = "sunday"
  maintenance_time          = "02:00"
  mysql_long_query_time     = 2
  mysql_require_primary_key = true
  mysql_slow_query_log      = true
  plan                      = var.db_plan
  region                    = var.region
  tag                       = "wandb-${var.namespace}"
  trusted_ips               = var.db_ipv4_access_list
  vpc_id                    = data.vultr_instance.first_k8s_node.vpc2_ids[0]

  mysql_sql_modes = [
    "ANSI",
    "ERROR_FOR_DIVISION_BY_ZERO",
    "NO_ENGINE_SUBSTITUTION",
    "NO_ZERO_DATE",
    "NO_ZERO_IN_DATE",
    "STRICT_ALL_TABLES",
  ]
}

resource "vultr_database_db" "wandb_local" {
  database_id = vultr_database.sql.id
  name        = "wandb_local"
}

resource "vultr_database_user" "wandb" {
  database_id = vultr_database.sql.id
  username    = "wandb"
  password    = var.db_password
}