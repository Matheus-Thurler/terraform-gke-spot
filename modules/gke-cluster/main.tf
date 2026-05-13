resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.zone
  project  = var.project_id

  network    = var.network
  subnetwork = var.subnetwork

  initial_node_count       = 1
  remove_default_node_pool = true

  min_master_version = var.kubernetes_version != "" ? var.kubernetes_version : null

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {}

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  dynamic "network_policy" {
    for_each = var.enable_network_policy ? [1] : []
    content {
      enabled  = true
      provider = "CALICO"
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = var.maintenance_start_time
    }
  }

  resource_labels = var.labels

  deletion_protection = false
}

resource "google_container_node_pool" "spot" {
  name     = "${var.cluster_name}-spot-pool"
  location = var.zone
  project  = var.project_id
  cluster  = google_container_cluster.this.name

  node_count = var.min_node_count > 0 ? null : var.node_count

  dynamic "autoscaling" {
    for_each = var.min_node_count > 0 ? [1] : []
    content {
      min_node_count = var.min_node_count
      max_node_count = var.max_node_count
    }
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type
    spot         = var.spot_enabled

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    labels = merge(var.labels, {
      spot = var.spot_enabled ? "true" : "false"
    })

    taint {
      key    = "cloud.google.com/gke-spot"
      value  = "true"
      effect = "NO_SCHEDULE"
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
