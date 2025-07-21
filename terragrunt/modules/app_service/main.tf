# Connect to the Azure Subscription
provider "azurerm" {
  subscription_id = "606e824b-aaf7-4b4e-9057-b459f6a4436d"
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "main" {
  name                = "${var.prefix}-plan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.prefix}-app"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}"
    always_on        = true
  }

  app_settings = {
    WEBSITES_PORT = "5000"
  }
}
