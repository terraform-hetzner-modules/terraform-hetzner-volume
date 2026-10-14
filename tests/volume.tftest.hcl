mock_provider "hcloud" {
  mock_resource "hcloud_volume" { defaults = { id = "123" } }
}
variables { name = "test-volume" }
run "unattached_by_default" {
  command = apply
  assert {
    condition     = output.attachment == null && output.volume_attachment_id == null
    error_message = "The documented null server_id default must create an unattached volume."
  }
}
run "legacy_attachment_and_labels" {
  command = apply
  variables {
    server_id = 123
    labels    = { environment = "test" }
    automount = false
    format    = null
  }
  assert {
    condition     = output.volume_attachment_server_id == 123 && output.volume_labels.environment == "test" && output.attachment.automount == false
    error_message = "Known server IDs must preserve v1 attachment behavior and pass through labels/automount."
  }
}
run "explicit_detach" {
  command = plan
  variables {
    server_id = 123
    attach    = false
  }
  assert {
    condition     = output.attachment == null
    error_message = "attach=false must suppress attachment even with a server ID."
  }
}
