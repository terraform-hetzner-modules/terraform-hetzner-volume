module "volumes_example" {
  source = "../.."
  name   = "example-unattached-volume"
  attach = false
}
