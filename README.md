# _Hetzner Cloud_ - Volume <img src="https://avatars.githubusercontent.com/u/30047064?s=200&v=4" alt="Hetzner Logo" align="right" width="128"/> <img src="https://raw.githubusercontent.com/fmjstudios/artwork/refs/heads/main/projects/terraform/icon/color/terraform-icon-color.png" alt="Terraform Logo" align="right" width="128"/>

[![License](https://img.shields.io/github/license/terraform-hetzner-modules/terraform-hetzner-volume?label=License)](https://opensource.org/licenses/MIT)
[![Terraform](https://img.shields.io/badge/Terraform-_>=_1.7-brightgreen?logo=terraform&logoColor=623CE4)][terraform]
[![Opentofu](https://img.shields.io/badge/OpenTofu-_>=_1.8-brightgreen?logo=opentofu)][opentofu]
[![CI Status](https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/actions/workflows/testing.yaml/badge.svg)](https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/blob/main/.github/workflows/testing.yaml)
[![GitHub Release](https://img.shields.io/github/v/release/terraform-hetzner-modules/terraform-hetzner-volume?label=Release)][github_releases]
[![GitHub Activity](https://img.shields.io/github/commit-activity/m/terraform-hetzner-modules/terraform-hetzner-volume?label=Commits)][github_commits]
[![Renovate](https://img.shields.io/badge/Renovate-enabled-brightgreen?logo=renovate&logoColor=1A1F6C)][renovate]
[![Pre-Commit](https://img.shields.io/badge/PreCommit-enabled-brightgreen?logo=precommit&logoColor=FAB040)][pre-commit]

A [Terraform module][module] to create and manage hard disk volumes for your [Hetzner Cloud][hetzner] servers.

## ✨ TL;DR

```shell
module "hetzner_volume_apache_server" {
  source = "terraform-hetzner-modules/cloud/volume"
  ...
}
```

<!-- BEGIN_TF_DOCS -->

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider_hcloud) | ~> 1.49 |

## Modules

No modules.

## Inputs

| Name                                                                                 | Description                                                                                                                                                                                                                                                                                                                                             | Type     | Default  | Required |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------- | :------: |
| <a name="input_automount"></a> [automount](#input_automount)                         | Whether or not to automount the volume after attaching it within Hetzner Cloud. This is exclusively used within the 'hcloud_volume_attachment' resource as not to couple servers. Default is 'true'.                                                                                                                                                    | `bool`   | `true`   |    no    |
| <a name="input_delete_protection"></a> [delete_protection](#input_delete_protection) | Whether or not to enable delete protection for cloud volume. Default is 'true'.                                                                                                                                                                                                                                                                         | `bool`   | `true`   |    no    |
| <a name="input_format"></a> [format](#input_format)                                  | The type of format to use for the cloud volume. Default is 'ext4'.                                                                                                                                                                                                                                                                                      | `string` | `"ext4"` |    no    |
| <a name="input_location"></a> [location](#input_location)                            | The location for the new Hetzner Cloud volume. This is enforced since it automatically disallows the use of 'server_id' within the 'hcloud_volume' resource so that volumes do NOT get coupled to servers, but instead remain their own separately manageable resource. Default is 'fsn1' and other possible values are 'nbg1', 'hel1', 'ash' or 'hil'. | `string` | `"fsn1"` |    no    |
| <a name="input_name"></a> [name](#input_name)                                        | The name to give to the new Hetzner Cloud volume.                                                                                                                                                                                                                                                                                                       | `string` | n/a      |   yes    |
| <a name="input_server_id"></a> [server_id](#input_server_id)                         | The ID of the Hetzner Cloud server to attach the volume to. This is exclusively used with the 'hcloud_volume_attachment' resource as not to couple servers and volumes like explained within the 'location' variable description. Default is 'null' in order to allow un-attached volumes to be created.                                                | `number` | `null`   |    no    |
| <a name="input_size"></a> [size](#input_size)                                        | An integer denoting the size of the volume in Gigabytes. Default is 10.                                                                                                                                                                                                                                                                                 | `number` | `10`     |    no    |

## Outputs

| Name                                                                                                                 | Description                                                           |
| -------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| <a name="output_volume_attachment_id"></a> [volume_attachment_id](#output_volume_attachment_id)                      | The ID for the new volume attachment.                                 |
| <a name="output_volume_attachment_server_id"></a> [volume_attachment_server_id](#output_volume_attachment_server_id) | The server ID for the new volume attachment.                          |
| <a name="output_volume_delete_protection"></a> [volume_delete_protection](#output_volume_delete_protection)          | Whether or not delete protection is enabled for the new cloud volume. |
| <a name="output_volume_id"></a> [volume_id](#output_volume_id)                                                       | The ID of the new cloud volume.                                       |
| <a name="output_volume_labels"></a> [volume_labels](#output_volume_labels)                                           | The labels attached to the new cloud volume.                          |
| <a name="output_volume_linux_device"></a> [volume_linux_device](#output_volume_linux_device)                         | The device path on the file system for the new cloud volume.          |
| <a name="output_volume_location"></a> [volume_location](#output_volume_location)                                     | The Hetzner datacenter location of the new cloud volume.              |
| <a name="output_volume_name"></a> [volume_name](#output_volume_name)                                                 | The name for the new cloud volume.                                    |
| <a name="output_volume_size"></a> [volume_size](#output_volume_size)                                                 | An integer representing the size of the new cloud volume in GB.       |

<!-- END_TF_DOCS -->

### 🔃 Contributing

Refer to our [documentation for contributors][contributing] for contributing guidelines, commit message
formats and versioning tips.

### 📥 Maintainers

This project is owned and maintained by [FMJ Studios][org] refer to the [`AUTHORS`][authors] or [`CODEOWNERS`][owners]
for more information. You may also use the linked contact details to reach out directly.

### ©️ Copyright

- _Assets provided by:_ **[HashiCorp][hashicorp]**
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
[terraform]: https://terraform.io
[opentofu]: https://opentofu.org/
[hashicorp]: https://www.hashicorp.com/
[hetzner]: https://hetzner.com
[github_releases]: https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/releases
[github_commits]: https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/commits/main/

<!-- Third-party -->

[module]: https://registry.terraform.io/modules/terraform-hetzner-modules/cloud/volume/latest
[renovate]: https://renovatebot.com/
[pre-commit]: https://pre-commit.com/
