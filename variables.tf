variable "sks_key" {
  description = "Exoscale account API key"
  type        = string
}

variable "sks_secret" {
  description = "Exoscale account API secret"
  type        = string
}

variable "dns_names" {
  type    = list(string)
  default = ["example.com"]
}

variable "target_port" {
  type    = number
  default = 80
}

variable "image" {
  type    = string
  default = "yeasy/simple-web"
}

variable "email" {
  type    = string
  default = "exmaple@example.org"
}