resource "azurerm_storage_account" "sa1" {
  name                          = var.sa_name
  resource_group_name           = var.rg_name
  location                      = var.location
  account_tier                  = var.sku
  account_replication_type      = var.account_replication_type
  tags                          = var.tags
}