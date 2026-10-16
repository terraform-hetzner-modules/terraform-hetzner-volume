# Hetzner Volume Terraform module

Manage a block storage volume with optional formatting and a separately managed server attachment.

## Usage

Copy this configuration into `main.tf` and add the
[provider configuration](#provider-configuration) below in `versions.tf`.

```hcl
module "volume" {
  source = "terraform-hetzner-modules/volume/hetzner"

  name     = "app-data"
  size     = 50
  location = "fsn1"
  format   = "xfs"
  attach   = false
}
```

This creates an unattached, formatted volume. Add `attach = true` and `server_id` to connect it to a
server in the same location.

## Provider configuration

Export your Hetzner API token as `HCLOUD_TOKEN`. Put the following in your calling root's `versions.tf`:

```hcl
terraform {
  required_version = ">= 1.7"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.70"
    }
  }
}

provider "hcloud" {}
```

With both files in place, run `terraform init`, `terraform plan`, and `terraform apply`.
Credentials and provider configuration belong in the calling root.
Terraform >= 1.7 and OpenTofu >= 1.8 are supported.

## Examples

- [Basic](examples/basic): an unattached volume.
- [Full](examples/full): every input and a separate server attachment.

## Configuration

Set `attach = true` and provide `server_id` to manage a separate volume attachment. Use an explicit
`attach` value when the server ID is computed. An unattached volume can be managed independently of a
server; the attachment and server must be compatible with the volume's location.

`format` selects initial filesystem formatting. `automount` controls automatic mounting when attached;
with `automount = false`, configure the operating system yourself. Resizing storage may also require
filesystem changes. Review replacement and destruction plans before changing storage settings or
removing a volume, and disable deletion protection deliberately when deletion is intended.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.7 |
| hcloud | ~> 1.70 |

## Providers

| Name | Version |
| ---- | ------- |
| hcloud | ~> 1.70 |

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_volume.current](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |
| [hcloud_volume_attachment.current](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| attach | Whether to create an attachment. Set explicitly to true when server\_id is unknown until apply. Null preserves v1 behavior for known, non-null IDs. | `bool` | `null` | no |
| automount | Whether or not to automount the volume after attaching it within Hetzner Cloud. This is exclusively used within the 'hcloud\_volume\_attachment' resource as not to couple servers. Default is 'true'. | `bool` | `true` | no |
| delete\_protection | Whether or not to enable delete protection for cloud volume. Default is 'true'. | `bool` | `true` | no |
| format | The type of format to use for the cloud volume. Default is 'ext4'. | `string` | `"ext4"` | no |
| labels | Labels attached to the volume. | `map(string)` | `{}` | no |
| location | The location for the new Hetzner Cloud volume. This is enforced since it automatically disallows the use of 'server\_id' within the 'hcloud\_volume' resource so that volumes do NOT get coupled to servers, but instead remain their own separately manageable resource. Defaults to 'fsn1'; accepts any supported Hetzner location. | `string` | `"fsn1"` | no |
| name | The name to give to the new Hetzner Cloud volume. | `string` | n/a | yes |
| server\_id | The ID of the Hetzner Cloud server to attach the volume to. This is exclusively used with the 'hcloud\_volume\_attachment' resource as not to couple servers and volumes like explained within the 'location' variable description. Default is 'null' in order to allow un-attached volumes to be created. | `number` | `null` | no |
| size | An integer denoting the size of the volume in Gigabytes. Default is 10. | `number` | `10` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| attachment | Complete attachment attributes, or null for an unattached volume. |
| volume | Complete volume attributes, including format and attachment status. |
| volume\_attachment\_id | The ID for the new volume attachment. |
| volume\_attachment\_server\_id | The server ID for the new volume attachment. |
| volume\_delete\_protection | Whether or not delete protection is enabled for the new cloud volume. |
| volume\_id | The ID of the new cloud volume. |
| volume\_labels | The labels attached to the new cloud volume. |
| volume\_linux\_device | The device path on the file system for the new cloud volume. |
| volume\_location | The Hetzner datacenter location of the new cloud volume. |
| volume\_name | The name for the new cloud volume. |
| volume\_size | An integer representing the size of the new cloud volume in GB. |
<!-- END_TF_DOCS -->

## Contributing

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for local checks and contribution guidelines, and
[UPGRADING.md](docs/UPGRADING.md) for compatibility and live acceptance checks. The generated
[schema report](docs/SCHEMA.md) documents provider coverage and intentional omissions.

## Authors

Maintained by [Terraform Hetzner Modules](https://github.com/terraform-hetzner-modules).
See [AUTHORS](.github/AUTHORS) and [CODEOWNERS](.github/CODEOWNERS).

## License

MIT. See [LICENSE](LICENSE).
