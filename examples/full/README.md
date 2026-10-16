# Full volume example

The example uses every input to create a formatted volume and attach it to a server in the same
location. `attach = true` makes the attachment explicit while the server ID is still unknown.
`automount = false` leaves mounting to your operating-system configuration.

To keep the volume unattached, set `attach = false` and omit `server_id`. Detaching a volume is separate
from destroying its storage. Review the plan before removing the module.

## Running the example

Export `HCLOUD_TOKEN`, supply the inputs described in `variables.tf`, then run:

```shell
terraform init
terraform plan
terraform apply
```

This creates real infrastructure. Review the plan and any deletion protection before cleanup.
See the [module README](../../README.md) for usage and input descriptions.
