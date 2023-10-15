########################################
# resources
########################################

resource "vultr_firewall_group" "wandb" {
  description = "Firewall for all resources"
}

############################################
# ADD IPv4 RULES UNDER THIS COMMENT
############################################

resource "vultr_firewall_rule" "allow_tcp4_443" {
  firewall_group_id = vultr_firewall_group.wandb.id
  protocol = "tcp"
  ip_type = "v4"
  subnet = "0.0.0.0"
  subnet_size = 0
  port = "443"
  notes = "ACCEPT TCP4/443"
}

resource "vultr_firewall_rule" "allow_tcp4_6443" {
  firewall_group_id = vultr_firewall_group.wandb.id
  protocol = "tcp"
  ip_type = "v4"
  subnet = "0.0.0.0"
  subnet_size = 0
  port = "6443"
  notes = "ACCEPT TCP4/6443"
}

resource "vultr_firewall_rule" "allow_tcp4_8443" {
  firewall_group_id = vultr_firewall_group.wandb.id
  protocol = "tcp"
  ip_type = "v4"
  subnet = "0.0.0.0"
  subnet_size = 0
  port = "8443"
  notes = "ACCEPT TCP4/8443"
}

############################################
# ADD IPv6 RULES UNDER THIS COMMENT
############################################

resource "vultr_firewall_rule" "allow_tcp6_443" {
  firewall_group_id = vultr_firewall_group.wandb.id
  protocol = "tcp"
  ip_type = "v6"
  subnet = "::"
  subnet_size = 0
  port = "443"
  notes = "ACCEPT TCP6/443"
}

resource "vultr_firewall_rule" "allow_tcp6_6443" {
  firewall_group_id = vultr_firewall_group.wandb.id
  protocol = "tcp"
  ip_type = "v6"
  subnet = "::"
  subnet_size = 0
  port = "6443"
  notes = "ACCEPT TCP6/6443"
}

resource "vultr_firewall_rule" "allow_tcp6_8443" {
  firewall_group_id = vultr_firewall_group.wandb.id
  protocol = "tcp"
  ip_type = "v6"
  subnet = "::"
  subnet_size = 0
  port = "8443"
  notes = "ACCEPT TCP6/8443"
}