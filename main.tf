module "sks" {
  source  = "devops-wien/sks/exoscale"
  version = "0.0.1"

  key = "${var.sks_key}"
  secret = "${var.sks_secret}"
}

