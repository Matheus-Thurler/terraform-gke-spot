output "cluster_name" {
  value = module.gke_spot.cluster_name
}

output "cluster_endpoint" {
  value     = module.gke_spot.cluster_endpoint
  sensitive = true
}

output "node_pool_name" {
  value = module.gke_spot.node_pool_name
}

output "get_credentials_command" {
  value = module.gke_spot.get_credentials_command
}
