variable "ibmcloud_api_key" {
  type        = string
  description = "The api key for IBM Cloud access"
} 

variable "resource_group_name" {
  type        = string
  description = "Resource group where the cluster has been provisioned."  
}

variable "region" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
}

variable "provision" {
  type        = bool
  description = "Flag indicating that the instance should be provisioned. If false then it assumed that an instance already exists."
  default     = true
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = []
}

variable "name_prefix" {
  type        = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default     = ""
}

variable "label" {
  type        = string
  description = "The label used to build the database name, along with the name_prefix"
  default     = "hpdbaas-mongodb"
}

# mongodb-flexible or mongodb-free
variable "plan" {
  type        = string
  description = "The type of plan the service instance should run under (mongodb-free, mongodb-flexible)"
  default     = "mongodb-free"
}

variable "private_endpoint" {
  type        = string
  description = "Flag indicating that the service should be created with private endpoints"
  default     = "true"
}

variable "role" {
  type        = string
  description = "The role of the generated credential (Viewer, Administrator, Operator, Editor)"
  default     = "Editor"
}

variable "hpcs_instance_id" {
  type        = string
  description = "The id of the hpcs instance"
  default     = ""
}

variable "hpcs_key" {
  type        = string
  description = "The id of the key in the hpcs instance"
  default     = ""
}

variable "cluster_name" {
  type        = string
  description = "The name of the database cluster"
}

variable "admin_name" {
  type        = string
  description = "The name of the database admin"
}

variable "password" {
  type        = string
  description = "The password of database admin(15 characters minimum, at least one uppercase character, one lowercase character and one number)"
}

variable "storage" {
  type        = string
  description = "The name of the database admin"
  default     = "5GiB"
}

variable "memory" {
  type        = string
  description = "The name of the database admin"
  default     = "3GiB"
}

variable "cpu" {
  type        = string
  description = "The name of the database admin"
  default     = "1"
}
