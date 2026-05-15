module "gke_cluster" {
  source = "./modules/gke-cluster"

  project_id   = var.project_id
  cluster_name = var.cluster_name
  region       = var.region
  zone         = var.zone

  network    = var.network
  subnetwork = var.subnetwork

  node_count   = var.node_count
  machine_type = var.machine_type
  spot_enabled = var.spot_enabled
  disk_size_gb = var.disk_size_gb
  disk_type    = var.disk_type

  min_node_count = var.min_node_count
  max_node_count = var.max_node_count

  kubernetes_version     = var.kubernetes_version
  enable_network_policy  = var.enable_network_policy
  maintenance_start_time = var.maintenance_start_time

  labels = var.labels
}
