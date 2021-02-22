resource "azurerm_key_vault" "kv" {
  name                            = var.key_vault_name
  location                        = var.key_vault_location
  resource_group_name             = var.rg_name
  tenant_id                       = var.tenant_id
  sku_name                        = var.key_vault_sku_pricing_tier
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  purge_protection_enabled        = var.enable_purge_protection
  tags                            = var.tags
}

resource "azurerm_key_vault_access_policy" "kvp" {
  key_vault_id                    = azurerm_key_vault.kv.id
  tenant_id                       = azurerm_key_vault.kv.tenant_id
  object_id                       = var.object_id
  key_permissions                 = var.key_permissions
  secret_permissions              = var.secret_permissions
  certificate_permissions         = var.certificate_permissions
}