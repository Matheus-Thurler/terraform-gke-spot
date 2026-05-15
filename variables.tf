variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone for the zonal cluster (free tier)"
  type        = string
  default     = "us-central1-a"
}

variable "network" {
  description = "VPC network name"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "VPC subnetwork name"
  type        = string
  default     = "default"
}

variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Machine type for nodes"
  type        = string
  default     = "e2-medium"
}

variable "spot_enabled" {
  description = "Enable spot instances for the node pool"
  type        = bool
  default     = true
}

variable "disk_size_gb" {
  description = "Disk size in GB for each node"
  type        = number
  default     = 30
}

variable "disk_type" {
  description = "Disk type for nodes (pd-standard or pd-ssd)"
  type        = string
  default     = "pd-standard"
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling (0 to disable)"
  type        = number
  default     = 0
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
  default     = 5
}

variable "kubernetes_version" {
  description = "Kubernetes version (leave empty for latest)"
  type        = string
  default     = ""
}

variable "enable_network_policy" {
  description = "Enable network policy on the cluster"
  type        = bool
  default     = false
}

variable "maintenance_start_time" {
  description = "Maintenance window start time (UTC, format: HH:MM)"
  type        = string
  default     = "03:00"
}

variable "labels" {
  description = "Labels to apply to the cluster and nodes"
  type        = map(string)
  default     = {}
}
