## [2.0.0](https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/compare/v1.0.0...v2.0.0) (2026-10-14)

### ⚠ BREAKING CHANGES

* **module/volume:** require Terraform >= 1.7 and hcloud ~> 1.70. Set attach
explicitly when server_id is unknown until apply. A null server_id now
creates an unattached volume, as documented.

### Features

* **module/volume:** refresh volume attachments and repository tooling ([5d3748f](https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/commit/5d3748f781aa3481968774d1a8e14ad2bfb46de2))

### Bug Fixes

* **ci:** propagate verified release and Super-Linter fixes ([a4f21ea](https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/commit/a4f21eacc00b42bc19560be7c0215db8621ceaf0))

## 1.0.0 (2024-11-19)

### Features

* initial release `v1.0.0` ([d1a73eb](https://github.com/terraform-hetzner-modules/terraform-hetzner-volume/commit/d1a73ebc0aa1318fb015209848d5ed7707874329))
