variable "domain" {
  description = "cloudflare domain name to use"
  type        = string
}

variable "plan" {
  description = "Indicates if pro features are available"
  type        = string
}

variable "rate_limit_threshold" {
  description = "The threshold in seconds for the overarching rate limit"
  type        = number
}

variable "rate_limit_period" {
  description = "The period for the overarching rate limit"
  type        = number
}

variable "rate_limit_action_mode" {
  description = "The action to perform for a breach of the overarching rate limit"
  type        = string

}

variable "rate_limit_action_timeout" {
  description = "The time in seconds the breached rate limit action applies"
  type        = number
}

variable "rate_limit_disabled" {
  description = "Indicates if the overarching rate limit is disabled"
  type        = bool
}

variable "enable_smart_routing" {
  description = "Indicates if smart routing is enabled"
  type        = bool
}

variable "enable_dnssec" {
  description = "Indicates if DNSSec is enabled"
  type        = bool
  default     = false
}

variable "restricted_ip" {
  description = "IP to restrict requests to"
  type        = string
  default     = ""
}
