# Organization and Billing
org_id         = "312552542091"
billing_account = "01EAA1-C5FBBB-98F223"
region         = "us-central1"
backend = "buc-terraform-abc-tst"

# Folder Structure

folder_map = {
  "fldr-digitalproduct": {
    "fldr-mlai": {
      "fldr-mlai-dev": [],
      "fldr-mlai-prod": []
    }
  },
  "fldr-informtiontech": {
    "fldr-cloudsharedservices": {
      "fldr-css-dev": [],
      "fldr-css-prod": []
    },
    "fidr-enterprisedata": {
      "fldr-css-dev": [],
      "fldr-css-prod": []
    }
  },
  "fldr-common": []
}

# Project Configurations
projects = {
  "prj-dev-mlai-001" = {
    name          = "prj-dev-mlai-001"
    parent_folder_id  = "Dev"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-prd-mlai-001" = {
    name          = "prj-prd-mlai-001"
    parent_folder_id  = "Prod"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-dev-css-001" = {
    name          = "prj-dev-css-001"
    parent_folder_id  = "Non-Prod"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-prod-css-001" = {
    name          = "prj-prod-css-001"
    parent_folder_id  = "Commons"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-dev-ed-001" = {
    name          = "prj-dev-ed-001"
    parent_folder_id  = "Commons"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-prd-ed-001" = {
    name          = "prj-prd-ed-001"
    parent_folder_id  = "Commons"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-shared-vpc-prd" = {
    name          = "prj-shared-vpc-prd"
    parent_folder_id  = "Commons"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "commons-networking-dev" }
  },
  "prj-shared-vpc-dev" = {
    name          = "prj-shared-vpc-dev"
    parent_folder_id  = "Commons"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "commons-networking-prod" }
  },
  "prj-logmon-prod" = {
    name          = "prj-logmon-prd"
    parent_folder_id  = "Commons"
    activate_apis = ["monitoring.googleapis.com","logging.googleapis.com"]
    labels        = { environment = "commons-logging-prod" }
  },
  "prj-logmon-dev" = {
    name          = "prj-logmon-dev"
    parent_folder_id  = "Commons"
    activate_apis = ["monitoring.googleapis.com","logging.googleapis.com"]
    labels        = { environment = "commons-logging-dev" }
  }
}

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