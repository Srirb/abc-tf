
variable "org_id" {
  type        = string
  description = "The ID of the Google Cloud organization."
}

variable "billing_account" {
  type        = string
  description = "The ID of the billing account to associate projects with."
}

variable "backend" {
  type = string
  description = "Bucket-name for storing terraform remote state"
}

variable "region" {
  type        = string
  description = "The default region for resources."
}

variable "folder_names" {
  type        = list(string)
  description = "List of folder names to be created."
}

# variable "projects" {
#   type = map(object({
#     name          = string
#     folder_name  = string   # Specify the folder name for the project
#     activate_apis = list(string)
#     labels        = map(string)
#   }))
# }

variable "shared_vpc_hosts" {
  type = map(object({
    network_name    = string
    subnets         = list(object({
      name           = string
      region         = string
      ip_cidr_range = string
    }))
    service_project = string
  }))
}

variable "vpc_peerings" {
  type        = map(string)
  description = "Map of VPC peering connections. Keys are peering names, values are the names of the Shared VPCs to peer with."
  default     = {}
}


# variable "parent" {
#   type        = string
#   description = "The resource name of the parent Folder or Organization. Must be of the form `folders/folder_id` or `organizations/org_id`."
#   default     = "organizations/23787589526"
# }

# variable "topfolder_names" {
#   type        = list(string)
#   description = "Top level Folder names."
# }

# variable "envfolder_names" {
#   type        = list(string)
#   description = "Env folder names"
# }

# variable "devfolder_names" {
#   type        = list(string)
#   description = "Folders under dev folder"
# }

# variable "prdfolder_names" {
#   type        = list(string)
#   description = "Folders under prod folder"
# }

# variable "vpc_peerings" {
#   type        = map(string)
#   description = "Map of VPC peering connections. Keys are peering names, values are the names of the Shared VPCs to peer with."
#   default     = {}
# }

variable "folder_map" {
  type        = any
  description = "Folder structure as a map"
}

