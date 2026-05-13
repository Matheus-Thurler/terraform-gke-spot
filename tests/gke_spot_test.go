package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestGkeSpotSimple(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/simple",
		Vars: map[string]interface{}{
			"project_id": getProjectID(t),
		},
		NoColor: true,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	clusterName := terraform.Output(t, terraformOptions, "cluster_name")
	assert.Equal(t, "gke-spot-simple", clusterName)
}

func TestGkeSpotComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/complete",
		Vars: map[string]interface{}{
			"project_id":   getProjectID(t),
			"cluster_name": "gke-spot-test",
			"zone":         "us-central1-a",
			"node_count":   1,
			"machine_type": "e2-small",
			"spot_enabled": true,
			"disk_size_gb": 20,
		},
		NoColor: true,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	clusterName := terraform.Output(t, terraformOptions, "cluster_name")
	assert.Equal(t, "gke-spot-test", clusterName)

	nodePoolName := terraform.Output(t, terraformOptions, "node_pool_name")
	assert.Contains(t, nodePoolName, "spot-pool")
}

func TestGkeSpotValidateOnly(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../modules/gke-cluster",
		NoColor:      true,
	}

	terraform.Init(t, terraformOptions)
	terraform.Validate(t, terraformOptions)
}

func getProjectID(t *testing.T) string {
	t.Helper()
	projectID := terraform.GetVariableAsStringFromVarFile(t, "../examples/simple/terraform.tfvars", "project_id")
	if projectID == "" || projectID == "your-gcp-project-id" {
		t.Skip("Skipping: set a real project_id in terraform.tfvars to run integration tests")
	}
	return projectID
}
