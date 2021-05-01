resource "cloudflare_zone_dnssec" "dnssec" {
  count   = var.enable_dnssec ? 1 : 0
  zone_id = data.cloudflare_zones.current.zones[0].id
}
