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

resource "azurerm_resource_group" "rg" {

    name            =   var.rg_name
    location        =   var.location
    tags            =   var.tags  

}

module "keyvault" {
  source                        = "./modules/keyvault"
  rg_name                       = var.rg_name
  key_vault_name                = "ds-kv-test-001"
  ip_rules                      = ["10.10.0.0/26",]
  tenant_id                     = var.tenant_id
  key_vault_sku_pricing_tier    = "premium"
  object_id                     = var.object_id
  depends_on                    = [azurerm_resource_group.rg]
}

module "storage_account" {
  source                        = "./modules/storage_account"
  rg_name                       = var.rg_name
  sa_name                       = var.sa_name
  depends_on                    = [azurerm_resource_group.rg]
}

# It probably doesn't make much sense to include role_defintion modules
# module "role_definition" {
#   source                      = "./modules/role_definition"
#   azurerm_role_definition     = "test001-Reader"
#   rg_name                     = module.resourcegroup.resource_group_name
#   object_id                   = "f7b7ed91-af9c-481b-83a7-6cb43f3b0edd"
# }


module "role_assignment" {
  rg_name                       = var.rg_name
  source                        = "./modules/role_assignment"
  object_id                     = var.object_id
  depends_on                    = [azurerm_resource_group.rg]
}     

# module "recovery_services_vault" {
#   source                        = "./modules/recovery_services_vault"
#   rg_name                       = var.rg_name
#   rsv_name                      = "ds-rsv-test-001"
#   depends_on                    = [azurerm_resource_group.rg]
# }

module "monitor_log_profile" {
  source                        = "./modules/monitor_log_profile"
  rg_name                       = var.rg_name
  sa_name                       = var.sa_name
  mlp_name                      = "ds-mlp-test-001"
  depends_on                    = [azurerm_resource_group.rg]

}

module "monitor_diagnostic_setting" {
  source                        = "./modules/monitor_diagnostic_setting"
  mds_name                      = "ds-mds-test-001"
  rg_name                       = var.rg_name
  sa_name                       = var.sa_name
  depends_on                    = [azurerm_resource_group.rg]  
}