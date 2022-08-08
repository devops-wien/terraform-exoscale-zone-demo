provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# remove (only 4 migrate)
provider "kubernetes" {
  host                   = module.sks.host
  client_certificate     = base64decode(module.sks.client_certificate)
  client_key             = base64decode(module.sks.client_key)
  cluster_ca_certificate = base64decode(module.sks.cluster_ca_certificate)
}
