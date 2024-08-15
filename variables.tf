variable "resource_group_name" {
  description = "Name of resource group where resources are created"
  type = string
}

variable "prefix" {
    description = "Prefix for resources in environment"
    type = string
    default = "anish-rg-"
}

variable "default_tags" {
  type = map(string)
  default = {
    owner     = "anish.sapkota"
    terraform = "true"
    project   = "azure-learn"
  }
}
