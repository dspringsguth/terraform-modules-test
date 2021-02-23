data "azurerm_subscription" "primary" {

}

data "azurerm_storage_account" "sa" {
  resource_group_name   = var.rg_name  
  name                  = var.sa_name
}

resource "azurerm_monitor_diagnostic_setting" "mds" {
  name                  = var.mds_name
  target_resource_id    = data.azurerm_subscription.primary.id
  storage_account_id    = data.azurerm_storage_account.sa.id

    log {
        category = "Administrative"  
        enabled  = true  
     }
    log {
        category = "Alert"  
        enabled  = true  
     }
    log {
        category = "Autoscale"  
        enabled  = true  
     }
    log {
        category = "Policy"  
        enabled  = true  
     }
    log {
        category = "Recommendation"  
        enabled  = false  
     }
    log {
        category = "ResourceHealth"  
        enabled  = true  
     }
    log {
        category = "Security"  
        enabled  = true  
     }
    log {
        category = "ServiceHealth"  
        enabled  = true  
     }
    
}