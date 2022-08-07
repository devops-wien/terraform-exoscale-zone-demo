output "prefix_name" {
  value = local.prefix_name
}

output "url" {
  value = "https://${cloudflare_record.sks_record.hostname}"
}
