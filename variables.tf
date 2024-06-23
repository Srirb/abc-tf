
variable "org_id" {
  type        = string
  description = "The ID of the Google Cloud organization."
}

variable "billing_account" {
  type        = string
  description = "The ID of the billing account to associate projects with."
}

variable "region" {
  type        = string
  description = "The default region for resources."
}

variable "backend" {
  type = string
  description = "Bucket-name for storing terraform remote state"
}

variable "folder_map" {
  type        = any
  description = "Folder structure as a map"
}

variable "projects" {
  type = map(object({
    name          = string
    folder_name  = string   # Specify the folder name for the project
    activate_apis = list(string)
    labels        = map(string)
  }))
}

variable "shared_vpc_hosts" {
  type = map(object({
    network_name    = string
    subnets         = list(object({
      name           = string
      region         = string
      ip_cidr_range = string
      flow_logs = bool
      subnet_flow_logs_interval = string
      subnet_flow_logs_sampling = number
      subnet_flow_logs_metadata = string
    }))
    service_project = list(string)
  }))
}

variable "vpc_peerings" {
  type        = map(string)
  description = "Map of VPC peering connections. Keys are peering names, values are the names of the Shared VPCs to peer with."
  default     = {}
}
