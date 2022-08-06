module "sks" {
  source  = "devops-wien/sks/exoscale"
  version = "0.0.2"

  key    = var.sks_key
  secret = var.sks_secret
}

module "sks_nodepool" {
  source                 = "devops-wien/sks_nodepool/exoscale"
  version                = "0.0.2"
  client_certificate     = module.sks.client_certificate
  client_key             = module.sks.client_key
  cluster_ca_certificate = module.sks.cluster_ca_certificate
  cluster_id             = module.sks.id
  host                   = module.sks.host
  key                    = var.sks_key
  secret                 = var.sks_secret
  security_group_ids     = [module.sks.sks-security-group-id]
  email                  = var.email
}

module "deployment" {
  source                 = "devops-wien/deployment/kubernetes"
  client_certificate     = module.sks.client_certificate
  client_key             = module.sks.client_key
  cluster_ca_certificate = module.sks.cluster_ca_certificate
  host                   = module.sks.host
  dns_names              = var.dns_names
  image                  = var.image
  target_port            = var.target_port
}
