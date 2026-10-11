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

resource "google_storage_bucket" "simulation_test_bucket" {
  name     = "cwm-test-bucket-001"
  location = "US"

  uniform_bucket_level_access = true

  labels = {
    environment = "sandbox"
    managed_by  = "terraform"
    test_run    = "cwm-simulation-v1"
  }
}
