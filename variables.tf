variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "GOOGLE_CREDENTIALS" {
  description = "Service account JSON used by the Google provider"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Prefix name for resources"
  type        = string
  default     = "elijah-demo"
}

variable "machine_type" {
  description = "Compute Engine machine type"
  type        = string
  default     = "e2-micro"
}

variable "boot_image" {
  description = "Boot image for the VM"
  type        = string
  default     = "projects/debian-cloud/global/images/family/debian-12"
}

variable "ssh_username" {
  description = "Linux username associated with your SSH key"
  type        = string
}

variable "ssh_public_key" {
  description = "Your SSH public key (e.g. contents of id_ed25519.pub)"
  type        = string
}

variable "ssh_source_cidr" {
  description = "CIDR allowed to SSH into the VM (lock this to your IP)"
  type        = string
  default     = "0.0.0.0/0"
}
