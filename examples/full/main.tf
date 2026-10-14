resource "hcloud_server" "example" {
  name        = "volume-example"
  image       = "debian-13"
  server_type = "cx23"
  location    = "fsn1"
}
module "volumes_example" {
  source            = "../.."
  name              = "example-volume-20g-xfs"
  size              = 20
  location          = "fsn1"
  format            = "xfs"
  delete_protection = false
  labels            = { environment = "example" }
  attach            = true
  server_id         = hcloud_server.example.id
  automount         = false
}
