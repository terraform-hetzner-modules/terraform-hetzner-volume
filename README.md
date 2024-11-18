# _Hetzner Cloud_ - Volume <img src="https://avatars.githubusercontent.com/u/30047064?s=200&v=4" alt="Hetzner Logo" align="right" width="128"/> <img src="https://raw.githubusercontent.com/fmjstudios/artwork/refs/heads/main/projects/terraform/icon/color/terraform-icon-color.png" alt="Terraform Logo" align="right" width="128"/>

A [Terraform module][module] to create and manage hard disk volumes for your [Hetzner Cloud][hetzner] servers.

## ✨ TL;DR

```shell
module "hetzner_server_apache" {
  source = "terraform-hetzner-modules/cloud/server"
  ...
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | ~> 1.49 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automount"></a> [automount](#input\_automount) | Whether or not to automount the volume after attaching it within Hetzner Cloud. This is exclusively used within the 'hcloud\_volume\_attachment' resource as not to couple servers. Default is 'true'. | `bool` | `true` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Whether or not to enable delete protection for cloud volume. Default is 'true'. | `bool` | `true` | no |
| <a name="input_format"></a> [format](#input\_format) | The type of format to use for the cloud volume. Default is 'ext4'. | `string` | `"ext4"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location for the new Hetzner Cloud volume. This is enforced since it automatically disallows the use of 'server\_id' within the 'hcloud\_volume' resource so that volumes do NOT get coupled to servers, but instead remain their own separately manageable resource. Default is 'fsn1' and other possible values are 'nbg1', 'hel1', 'ash' or 'hil'. | `string` | `"fsn1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name to give to the new Hetzner Cloud volume. | `string` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | The ID of the Hetzner Cloud server to attach the volume to. This is exclusively used with the 'hcloud\_volume\_attachment' resource as not to couple servers and volumes like explained within the 'location' variable description. Default is 'null' in order to allow un-attached volumes to be created. | `number` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | An integer denoting the size of the volume in Gigabytes. Default is 10. | `number` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_volume_attachment_id"></a> [volume\_attachment\_id](#output\_volume\_attachment\_id) | The ID for the new volume attachment. |
| <a name="output_volume_attachment_server_id"></a> [volume\_attachment\_server\_id](#output\_volume\_attachment\_server\_id) | The server ID for the new volume attachment. |
| <a name="output_volume_delete_protection"></a> [volume\_delete\_protection](#output\_volume\_delete\_protection) | Whether or not delete protection is enabled for the new cloud volume. |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | The ID of the new cloud volume. |
| <a name="output_volume_labels"></a> [volume\_labels](#output\_volume\_labels) | The labels attached to the new cloud volume. |
| <a name="output_volume_linux_device"></a> [volume\_linux\_device](#output\_volume\_linux\_device) | The device path on the file system for the new cloud volume. |
| <a name="output_volume_location"></a> [volume\_location](#output\_volume\_location) | The Hetzner datacenter location of the new cloud volume. |
| <a name="output_volume_name"></a> [volume\_name](#output\_volume\_name) | The name for the new cloud volume. |
| <a name="output_volume_size"></a> [volume\_size](#output\_volume\_size) | An integer representing the size of the new cloud volume in GB. |
<!-- END_TF_DOCS -->

### 🔃 Contributing

Refer to our [documentation for contributors][contributing] for contributing guidelines, commit message
formats and versioning tips.

### 📥 Maintainers

This project is owned and maintained by [FMJ Studios][org] refer to the [`AUTHORS`][authors] or [`CODEOWNERS`][owners]
for more information. You may also use the linked contact details to reach out directly.

### ©️ Copyright

- _Assets provided by:_ **[HashCorp][hashicorp]**
- _Sources provided by:_ **[FMJ Studios][org]** under the **[MIT License][license]**

<!-- INTERNAL REFERENCES -->

<!-- Project references -->

<!-- File references -->

[license]: LICENSE
[contributing]: docs/CONTRIBUTING.md
[authors]: .github/AUTHORS
[owners]: .github/CODEOWNERS

<!-- General links -->

[org]: https://github.com/fmjstudios
[hashicorp]: https://www.hashicorp.com/
[hetzner]: https://hetzner.com

<!-- Third-party -->

[module]: https://registry.terraform.io/modules/terraform-hetzner-modules/compute/server/latest
