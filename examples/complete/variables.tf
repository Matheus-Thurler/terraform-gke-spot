variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "gke-spot-complete"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "network" {
  description = "VPC network"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "VPC subnetwork"
  type        = string
  default     = "default"
}

variable "node_count" {
  type    = number
  default = 3
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "spot_enabled" {
  type    = bool
  default = true
}

variable "disk_size_gb" {
  type    = number
  default = 50
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 5
}

variable "kubernetes_version" {
  type    = string
  default = ""
}

variable "enable_network_policy" {
  type    = bool
  default = true
}

variable "maintenance_start_time" {
  type    = string
  default = "03:00"
}

variable "labels" {
  type = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
    cost        = "spot"
  }
}
