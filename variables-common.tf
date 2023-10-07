variable "namespace" {
  description = "String value used when tagging resources and generating prefixed names"
  nullable    = false
  type        = string
}

variable "region" {
  description = "See https://www.vultr.com/features/datacenter-locations/ -OR- https://www.vultr.com/api/#tag/region/operation/list-regions"
  nullable = false
  type     = string
}