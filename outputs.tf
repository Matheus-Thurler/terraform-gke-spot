output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = module.gke_cluster.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint of the GKE cluster"
  value       = module.gke_cluster.cluster_endpoint
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "CA certificate of the GKE cluster"
  value       = module.gke_cluster.cluster_ca_certificate
  sensitive   = true
}

output "node_pool_name" {
  description = "Name of the spot node pool"
  value       = module.gke_cluster.node_pool_name
}

output "cluster_location" {
  description = "Location (zone) of the cluster"
  value       = module.gke_cluster.cluster_location
}

output "get_credentials_command" {
  description = "gcloud command to get cluster credentials"
  value       = module.gke_cluster.get_credentials_command
}
