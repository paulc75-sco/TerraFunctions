resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location


}

resource "azurerm_storage_account" "sg" {
  name                     = var.sg_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.sg_account_tier
  account_replication_type = var.sg_account_replication_type





}
