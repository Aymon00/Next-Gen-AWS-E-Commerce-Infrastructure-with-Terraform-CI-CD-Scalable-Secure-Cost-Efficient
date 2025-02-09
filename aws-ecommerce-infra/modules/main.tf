module "networking" {
  source = "./modules/networking"
}

module "compute" {
  source = "./modules/compute"
}

module "database" {
  source = "./modules/database"
}

module "storage" {
  source = "./modules/storage"
}

module "Cloud_Provider" {
  source = "./modules/Cloud_Provider"
}
