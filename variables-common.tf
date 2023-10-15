variable "namespace" {
  description = "String value used when tagging resources and generating prefixed names"
  nullable    = false
  type        = string
}

variable "region" {
  description = "See https://www.vultr.com/features/datacenter-locations/ -OR- https://www.vultr.com/api/#tag/region/operation/list-regions"
  nullable    = false
  type        = string
}

variable "vultr_api_key" {
  nullable = false
  type     = string
}

variable "vke_vpc_id" {
  description = "This variable should be set *after* the initial terraform run, when the VPC if of the VKE cluster can be seen in the consol or via CLI. Setting this value will place databases in the VKE subnet."
  nullable    = true
  type        = string
}