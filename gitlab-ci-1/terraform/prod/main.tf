provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "gitlab" {
  user            = var.user
  source          = "../modules/app"
  public_key_path = var.public_key_path
  zone            = var.zone
  app_disk_image  = var.app_disk_image
}
