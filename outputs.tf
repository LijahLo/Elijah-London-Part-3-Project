output "bucket_name" {
  value = google_storage_bucket.example.name
}

output "website_url" {
  description = "URL of your static website"
  value       = "https://storage.googleapis.com/${google_storage_bucket.example.name}/index.html"
}
