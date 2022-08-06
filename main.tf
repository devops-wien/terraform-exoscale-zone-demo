resource "random_string" "prefix_name" {
  length  = 6
  lower   = true
  special = false
}

module "sks" {
  source = "devops-wien/sks/exoscale"
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
  version                = "0.0.4"
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

module "deployment" {
  source                 = "../terraform-kubernetes-deployment"
  count                  = length(var.deployments)
  client_certificate     = module.sks.client_certificate
  client_key             = module.sks.client_key
  cluster_ca_certificate = module.sks.cluster_ca_certificate
  host                   = module.sks.host
  dns_names              = var.deployments[count.index].dns_names
  image                  = var.deployments[count.index].image
  target_port            = var.deployments[count.index].target_port
}
