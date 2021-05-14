provider "google" {
  version     = "3.5.0"
  credentials = file("../terraform-key.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}
