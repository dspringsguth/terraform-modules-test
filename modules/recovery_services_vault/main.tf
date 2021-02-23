resource "azurerm_recovery_services_vault" "rsv" {
  name                     = var.rsv_name
  resource_group_name      = var.rg_name
  location                 = var.location
  sku                      = var.sku

  soft_delete_enabled      = var.soft_delete_enabled
  tags                     = var.tags
}