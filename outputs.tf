output "volume_id" {
  value       = hcloud_volume.current.id
  description = "The ID of the new cloud volume."
}

output "volume_name" {
  value       = hcloud_volume.current.name
  description = "The name for the new cloud volume."
}

output "volume_size" {
  value       = hcloud_volume.current.size
  description = "An integer representing the size of the new cloud volume in GB."
}

output "volume_location" {
  value       = hcloud_volume.current.location
  description = "The Hetzner datacenter location of the new cloud volume."
}

output "volume_labels" {
  value       = hcloud_volume.current.labels
  description = "The labels attached to the new cloud volume."
}

output "volume_linux_device" {
  value       = hcloud_volume.current.linux_device
  description = "The device path on the file system for the new cloud volume."
}

output "volume_delete_protection" {
  value       = hcloud_volume.current.delete_protection
  description = "Whether or not delete protection is enabled for the new cloud volume."
}

output "volume_attachment_id" {
  value       = try(hcloud_volume_attachment.current[0].id, null)
  description = "The ID for the new volume attachment."
}

output "volume_attachment_server_id" {
  value       = try(hcloud_volume_attachment.current[0].server_id, null)
  description = "The server ID for the new volume attachment."
}

output "volume" {
  value       = hcloud_volume.current
  description = "Complete volume attributes, including format and attachment status."
}
output "attachment" {
  value       = try(hcloud_volume_attachment.current[0], null)
  description = "Complete attachment attributes, or null for an unattached volume."
}
