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
  default = "example@example.org"
}

variable "target_port" {
  type    = number
  default = 80
}

variable "image" {
  type    = string
  default = "yeasy/simple-web"
}

variable "cloudflare_api_token" {
  type = string
  description = "api_token (String) The API Token for operations. Alternatively, can be configured using the CLOUDFLARE_API_TOKEN environment variable"
}

variable "cloudflare_zone_id" {
  type = string
  description = "(Required) The DNS zone ID to add the record to"
}
