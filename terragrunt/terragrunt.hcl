locals {
  region = "eastus"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-pygoat-dev"
    storage_account_name = "pygoatterraform"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}
