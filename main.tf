resource "google_container_cluster" "primary" {
  name                     = var.name
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
  min_master_version       = "1.20"
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.name}-node-pool"
  cluster    = var.name
  location   = var.region
  node_count = var.initial_node_count

  node_config {
    preemptible  = false
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
