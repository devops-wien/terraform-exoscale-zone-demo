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
  value = local.cluster_url
}

output "cloudflare_zone_id" {
  value = var.cloudflare_zone_id
}
output "nlb_ip_address" {
  value = module.sks_nodepool.nlb_ip_address
}

output "client_certificate" {
  value = module.sks.client_certificate
}

output "client_key" {
  value = module.sks.client_key
}

output "cluster_ca_certificate" {
  value = module.sks.cluster_ca_certificate
}

output "host" {
  value = module.sks.host
}
