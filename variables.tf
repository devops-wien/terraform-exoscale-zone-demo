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

/*
variable "email" {
  type    = string
  default = "example@example.org"
}

variable "target_port" {
  type    = number
  default = 3000
}

variable "image" {
  type    = string
  default = "devopswien/docker-nextjs-demo"
}
*/

variable "cloudflare_api_token" {
  type        = string
  description = "api_token (String) The API Token for operations. Alternatively, can be configured using the CLOUDFLARE_API_TOKEN environment variable"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "(Required) The DNS zone ID to add the record to"
}

variable "env_name" {
  type        = string
  description = "Name"
  default     = "dev"
  validation {
    condition     = var.env_name == "dev" || var.env_name == "prod"
    error_message = "The env_name value must be a valid. (dev or prod)"
  }
}

variable "domain" {
  type        = string
  description = "Domain-Name (e.g. example.com)"
}

variable "deployment_strategy" {
  description = "(Optional) The deployment strategy to use to replace existing pods with new ones. Can be 'Recreate' or 'RollingUpdate'. Default is RollingUpdate."
  type        = string
  default     = "RollingUpdate"
  validation {
    condition     = var.deployment_strategy == "RollingUpdate" || var.deployment_strategy == "Recreate"
    error_message = "The deployment_strategy value must be valid. (RollingUpdate or Recreate)"
  }
}

variable "sks_nodepool_instance_type" {
  description = "The managed compute instances type (<family>.<size>, e.g. standard.medium; use the Exoscale CLI - exo compute instance-type list - for the list of available types)"
  type        = string
  default     = "standard.medium"
}

variable "sks_nodepool_size" {
  description = "The Noodpool Size."
  type        = number
  default     = 2
}
