resource "random_string" "prefix_name" {
  length  = 6
  upper   = false
  special = false
}

module "sks" {
  source      = "devops-wien/sks/exoscale"
  #source      = "../terraform-exoscale-sks"
  version     = "0.0.3"
  key         = var.sks_key
  secret      = var.sks_secret
  zone        = var.zone
  prefix_name = local.prefix_name
}

module "sks_nodepool" {
  source                 = "devops-wien/sks_nodepool/exoscale"
  #source                 = "../terraform-exoscale-sks_nodepool"
  version                = "0.0.5"
  client_certificate     = module.sks.client_certificate
  client_key             = module.sks.client_key
  cluster_ca_certificate = module.sks.cluster_ca_certificate
  cluster_id             = module.sks.id
  host                   = module.sks.host
  key                    = var.sks_key
  secret                 = var.sks_secret
  email                  = var.email
  zone                   = var.zone
  prefix_name            = local.prefix_name
}

resource "cloudflare_record" "sks_record" {
  zone_id = var.cloudflare_zone_id
  name    = "${local.prefix_name}-${var.zone}"
  value   = module.sks_nodepool.nlb_ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "sks_record_env" {
  zone_id = var.cloudflare_zone_id
  name    = var.env_name
  value   = module.sks_nodepool.nlb_ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}

module "deployment" {
  source                 = "devops-wien/deployment/kubernetes"
  version                = "0.0.6"
  #source                 = "../terraform-kubernetes-deployment"
  client_certificate     = module.sks.client_certificate
  client_key             = module.sks.client_key
  cluster_ca_certificate = module.sks.cluster_ca_certificate
  host                   = module.sks.host
  dns_name               = local.hostname
  image                  = var.image
  target_port            = var.target_port
}
