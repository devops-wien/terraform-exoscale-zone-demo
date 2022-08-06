variable "zone" {
  description = "Zone"
  type        = string
  default     = "at-vie-1"
}

variable "sks_key" {
  description = "Exoscale account API key"
  type        = string
}

variable "sks_secret" {
  description = "Exoscale account API secret"
  type        = string
}

variable "email" {
  type    = string
  default = "exmaple@example.org"
}

variable "deployments" {
  description = "(Block) Deployment image / target_port"
  type        = list(object({
    target_port = number
    image       = string
    dns_names   = list(string)
  }))
  default = [
    {
      target_port = 80
      image       = "yeasy/simple-web"
      dns_names   = ["example.com"]
    }
  ]
}


