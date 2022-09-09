
resource "random_password" "password" {
  length           = 20
  special          = true
  min_upper = 1
  min_lower = 1
  min_numeric = 1
  override_special = "!$%*()-_=+[]{}:?"
}

module "hpdbaas_postgresql" {
  source = "./module"

  ibmcloud_api_key    = var.ibmcloud_api_key
  resource_group_name = module.resource_group.name
  region              = var.hpcs_region
  name_prefix         = "${var.name_prefix}_2"
  cluster_name        = "test"
  admin_name          = "admin"
  password            = random_password.password.result
}
