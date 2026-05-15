# GKE Cluster Submodule

Provisions a cost-effective GKE zonal cluster with a spot instance node pool on Google Cloud Platform.

This submodule is the core component of the [terraform-google-gke-spot](https://registry.terraform.io/modules/Matheus-Thurler/gke-spot/google/latest) module.

## Usage

```hcl
module "gke_spot" {
  source  = "Matheus-Thurler/gke-spot/google//modules/gke-cluster"
  version = "~> 1.0"

  project_id   = "my-gcp-project"
  cluster_name = "my-cluster"
  zone         = "us-central1-a"

  node_count   = 2
  machine_type = "e2-medium"
  spot_enabled = true
}
```

## Features

- GKE zonal cluster (free management fee under GCP free tier)
- Spot instance node pool (up to 91% cost reduction)
- Workload Identity enabled by default
- Optional autoscaling and network policy
- Configurable maintenance window

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| project_id | GCP project ID | `string` | — | yes |
| cluster_name | Name of the GKE cluster | `string` | — | yes |
| region | GCP region | `string` | `"us-central1"` | no |
| zone | GCP zone for the zonal cluster (free tier) | `string` | `"us-central1-a"` | no |
| network | VPC network name | `string` | `"default"` | no |
| subnetwork | VPC subnetwork name | `string` | `"default"` | no |
| node_count | Number of nodes in the node pool | `number` | `2` | no |
| machine_type | Machine type for nodes | `string` | `"e2-medium"` | no |
| spot_enabled | Enable spot instances for the node pool | `bool` | `true` | no |
| disk_size_gb | Disk size in GB for each node | `number` | `30` | no |
| disk_type | Disk type for nodes (pd-standard or pd-ssd) | `string` | `"pd-standard"` | no |
| min_node_count | Minimum nodes for autoscaling (0 to disable) | `number` | `0` | no |
| max_node_count | Maximum nodes for autoscaling | `number` | `5` | no |
| kubernetes_version | Kubernetes version (leave empty for latest) | `string` | `""` | no |
| enable_network_policy | Enable network policy on the cluster | `bool` | `false` | no |
| maintenance_start_time | Maintenance window start time (UTC, HH:MM) | `string` | `"03:00"` | no |
| labels | Labels to apply to the cluster and nodes | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster_name | Name of the GKE cluster |
| cluster_endpoint | Endpoint of the GKE cluster |
| cluster_ca_certificate | CA certificate of the GKE cluster |
| node_pool_name | Name of the spot node pool |
| cluster_location | Location (zone) of the cluster |
| get_credentials_command | gcloud command to get cluster credentials |

## Resources

| Name | Type |
|------|------|
| google_container_cluster.this | resource |
| google_container_node_pool.spot | resource |
