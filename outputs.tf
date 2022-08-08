output "prefix_name" {
  value = local.prefix_name
}

output "url" {
  value = local.url
}

output "cluster_url" {
  value = local.cluster_url
}

output "cloudflare_api_token" {
  value = var.cloudflare_api_token
  sensitive = true
}

output "cloudflare_zone_id" {
  value = var.cloudflare_zone_id
}
output "nlb_ip_address" {
  value = module.sks_nodepool.nlb_ip_address
}

output "client_certificate" {
  value     = module.sks.client_certificate
  sensitive = true
}

output "client_key" {
  value     = module.sks.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = module.sks.cluster_ca_certificate
  sensitive = true
}

output "host" {
  value = module.sks.host
}

output "domain" {
  value = var.domain
}

output "env_name" {
  value = var.env_name
}
