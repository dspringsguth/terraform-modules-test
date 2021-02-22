terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.47.0"
    }
  } 
}

provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source                      = "./modules/resourcegroup"
  rg_name                     = "ds-rg-test-001"
}

module "keyvault" {
  source                      = "./modules/keyvault"
  rg_name                     = module.resourcegroup.resource_group_name
  key_vault_name              = "ds-keyvault-test-001"
  tenant_id                   = "1b7ebc65-8513-4491-aac7-a9ddebe4df1b"
  key_vault_sku_pricing_tier  = "premium"
  object_id                   = "f7b7ed91-af9c-481b-83a7-6cb43f3b0edd"
}

# It probably doesn't make much sense to include role_defintion modules
# module "role_definition" {
#   source                      = "./modules/role_definition"
#   azurerm_role_definition     = "test001-Reader"
#   rg_name                     = module.resourcegroup.resource_group_name
#   object_id                   = "f7b7ed91-af9c-481b-83a7-6cb43f3b0edd"
# }

#  Since rg_name does not yet exist before terraform apply, this module has to be staged somehow
#  module "role_assignment" {
#   rg_name                     = module.resourcegroup.resource_group_name
#   source                      = "./modules/role_assignment"
#   object_id                   = "f7b7ed91-af9c-481b-83a7-6cb43f3b0edd"
# }     