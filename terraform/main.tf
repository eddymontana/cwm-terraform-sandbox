terraform {
  required_version = "^>= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~^> 5.0"
    }
  }
}

provider "google" {
  project = "sandbox-project-id"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "cwm-sandbox-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_instance" "vm_instance" {
  name         = "cwm-test-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
  }
}
