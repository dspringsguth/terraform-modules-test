variable "rg_name" {
  type                      = string
  description               = "Resource group name"
}

variable "location" {
  type                      = string
  default                   = "germanywestcentral"
  description               = "Location of resource"
}

variable "tags" {
  type                      = map
  default                   = {
      author = "danielspringsguth"
  }
  description               = "Tag for author"
}