resource "cloudflare_rate_limit" "limit" {
  zone_id   = data.cloudflare_zones.current.zones[0].id
  threshold = var.rate_limit_threshold
  period    = var.rate_limit_period # secs
  match {
    request {
      schemes = ["HTTP", "HTTPS"]
    }
  }
  action {
    mode    = var.rate_limit_action_mode
    timeout = var.rate_limit_action_timeout # secs
  }
  disabled    = var.rate_limit_disabled
  description = "Overarching rate limit to cover all subdomains"
}
