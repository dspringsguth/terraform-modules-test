data "azurerm_storage_account" "sa" {
  resource_group_name   = var.rg_name  
  name                  = var.sa_name
}

resource "azurerm_monitor_log_profile" "mlp1" {
  name                  = var.mlp_name

  categories            = var.mlp_categories
  locations             = var.mlp_locations
  storage_account_id    = data.azurerm_storage_account.sa.id

  retention_policy {
    enabled = true
    days    = 7
  }

}