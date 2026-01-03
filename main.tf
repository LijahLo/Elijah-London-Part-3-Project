terraform {
  cloud {
    organization = "OSV-Scanner2025"

    workspaces {
      name = "ElijahLondon"
    }
  }

  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.GOOGLE_CREDENTIALS
}

# -----------------------------
# Static Website Bucket
# -----------------------------
resource "google_storage_bucket" "example" {
  name     = "${var.project_id}-demo-bucket"
  location = var.region

  # Enable website hosting
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  uniform_bucket_level_access = true
}

# Allow public read access
resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.example.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# Upload index.html
resource "google_storage_bucket_object" "index_html" {
  name   = "index.html"
  bucket = google_storage_bucket.example.name
  source = "${path.module}/website/index.html"

  content_type = "text/html"
}

# Upload 404.html
resource "google_storage_bucket_object" "error_html" {
  name   = "404.html"
  bucket = google_storage_bucket.example.name
  source = "${path.module}/website/404.html"

  content_type = "text/html"
}
