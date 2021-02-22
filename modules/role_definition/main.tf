# Not sure yet if its useful to read out the current subscription
data "azurerm_subscription" "primary" {}
  

resource "azurerm_role_definition" "rd1" {
    scope               = data.azurerm_subscription.primary.id
    name                = var.azurerm_role_definition
    permissions {
        actions         = ["Microsoft.Resources/subscriptions/resourceGroups/read"]
        not_actions     = []
    }

    assignable_scopes   = [
        data.azurerm_subscription.primary.id,
    ]

}