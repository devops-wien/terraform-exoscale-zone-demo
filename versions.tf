terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.43.0"
    }
  }
  required_version = ">= 1.2.6"
}
