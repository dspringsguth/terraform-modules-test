variable "rg_name" {
  type                      = string
  description               = "Resource group name"
}

variable "sa_name" {
  type                      = string
  description               = "Storage account name"
}

variable "location" {
  type                      = string
  description               = "Location of the resource"
  default                   = "germanywestcentral"
}

variable "sku" {
  type                      = string
  description               = "SKU - Standard or Premium"
  default                   = "Standard"

}

variable "account_replication_type" {
  type                      = string
  description               =   "Replication Type: LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS"
  default                   = "GRS"
}

variable "tags" {
  type                      = map
  default                   = {
      author = "danielspringsguth"
  }
  description               = "Tag for author"
}