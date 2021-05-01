resource "cloudflare_waf_group" "waf_groups" {
  for_each = toset(["07d700cf30fda7548be94ff01087d0c4", # OWASP Bad Robots
    "6293bbf04711b8511fc68dfd85d254b3",                 # OWASP Common Exceptions
    "5461c3844f6b5597986ae41d052a7cbd",                 # OWASP Generic Attacks
    "9ab3180a92fde4bfb370a6e0a33842d2",                 # OWASP HTTP Policy
    "89f0f131c955630147a5e8b6b13f5ca8",                 # OWASP Protocol Anomalies
    "bcdccfe389a27a990711d45d4bc67e24",                 # OWASP Protocol Violations
    "eac6910f74e3b80153bb52ac2fb82cc8",                 # OWASP Request Limits
    "9643591b65fc5d12056969519de4cb7b",                 # OWASP Slr Et Lfi Attacks
    "6035463b92082256c0c4cf5ce5028a98",                 # OWASP Slr Et RFI Attacks
    "40545574c88d71badb13d54240652ad6",                 # OWASP Slr Et SQLi Attacks
    "c013ec3948431586f65b3d2a1a15c037",                 # OWASP Slr Et XSS Attacks
    "a0608e0c654339c108ca9715a7b1fb2c",                 # OWASP SQL Injection Attacks
    "3d8fb0c18b5a6ba7682c80e94c7937b2",                 # OWASP Tight Security
    "5664cc2f83dd55b71929c062921078aa",                 # OWASP Trojans
    "a7b84f7c2c7fc5ef46ff02095e6daaec",                 # OWASP Uri SQL Injection Attacks
    "cfda825dfda411ea218cb70e6c88e82e",                 # OWASP Uri XSS Attacks
    "d508327aee37c147e03873f79288bb1d",                 # OWASP XSS Attacks
    "da9d75b083345c63f48e6fde5f617a8b",                 # Cloudflare Miscellaneous
    "f90712123fb02287348dd34c0a282bb9"                  # Cloudflare Specials
  ])
  zone_id  = data.cloudflare_zones.current.zones[0].id
  group_id = each.key
  mode     = "on"
}
