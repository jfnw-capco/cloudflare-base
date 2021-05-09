resource "cloudflare_argo" "argo" {
  count          = var.enable_smart_routing ? 1 : 0
  zone_id        = data.cloudflare_zones.current.zones[0].id
  tiered_caching = "on"
  smart_routing  = "on"
}
