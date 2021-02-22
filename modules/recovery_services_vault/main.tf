data "azurerm_resource_group" "current"{
    name = var.rg_name
}

resource "azurerm_recovery_services_vault" "rsv" {
  name                     = var.rsv_name
  resource_group_name      = data.azurerm_resource_group.current.name
  location                 = var.location
  sku                      = var.sku

  soft_delete_enabled      = var.soft_delete_enabled
}