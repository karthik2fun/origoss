resource "google_container_cluster" "cluster" {
  name     = "${var.env}-cluster"
  location = var.region
  initial_node_count = 1  # For demo; scale for prod

  node_config {
    machine_type = var.machine_type
  }

  # Enable Autopilot for simplicity (managed nodes)
  enable_autopilot = true

  # Networking, addons, etc. for availability (e.g., private cluster)
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }
}

data "google_client_config" "default" {}

provider "kubernetes" {
  alias                  = "this"
  host                   = "https://${google_container_cluster.cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth[0].cluster_ca_certificate)
}

provider "helm" {
  alias = "this"
  kubernetes {
    host                   = "https://${google_container_cluster.cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth[0].cluster_ca_certificate)
  }
}