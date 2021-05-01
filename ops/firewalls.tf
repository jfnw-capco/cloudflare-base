resource "cloudflare_filter" "uk" {
  zone_id     = data.cloudflare_zones.current.zones[0].id
  description = "Deny traffic from unapproved countries"
  expression  = "(not ip.geoip.country in {\"GB\"})"
}

resource "cloudflare_firewall_rule" "uk" {
  zone_id     = data.cloudflare_zones.current.zones[0].id
  description = "Deny traffic from unapproved countries"
  filter_id   = cloudflare_filter.uk.id
  action      = "block"
}
