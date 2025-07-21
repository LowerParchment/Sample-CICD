locals {
  location            = "East US"
  resource_group_name = "pygoat-dev-rg"
  prefix              = "pygoatdev"
  docker_image        = "yourdockerhubuser/pygoat:latest"
}

terraform {
  source = "../../modules/appservice"
}

inputs = {
  location            = local.location
  resource_group_name = local.resource_group_name
  prefix              = local.prefix
  docker_image        = local.docker_image
}
