# Organization and Billing
org_id         = "312552542091"
billing_account = "01EAA1-C5FBBB-98F223"
region         = "us-central1"
backend = "buc-terraform-abc-tst"

# Folder Structure
folder_names   = ["fldr-digitalproduct","fldr-informtiontech","fldr-common"]

# folder_map = {
#   "fldr-digitalproduct": {
#     "fldr-mlai": {
#       "fldr-dev": [],
#       "fldr-prod": []
#     }
#   },
#   "fldr-informtiontech": {
#     "fldr-cloudsharedservices": {
#       "fldr-dev": [],
#       "fldr-prod": []
#     },
#     "fidr-enterprisedata": {
#       "fldr-dev": [],
#       "fldr-prod": []
#     }
#   },
#   "fldr-common": []
# }

folder_map = {
              "Accounts" : {
                             "Dev1" : [],
                             "Dev2" : {
                                      "DevA" : []
                                      }
                           },
              "Sales" : {
                          "Dev1" : []
                        }
              }

# parent_folder        = ""
# topfolder_names      = ["fldr-zenseact"]
# envfolder_names      = ["fldr-billing", "fldr-bootstrap", "fldr-platform-dev", "fldr-platform-dev", "fldr-platform-prd", "fldr-landingzones"]
# devfolder_names      = ["fldr-dev-networking", "fldr-dev-common"]
# prdfolder_names      = ["fldr-prd-networking", "fldr-prd-common"]
# set_roles            = "false"


# folder_names_level1   = ["fldr-digitalproduct","fldr-informtiontech","fldr-common"]

# folder_names_level2 = ["fldr-mlai","fldr-cloudsharedservices","fldr-enterprisedata"]

# Project Configurations
# projects = {
#   "prj-dev-mlai-001" = {
#     name          = "prj-dev-mlai-001"
#     parent_folder_id  = "Dev"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "dev" }
#   },
#   "prj-prd-mlai-001" = {
#     name          = "prj-prd-mlai-001"
#     parent_folder_id  = "Prod"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "prod" }
#   },
#   "prj-dev-css-001" = {
#     name          = "prj-dev-css-001"
#     parent_folder_id  = "Non-Prod"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "dev" }
#   },
#   "prj-prod-css-001" = {
#     name          = "prj-prod-css-001"
#     parent_folder_id  = "Commons"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "prod" }
#   },
#   "prj-dev-ed-001" = {
#     name          = "prj-dev-ed-001"
#     parent_folder_id  = "Commons"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "dev" }
#   },
#   "prj-prd-ed-001" = {
#     name          = "prj-prd-ed-001"
#     parent_folder_id  = "Commons"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "prod" }
#   },
#   "prj-shared-vpc-prd" = {
#     name          = "prj-shared-vpc-prd"
#     parent_folder_id  = "Commons"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "commons-networking-dev" }
#   },
#   "prj-shared-vpc-dev" = {
#     name          = "prj-shared-vpc-dev"
#     parent_folder_id  = "Commons"
#     activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
#     labels        = { environment = "commons-networking-prod" }
#   },
#   "prj-logmon-prod" = {
#     name          = "prj-logmon-prd"
#     parent_folder_id  = "Commons"
#     activate_apis = ["monitoring.googleapis.com","logging.googleapis.com"]
#     labels        = { environment = "commons-logging-prod" }
#   },
#   "prj-logmon-dev" = {
#     name          = "prj-logmon-dev"
#     parent_folder_id  = "Commons"
#     activate_apis = ["monitoring.googleapis.com","logging.googleapis.com"]
#     labels        = { environment = "commons-logging-dev" }
#   }
# }

# Shared VPC Configurations
shared_vpc_hosts = {
  "hub-net-central" = {
    network_name    = "hub-centralized-vpc"
    subnets         = [
      {
        name           = "hub-subnet"
        region         = "us-central1"
        ip_cidr_range = "10.220.0.0/22"
      }
    ]
    service_project = null # no service projects for this host
  },
  "prj-dev-ed-001" = {
    network_name = "dev-shared-vpc"
    subnets = [
      {
        name           = "app-subnet"
        region         = "us-central1"
        ip_cidr_range = "10.220.20.0/22"
      },
      {
        name           = "db-subnet"
        region         = "us-central1"
        ip_cidr_range = "10.220.24.0/22"
      }
    ]
    service_project = "prj-dev-mlai-001"
  },
  "prod-net-central" = {
    network_name = "prod-shared-vpc"
    subnets = [
      {
        name           = "app-subnet"
        region         = "us-central1"
        ip_cidr_range = "10.220.4.0/22" 
      },
      {
        name           = "db-subnet"
        region         = "us-central1"
        ip_cidr_range = "10.220.8.0/22"
      }
    ]
    service_project = "prod-ctrl-v2"
  },
  "non-prod-net-central" = {
    network_name = "non-prod-shared-vpc"
    subnets = [
      {
        name           = "app-subnet"
        region         = "us-central1"
        ip_cidr_range = "10.220.12.0/22"
      },
      {
        name           = "db-subnet"
        region         = "us-central1"
        ip_cidr_range = "10.220.16.0/22"
      }
    ]
    service_project = "non-prod-ctrl-v2"
  }
}

vpc_peerings = {
  "hub-to-dev"    = "prj-dev-ed-001"
  "hub-to-prod"   = "prod-net-central"
  "hub-to-nonprod" = "non-prod-net-central"
}