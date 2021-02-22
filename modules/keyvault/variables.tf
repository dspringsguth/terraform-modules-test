variable "rg_name" {
  type        = string
  description = "A container that holds related resources for an Azure solution"
}

variable "key_vault_name" {
  type        = string
  description = "The Name of the key vault"
}

variable "key_vault_location" {
  type        = string
  description = "The location of the key vault"
  default     = "germanywestcentral"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the key vault"
}

variable "key_vault_sku_pricing_tier" {
  type        = string
  description = "The name of the SKU used for the Key Vault. The options are: `standard`, `premium`."
  default     = "standard"
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Allow Virtual Machines to retrieve certificates stored as secrets from the key vault."
  default     = true
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Allow Disk Encryption to retrieve secrets from the vault and unwrap keys."
  default     = true
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Allow Resource Manager to retrieve secrets from the key vault."
  default     = true
}

variable "enable_purge_protection" {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = false
}

variable "object_id" {
  type        = string
  description = "Object ID of the according Group/User/Service Principal"
  
}

variable "key_permissions" {
  type        = list
  description = "Secret permissions for keyvault"
  default     = ["backup", "create", "delete", "get", "import", "list", "purge", "recover", "restore", "update",]
}

variable "secret_permissions" {
  type        = list
  description = "Secret permissions for keyvault"
  default     = ["list",]
}

variable "certificate_permissions" {
  type        = list
  description = "Certificate permissions for keyvault"
  default     = ["list",]
}

variable "tags" {
  type                      = map
  default                   = {
      author = "danielspringsguth"
  }
  description               = "Tag for author"
}