provider "google" {
  version     = "3.5.0"
  credentials = file("../terraform-key.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name                    = "terraform-host"
  metadata_startup_script = file("startup.sh")
  machine_type            = "f1-micro"
  tags                    = ["web"]
  zone                    = var.zone
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080"]
  }

  source_tags   = ["web"]
  source_ranges = ["0.0.0.0/0"]
}
