resource "cloudflare_zone_settings_override" "settings" {
  zone_id = data.cloudflare_zones.current.zones[0].id
  settings {
    always_online            = "on"
    always_use_https         = "on"
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
    opportunistic_onion      = "on"
    privacy_pass             = "on"
    server_side_exclude      = "on"
    tls_client_auth          = "on"
    waf                      = var.plan == "free" ? null : "on"
    polish                   = var.plan == "free" ? null : "lossless"
    webp                     = var.plan == "free" ? null : "on"
    websockets               = "on"
    zero_rtt                 = "on"
    cname_flattening         = var.plan == "free" ? null : "flatten_at_root"
    rocket_loader            = "on"
    ssl                      = "strict"
    min_tls_version          = "1.3"
    tls_1_3                  = "zrt"
    pseudo_ipv4              = "add_header"
    browser_cache_ttl        = 10800
    challenge_ttl            = 900
    max_upload               = 100
    security_level           = "high"
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
