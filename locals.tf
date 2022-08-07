locals {
  prefix_name = "sks-${random_string.prefix_name.result}"
  hostname = cloudflare_record.sks_record.hostname
  url = "https://${local.hostname}"
}
