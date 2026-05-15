# GKE Cluster Module

Provisions a cost-effective GKE zonal cluster with a spot instance node pool on Google Cloud Platform.

## Features

- GKE zonal cluster (free management fee under GCP free tier)
- Spot instance node pool (up to 91% cost reduction)
- Workload Identity enabled by default
- Optional autoscaling and network policy
- Configurable maintenance window

## Usage

```hcl
module "gke_spot" {
  source = "Matheus-Thurler/spot/gke//modules/gke-cluster"

  project_id   = "my-gcp-project"
  cluster_name = "my-cluster"
  zone         = "us-central1-a"

  node_count   = 2
  machine_type = "e2-medium"
  spot_enabled = true
}
```
