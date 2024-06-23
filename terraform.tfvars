# Organization and Billing
org_id         = "312552542091"
billing_account = "01EAA1-C5FBBB-98F223"
region         = "australia-southeast1"
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
    "fldr-enterprisedata": {
      "fldr-ed-dev": [],
      "fldr-ed-prod": []
    }
  },
  "fldr-common": []
}

# Project Configurations
projects = {
  "prj-dev-mlai-001" = {
    name          = "prj-dev-mlai-001"
    folder_name  = "fldr-mlai-dev"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-prd-mlai-001" = {
    name          = "prj-prd-mlai-001"
    folder_name  = "fldr-mlai-prod"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-dev-css-001" = {
    name          = "prj-dev-css-001"
    folder_name  = "fldr-css-dev"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-prod-css-001" = {
    name          = "prj-prod-css-001"
    folder_name  = "fldr-css-prod"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-dev-ed-001" = {
    name          = "prj-dev-ed-001"
    folder_name  = "fldr-ed-dev"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-prd-ed-001" = {
    name          = "prj-prd-ed-001"
    folder_name  = "fldr-ed-prod"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-shared-vpc-prd" = {
    name          = "prj-shared-vpc-prd"
    folder_name  = "fldr-common"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-shared-vpc-dev" = {
    name          = "prj-shared-vpc-dev"
    folder_name  = "fldr-common"
    activate_apis = ["compute.googleapis.com","iam.googleapis.com","serviceusage.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-logmon-prod" = {
    name          = "prj-logmon-prd"
    folder_name  = "fldr-common"
    activate_apis = ["monitoring.googleapis.com","logging.googleapis.com"]
    labels        = { environment = "prod" }
  },
  "prj-logmon-dev" = {
    name          = "prj-logmon-dev"
    folder_name  = "fldr-common"
    activate_apis = ["monitoring.googleapis.com","logging.googleapis.com"]
    labels        = { environment = "dev" }
  },
  "prj-hub-vpc" = {
    name          = "prj-hub-vpc"
    folder_name  = "fldr-common"
    activate_apis = ["monitoring.googleapis.com","logging.googleapis.com"]
    labels        = { environment = "hub" }
  }
}

# Shared VPC Configurations
shared_vpc_hosts = {
  "prj-hub-vpc" = {
    network_name    = "hub-base"
    subnets         = [
      {
        name           = "sb-hub-shared-base-1"
        region         = "australia-southeast1"
        ip_cidr_range = "10.146.62.0/24"
        flow_logs = "true"
        subnet_flow_logs_interval = "INTERVAL_10_MIN"
        subnet_flow_logs_sampling = 1
        subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      },
      {
        name           = "sb-hub-shared-base-2"
        region         = "australia-southeast1"
        ip_cidr_range = "10.146.63.0/24"
        flow_logs = "true"
        subnet_flow_logs_interval = "INTERVAL_10_MIN"
        subnet_flow_logs_sampling = 1
        subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      }
    ]
    service_project = null # no service projects for this host
  },
  "prj-shared-vpc-dev" = {
    network_name = "non-prod-base"
    subnets = [
      {
        name           = "sb-dev-shared-base-1"
        region         = "australia-southeast1"
        ip_cidr_range = "10.146.8.0/22"
        flow_logs = "true"
        subnet_flow_logs_interval = "INTERVAL_10_MIN"
        subnet_flow_logs_sampling = 1
        subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      },
      {
        name           = "sb-dev-shared-base-2"
        region         = "australia-southeast1"
        ip_cidr_range = "10.146.12.0/22"
        flow_logs = "true"
        subnet_flow_logs_interval = "INTERVAL_10_MIN"
        subnet_flow_logs_sampling = 1
        subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      }
    ]
    service_project = "prj-dev-mlai-001"
  },
  "prj-shared-vpc-prd" = {
    network_name = "prod-base"
    subnets = [
      {
        name           = "sb-dev-shared-base-1"
        region         = "australia-southeast1"
        ip_cidr_range = "10.146.0.0/22"
        flow_logs = "true"
        subnet_flow_logs_interval = "INTERVAL_10_MIN"
        subnet_flow_logs_sampling = 1
        subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      },
      {
        name           = "sb-dev-shared-base-2"
        region         = "australia-southeast1"
        ip_cidr_range = "10.146.4.0/22"
        flow_logs = "true"
        subnet_flow_logs_interval = "INTERVAL_10_MIN"
        subnet_flow_logs_sampling = 1
        subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      }
    ]
    service_project = "prj-prd-mlai-001"
  }
}

vpc_peerings = {
  "prj-hub-vpc"    = "prj-shared-vpc-dev"
  "prj-hub-vpc"   = "prj-shared-vpc-prd"
}