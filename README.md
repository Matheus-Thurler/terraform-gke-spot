# terraform-gke-spot

[![Terraform Registry](https://img.shields.io/badge/Terraform%20Registry-Matheus--Thurler%2Fspot%2Fgke-blue?logo=terraform)](https://registry.terraform.io/modules/Matheus-Thurler/spot/gke/latest)
[![CI](https://github.com/Matheus-Thurler/terraform-gke-spot/actions/workflows/terraform-ci.yml/badge.svg)](https://github.com/Matheus-Thurler/terraform-gke-spot/actions/workflows/terraform-ci.yml)

Terraform module for deploying a **cost-effective GKE cluster** on Google Cloud Platform using the free-tier zonal cluster and spot instances.

## Why?

GKE offers **one free zonal cluster per billing account** (no cluster management fee). Combined with **spot instances** (up to 91% cheaper), you can run Kubernetes on GCP for almost nothing — perfect for learning, development, and small workloads.

## Features

- GKE zonal cluster (free management fee)
- Spot instance node pool (up to 91% cost reduction)
- Configurable machine types and node count
- Auto-scaling support
- Workload Identity enabled by default
- Network policy support
- Configurable maintenance window

## Usage

### From Terraform Registry

```hcl
module "gke_spot" {
  source  = "Matheus-Thurler/spot/gke"
  version = "~> 1.0"

  project_id   = "my-gcp-project"
  cluster_name = "my-cluster"
  zone         = "us-central1-a"

  node_count   = 2
  machine_type = "e2-medium"
  spot_enabled = true
  disk_size_gb = 30
}
```

### Using the submodule directly

```hcl
module "gke_spot" {
  source = "Matheus-Thurler/spot/gke//modules/gke-cluster"

  project_id   = "my-gcp-project"
  cluster_name = "my-cluster"
  zone         = "us-central1-a"

  node_count   = 2
  machine_type = "e2-medium"
  spot_enabled = true
  disk_size_gb = 30
}
```

## Examples

- [Simple](./examples/simple/) — Minimal cluster with defaults
- [Complete](./examples/complete/) — Full configuration with all options

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| google | >= 5.0.0 |

## Cost Breakdown

| Component | Cost |
|-----------|------|
| GKE cluster management (zonal) | **$0/month** (free tier) |
| e2-medium spot instance | ~$7.50/month (vs $33 on-demand) |
| 2x e2-medium spot nodes | ~$15/month total |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| project_id | GCP project ID | `string` | — | yes |
| cluster_name | Name of the GKE cluster | `string` | — | yes |
| zone | GCP zone for the zonal cluster (free tier) | `string` | `"us-central1-a"` | no |
| machine_type | Machine type for nodes | `string` | `"e2-medium"` | no |
| node_count | Number of nodes in the node pool | `number` | `2` | no |
| spot_enabled | Enable spot instances for the node pool | `bool` | `true` | no |
| disk_size_gb | Disk size in GB for each node | `number` | `30` | no |
| min_node_count | Minimum nodes for autoscaling (0 to disable) | `number` | `0` | no |
| max_node_count | Maximum nodes for autoscaling | `number` | `5` | no |

See [variables.tf](./variables.tf) for all available inputs.

## Outputs

| Name | Description |
|------|-------------|
| cluster_name | Name of the GKE cluster |
| cluster_endpoint | Endpoint of the GKE cluster |
| cluster_ca_certificate | CA certificate of the GKE cluster |
| node_pool_name | Name of the spot node pool |
| get_credentials_command | gcloud command to get cluster credentials |

## Contributing

1. Fork the repo
2. Create a feature branch (`git checkout -b feat/my-feature`)
3. Commit using [Conventional Commits](https://www.conventionalcommits.org/)
4. Push and open a PR
5. Wait for CI checks to pass

## License

Apache 2.0 — see [LICENSE](./LICENSE)

<!-- badge placeholder -->
