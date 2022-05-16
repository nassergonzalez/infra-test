module "app1" {
  source = "./modules/app"
}

module "app2" {
  source = "./modules/app2"
}

output "app-1-output-container-id" {
  value = module.app1.container_id
}
output "app-2-output-container-id" {
  value = module.app2.container_id
}
