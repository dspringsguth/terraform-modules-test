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

variable "object_id" {
  type        = string
  description = "Object ID of the according Group/User/Service Principal"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the current AD"
}