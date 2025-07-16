terraform {
  source = "../../modules/app_service"
}

inputs = {
  environment = "dev"
}