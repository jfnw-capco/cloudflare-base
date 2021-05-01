resource "cloudflare_argo" "argo" {
  zone_id        = data.cloudflare_zones.current.zones[0].id
  tiered_caching = "on"
  smart_routing  = "on"
}
