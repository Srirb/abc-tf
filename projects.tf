# # module "project_factory" {
# #   source  = "terraform-google-modules/project-factory/google"
# #   version = "~> 14.2"

# #   for_each          = var.projects
# #   name              = each.value.name
# #   random_project_id = true
# #   org_id            = var.org_id
# #   billing_account   = var.billing_account
# #   folder_id         = each.value.parent_folder_id 
# #   activate_apis     = each.value.activate_apis
# #   labels            = each.value.labels
# # }



# resource "random_id" "server" {
#   byte_length = 2
# }


# module "prj-dev-mlai-001" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-dev-mlai-001"
#   project_id = "prj-dev-mlai-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.mlai-dev.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-prd-mlai-001" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-prd-mlai-001"
#   project_id = "prj-prd-mlai-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.mlai-prod.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-dev-css-001" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-dev-css-001"
#   project_id = "prj-dev-css-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.cloudsharedservices-dev.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-prod-css-001" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-prod-css-001"
#   project_id = "prj-prod-css-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.cloudsharedservices-prod.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-dev-ed-001" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-dev-ed-001"
#   project_id = "prj-dev-ed-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.enterprisedata-dev.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-prd-ed-001" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-prd-ed-001"
#   project_id = "prj-prd-ed-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.enterprisedata-prod.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-shared-vpc-prd" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-shared-vpc-prd"
#   project_id = "prj-shared-vpc-prd-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.common.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-shared-vpc-dev" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-shared-vpc-dev"
#   project_id = "prj-shared-vpc-dev-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.common.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-logmon-prd" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-logmon-prd"
#   project_id = "prj-logmon-prd-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.common.id
#   activate_apis = ["monitoring.googleapis.com","logging.googleapis.com","iam.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-logmon-dev" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-logmon-dev"
#   project_id = "prj-logmon-dev-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.common.id
#   activate_apis = ["monitoring.googleapis.com","logging.googleapis.com","iam.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }

# module "prj-hub-vpc" {
#   source  = "terraform-google-modules/project-factory/google"
#   version = "~> 14.2"

#   name       = "prj-hub-vpc"
#   project_id = "prj-hub-vpc-${random_id.server.hex}"
#   org_id     = var.org_id
#   folder_id  = module.common.id
#   activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#   billing_account                = var.billing_account
#   enable_shared_vpc_host_project = true
#   auto_create_network            = false
# }
