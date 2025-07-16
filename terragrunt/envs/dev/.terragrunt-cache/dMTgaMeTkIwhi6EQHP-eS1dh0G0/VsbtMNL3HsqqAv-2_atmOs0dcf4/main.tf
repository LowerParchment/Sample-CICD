provider "azurerm" {
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
