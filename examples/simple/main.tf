module "gke_spot" {
  source = "../../modules/gke-cluster"

  project_id   = var.project_id
  cluster_name = "gke-spot-simple"
  zone         = "us-central1-a"
}
