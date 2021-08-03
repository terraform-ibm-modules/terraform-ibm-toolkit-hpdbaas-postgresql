
## Example usage

```hcl-terraform
module "dev_infrastructure_hpdbaas_postgresql" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-hpdbaas-postgresql.git?ref=v1.0.0"

  resource_group_name = var.resource_group_name
  resource_location   = var.region
  name_prefix         = "${var.name_prefix}_2"
  hpcs-region  = var.hpcs-region
  hpcs-name    = var.hpcs-name
  hpcs-key     = var.hpcs-key
  authorize-kms       = var.authorize-kms == "true"
}
```




