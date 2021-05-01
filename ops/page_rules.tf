resource "cloudflare_page_rule" "forward" {
  zone_id = data.cloudflare_zones.current.zones[0].id
  target  = "https://${var.domain}/*"
  actions {
    forwarding_url {
      url         = "https://www.${var.domain}"
      status_code = "301"
    }
  }
}
