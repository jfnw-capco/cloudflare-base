resource "cloudflare_zone_settings_override" "settings" {
  zone_id = data.cloudflare_zones.current.zones[0].id
  settings {
    always_online            = "on"
    automatic_https_rewrites = "on"
    brotli                   = "on"
    browser_check            = "on"
    development_mode         = "off"
    email_obfuscation        = "on"
    hotlink_protection       = "on"
    http2                    = var.plan == "free" ? null : "on"
    http3                    = "on"
    ip_geolocation           = "on"
    ipv6                     = "on"
    mirage                   = var.plan == "free" ? null : "on"
    opportunistic_encryption = "on"
    opportunistic_onion      = "off"
    privacy_pass             = "on"
    server_side_exclude      = "on"
    tls_client_auth          = "on"
    waf                      = var.plan == "free" ? null : "on"
    webp                     = var.plan == "free" ? null : "off"
    websockets               = "on"
    zero_rtt                 = "on"
    cname_flattening         = var.plan == "free" ? null : "flatten_at_root"
    ssl                      = "strict"
    min_tls_version          = "1.3"
    tls_1_3                  = "zrt"
    browser_cache_ttl        = 10800
    challenge_ttl            = 900
    max_upload               = 100
    minify {
      css  = "on"
      js   = "on"
      html = "on"
    }
    security_header {
      enabled            = true
      preload            = true
      max_age            = 2592000
      include_subdomains = true
      nosniff            = true
    }
  }
}
