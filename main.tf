locals {
  attach = var.attach != null ? var.attach : var.server_id != null
}

# -----------------------------------------------
#  Hetzner Volume
# -----------------------------------------------

resource "hcloud_volume" "current" {
  labels            = var.labels
  name              = var.name
  size              = var.size
  location          = var.location
  format            = var.format
  delete_protection = var.delete_protection
}

# -----------------------------------------------
#  Hetzner Volume Attachment
# -----------------------------------------------

resource "hcloud_volume_attachment" "current" {
  count     = local.attach ? 1 : 0
  volume_id = hcloud_volume.current.id
  server_id = var.server_id
  automount = var.automount
}

# Preserve existing v1 attachment state when enabling conditional attachment.
moved {
  from = hcloud_volume_attachment.current
  to   = hcloud_volume_attachment.current[0]
}
