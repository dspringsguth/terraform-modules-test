provider "azurerm" {
    version = "~>2.0"
    features {}
}

module "resourcegroup" {
  source                      = "./modules/resourcegroup"
  rg_name                     = "ds-rg-test-001"
}

module "keyvault" {
  source                      = "./modules/keyvault"
  rg_name                     = "ds-rg-test-001"
  key_vault_name              = "ds-keyvault-test-001"
  tenant_id                   = "1b7ebc65-8513-4491-aac7-a9ddebe4df1b"
  key_vault_sku_pricing_tier  = "premium"
  object_id                   = "f7b7ed91-af9c-481b-83a7-6cb43f3b0edd"
}