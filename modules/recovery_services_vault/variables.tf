variable "rg_name" {
  type                      = string
  description               = "Resource group name"
}

variable "rsv_name" {
  type                      = string
  description               = "Name of the recovery services vault" 
}  

variable "location" {
  type                      = string
  description               = "Location of the resource"
  default                   = "germanywestcentral"
}

variable "sku" {
  type                      = string
  description               = "SKU of RSV - Standard or Premium"
  default                   = "Standard"

}

variable "soft_delete_enabled" {
  type                      = bool
  description               = "Enable/Disable soft deletion"
  default                   = true
}