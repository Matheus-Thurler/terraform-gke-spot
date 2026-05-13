# terraform-gke-spot

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

```hcl
module "gke_spot" {
  source = "github.com/Matheus-Thurler/terraform-gke-spot//modules/gke-cluster"

  project_id   = "my-gcp-project"
  cluster_name = "my-cluster"
  region       = "us-central1"
  zone         = "us-central1-a"

  node_count    = 2
  machine_type  = "e2-medium"
  spot_enabled  = true
  disk_size_gb  = 30
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

## Publishing to Terraform Registry

This module follows the [Terraform Registry naming convention](https://developer.hashicorp.com/terraform/registry/modules/publish):

```
terraform-<PROVIDER>-<NAME>
```

To publish:
1. Tag a release: `git tag v1.0.0 && git push --tags`
2. Sign in to [registry.terraform.io](https://registry.terraform.io) with GitHub
3. Publish module (auto-detected from repo name)

## Contributing

1. Fork the repo
2. Create a feature branch (`git checkout -b feat/my-feature`)
3. Commit using [Conventional Commits](https://www.conventionalcommits.org/)
4. Push and open a PR
5. Wait for CI checks to pass

## License

Apache 2.0 — see [LICENSE](./LICENSE)

<!-- badge placeholder -->
