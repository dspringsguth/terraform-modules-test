variable "rg_name" {
  type        = string
  description = "A container that holds related resources for an Azure solution"
}

variable "object_id" {
  type        = string
  description = "Object ID of the according Group/User/Service Principal"
} 

variable "azurerm_role_definition" {
  type        = string
  description = "Name of the role"
}
