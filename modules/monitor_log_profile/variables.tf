variable "rg_name" {
  type              = string
  description       = "Name of resource group"
  
}

variable "sa_name" {
  type              = string
  description       = "Name of storage account"
  
}

variable "mlp_name" {
  type              = string
  description       = "The Name of the Log Profile"

}

variable "mlp_categories" {
  type              = list
  description       = "List of categories of the logs"
  default           = ["Action", "Delete", "Write",] 
  
}

variable "mlp_locations" {
  type              = list
  description       = "List of locations of the logs"
  default           = ["global",] 
  
}