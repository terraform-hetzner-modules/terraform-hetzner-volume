mock_provider "hcloud" {
  mock_resource "hcloud_volume" { defaults = { id = "123" } }
}
run "plan_with_unknown_server_id" {
  command = plan
  module { source = "./tests/setup" }
}
