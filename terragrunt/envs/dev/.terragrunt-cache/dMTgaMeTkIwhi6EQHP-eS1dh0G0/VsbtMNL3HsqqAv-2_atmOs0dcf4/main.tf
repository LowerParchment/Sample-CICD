# Connect to the Azure Subscription
provider "azurerm" {
  subscription_id = "606e824b-aaf7-4b4e-9057-b459f6a4436d"
  features {}
}

resource "azurerm_resource_group" "rg"{
  name     = "rg-pygoat-${var.environment}"
  location = "East US"
}

resource "azurerm_service_plan" "plan" {
  name                = "pygoat-plan-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B1"
  os_type  = "Linux"
}

variable "environment" {
  type = string
}
