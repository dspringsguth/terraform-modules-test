data "azurerm_subscription" "primary" {}
data "azurerm_resource_group" "current"{
    name = var.rg_name
}

resource "azurerm_role_assignment" "ra1" {
  scope                 = data.azurerm_resource_group.current.id
  role_definition_name  = "Reader"
  principal_id          = var.object_id
}