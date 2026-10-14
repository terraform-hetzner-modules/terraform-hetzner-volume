# Upgrade guide

This refresh targets `hetznercloud/hcloud ~> 1.70` and Terraform >= 1.7.
The test matrix covers Terraform 1.7.5/1.16.6 and OpenTofu 1.8.8/1.13.1.
These are module compatibility tests; older engines are not necessarily in the provider's own supported test matrix.

## Before upgrading

Back up the root configuration's state and commit its dependency lock file. Upgrade the module source
and run `terraform init -upgrade` (or `tofu init -upgrade`). Review the plan before applying it.
Child module lock files do not constrain the consuming root configuration.

The minimum engine/provider versions and typed object inputs are intentional compatibility changes.
Use the next major module release. Unknown object properties may be discarded by Terraform's object
conversion: check property names against the generated input documentation.

Existing resource names and caller-supplied map keys remain stable. Retain those keys when upgrading.
Changes to resource identity or other immutable properties can still trigger replacement according
to the provider; no migration can make those configuration changes intrinsically non-destructive.

## Checks

Run `terraform init -backend=false`, `terraform validate`, and `terraform test`
(or the equivalent `tofu` commands). Initialize and validate the examples and
test helpers separately. Tests mock cloud resources.
No cloud credentials are needed and no real infrastructure is created.

Before a production release, exercise creation, a second no-change plan, updates, and teardown in a
disposable Hetzner project. Mocks do not verify live API behavior, quotas, or capacity.

## Provider coverage maintenance

Formr generates the [schema report](SCHEMA.md). With the module initialized,
run `formr schema . -o docs/SCHEMA.md` to regenerate it and
`formr check . --report docs/SCHEMA.md` to check for drift. Use the same engine
and provider selections recorded in the report's provenance.

The current default policy checks inventory completeness and unresolved
analysis. Strict interface coverage and exception annotations are not yet
implemented, so a passing default check does not approve omitted fields.

Regenerate README inputs/outputs with `terraform-docs -c .github/linters/.terraform-docs.yml .`.
Resource IDs remain provider-managed. Deprecated fields are not reintroduced as new inputs.

## Volume changes

`server_id = null` now creates an unattached volume as originally documented. For existing callers with
a known non-null server ID, attachment remains automatic. Set `attach = true` explicitly when the ID is
computed during the same apply; this makes the resource count knowable at plan time. `attach = false`
detaches an existing attachment, while retaining the volume.

The included `moved` block migrates `hcloud_volume_attachment.current` to
`hcloud_volume_attachment.current[0]`. Keep it in downstream copies. During integration testing, confirm that an existing volume and attachment produce no resource changes
when configuration is unchanged; inspect the plan before applying the migration.

`labels` is now configurable. `format = null` leaves a new volume unformatted. Volume creation always
uses `location`; server assignment and automount remain owned by the separate attachment resource.
New `volume` and nullable `attachment` outputs expose complete provider attributes.
