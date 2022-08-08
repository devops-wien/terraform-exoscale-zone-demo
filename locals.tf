locals {
  prefix_name      = "sks-${random_string.prefix_name.result}"
  hostname         = cloudflare_record.sks_record.hostname
  url              = "https://${local.hostname}"
  dns_name_cluster = "${var.env_name}.${var.domain}"
  cluster_url      = "https://${local.dns_name_cluster}"
}
