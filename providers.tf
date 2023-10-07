terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.16.2"
    }
  }
}

provider "vultr" {
  #api_key = "VULTR_API_KEY"
  rate_limit = 100
  retry_limit = 10
}