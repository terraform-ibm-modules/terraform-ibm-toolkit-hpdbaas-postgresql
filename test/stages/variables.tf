
# Resource Group Variables
variable "resource_group_name" {
  type        = string
  description = "Existing resource group where the IKS cluster will be provisioned."
}

variable "hpcs_resource_group_name" {
  type        = string
  description = "The resource group where the hpcs instance has been provisioned. If not provided defaults to the same resource group as the MongoDB instance"
  
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The api key for IBM Cloud access"
}

variable "region" {
  type        = string
  description = "Region for VLANs defined in private_vlan_number and public_vlan_number."
}

variable "name_prefix" {
  type        = string
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  default     = ""
}

variable "hpcs_region" {
  type        = string
  description = "The region where the Key Protect instance has been provisioned"
  default     = ""
}

variable "hpcs_name" {
  type        = string
  description = "The name of the Key Protect instance"
  default     = ""
}

variable "kms_key_name" {
  type        = string
  description = "The name pf the kms key"
  default     = "test-key"
}
