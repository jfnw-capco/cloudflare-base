terraform {
  required_version = "0.14.8"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.20.0"
    }
  }
  backend "gcs" {}
}

provider "cloudflare" {}

data "cloudflare_zones" "current" {
  filter {
    name = var.domain
  }
}
