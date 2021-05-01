locals {
  has_ip = var.restricted_ip != "" ? true : false
}

resource "cloudflare_zone_lockdown" "endpoint_lockdown" {
  count       = local.has_ip ? 1 : 0
  zone_id     = data.cloudflare_zones.current.zones[0].id
  paused      = false
  description = "Restrict access to Capco IP"
  urls = [
    "*.${var.domain}/*",
  ]
  configurations {
    target = "ip"
    value  = var.restricted_ip
  }
}
