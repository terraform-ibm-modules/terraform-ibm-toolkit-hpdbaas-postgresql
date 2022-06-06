resource null_resource print_names {
  provisioner "local-exec" {
    command = "echo 'Resource group: ${var.resource_group_name}'"
  }
}

data ibm_resource_group resource_group {
  depends_on = [null_resource.print_names]

  name = var.resource_group_name
}

locals {
  service            = "hyperp-dbaas-postgresql"
  name_prefix        = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  name               = "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-${var.label}"
  kyok-enabled       = var.hpcs_instance_id != "" && var.hpcs_key != ""
  parameters = {
    name = var.cluster_name
    admin_name = var.admin_name
    password = var.password
    confirm_password = var.password
    db_version = var.db_version
    cpu = var.cpu
    storage = var.storage
    memory = var.memory
    kms_instance = local.kyok-enabled ? var.hpcs_instance_id : null
    kms_key = local.kyok-enabled ? var.hpcs_key : null
    service_endpoints = var.private_endpoint == "true" ? "private" : "public"
  }
}

resource null_resource print_params {
  provisioner "local-exec" {
    command = "echo \"'parameters: ${jsonencode(local.parameters)}'\""
  }
}

resource ibm_resource_instance hyperp-dbaas-postgresql_instance {
  count = var.provision ? 1 : 0

  name              = local.name
  service           = local.service
  plan              = var.plan
  location          = var.region
  resource_group_id = data.ibm_resource_group.resource_group.id
  tags              = var.tags
  parameters        = local.parameters
}

data ibm_resource_instance hyperp-dbaas-postgresql_instance {
  depends_on        = [ibm_resource_instance.hyperp-dbaas-postgresql_instance]

  name              = local.name
  resource_group_id = data.ibm_resource_group.resource_group.id
  location          = var.region
  service           = local.service
}
