terraform {
  required_version = ">= 1.7"
  required_providers {
    hcloud = { source = "hetznercloud/hcloud", version = "~> 1.70" }
  }
}
resource "terraform_data" "server" { input = 123 }
module "volume" {
  source    = "../.."
  name      = "unknown-id"
  attach    = true
  server_id = terraform_data.server.output
}
output "attachment" {
  value       = module.volume.attachment
  description = "Attachment with a server ID that is unknown until apply."
}
