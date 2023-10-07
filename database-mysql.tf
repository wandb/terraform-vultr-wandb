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
  type = list(string)
}

variable "db_password" {
  nullable = false
  type = string
}


########################################
# resources
########################################
resource "vultr_database" "sql" {
  cluster_time_zone = "UTC"
  database_engine = "mysql"
  database_engine_version = "8"
  label = "wandb-${var.namespace}"
  maintenance_dow = "sunday"
  maintenance_time = "02:00"
  mysql_long_query_time = 2
  mysql_slow_query_log = true
  plan = var.db_plan
  region = var.region
  tag = "wandb-${var.namespace}"
  vpc_id = vultr_vpc2.wandb.id

  #trusted_ips = distinct(concat(
  #  var.ipv4_cidr_db_access
  #))
}

resource "vultr_database_db" "wandb_local" {
  database_id = vultr_database.sql.id
  name = "wandb_local"
}

resource "vultr_database_user" "wandb" {
  database_id = vultr_database.sql.id
  username    = "wandb"
  encryption = "mysql_native_password"
  password = var.db_password
}