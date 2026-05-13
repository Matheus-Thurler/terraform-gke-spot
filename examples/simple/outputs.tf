output "cluster_name" {
  value = module.gke_spot.cluster_name
}

output "get_credentials_command" {
  value = module.gke_spot.get_credentials_command
}
