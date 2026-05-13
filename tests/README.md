# Terratest — Integration Tests

## Overview

These tests use [Terratest](https://terratest.gruntwork.io/) to validate the GKE module by deploying real infrastructure on GCP.

## Prerequisites

- Go 1.22+
- GCP project with billing enabled
- Authenticated `gcloud` CLI
- Service account with GKE admin permissions

## Running Tests

### Validate only (no GCP resources created)

```bash
cd tests
go test -v -run TestGkeSpotValidateOnly -timeout 5m
```

### Full integration tests (creates real resources)

```bash
# Set your project ID
cp ../examples/simple/terraform.tfvars.example ../examples/simple/terraform.tfvars
# Edit terraform.tfvars with your real project ID

cd tests
go test -v -timeout 30m
```

### Single test

```bash
go test -v -run TestGkeSpotSimple -timeout 30m
```

## CI

Integration tests run on demand (not on every PR) because they:
- Create real GCP resources
- Take 10-15 minutes
- Cost money (minimal with spot, but still)

Use the `integration-test` workflow dispatch to run manually.

## Cost

Tests use `e2-small` + spot instances and destroy everything after.
Estimated cost per full test run: ~$0.05
