project_id      = "terraform-cloud-sa"
region          = "us-central1"
zone            = "us-central1-a"
project_name    = "elijah-demo"

ssh_username    = "elijah"

# Paste your actual public key here (one line)
ssh_public_key  = "ssh-ed25519 AAAA...your-key-here"

# Better: lock SSH to your own IP:
ssh_source_cidr = "YOUR.IP.ADDR.HERE/32"
