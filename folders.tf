

# /*****************************************************************************
#  * CREATING TOP LEVEL FOLDERS OF BUSINESS UNIT ATTACHING TO THE ORGANIZATION *
#  *****************************************************************************/


# module "digitalproduct" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = "organizations/${var.org_id}"
#   names = ["fldr-digitalproduct"]
# }

# module "informationtech" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = "organizations/${var.org_id}"
#   names = ["fldr-informationtech"]
# }

# module "common" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = "organizations/${var.org_id}"
#   names  = ["fldr-common"]
# }


# /****************************************************************************
#  * CREATING LEVEL 2 FOLDERS OF TEAM ATTACHING TO TOP LEVEL OF BUSINESS UNIT *
#  ****************************************************************************/



# module "mlai" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.digitalproduct.id
#   names = ["fldr-mlai"]
# }

# module "cloudsharedservices" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.informationtech.id
#   names = ["fldr-cloudsharedservices"]
# }

# module "enterprisedata" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.informationtech.id
#   names = ["fldr-enterprisedata"]
# }

# /********************************************************************************
#  * CREATING LEVEL 3 FOLDERS OF ENVIRONMENT ATTACHING TO LEVEL 2 FOLDERS OF TEAM *
#  ********************************************************************************/

# module "mlai-dev" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.mlai.id
#   names = ["fldr-dev"]
# }

# module "mlai-prod" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.mlai.id
#   names = ["fldr-prod"]
# }

# module "cloudsharedservices-dev" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.cloudsharedservices.id
#   names = ["fldr-dev"]
# }

# module "cloudsharedservices-prod" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.cloudsharedservices.id
#   names = ["fldr-prod"]
# }

# module "enterprisedata-dev" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.enterprisedata.id
#   names = ["fldr-dev"]
# }

# module "enterprisedata-prod" {
#   source  = "terraform-google-modules/folders/google"
#   version = "~> 4.0"

#   parent = module.enterprisedata.id
#   names = ["fldr-prod"]
# }


locals {
  sub_folders1_var = compact(flatten([for k, i in var.folder_map : length(i) == 0 ? [] : [for ip1, op1 in i : join("=1>", [k, ip1])]]))
  sub_folders2_var = compact(flatten([for k, i in var.folder_map : length(i) == 0 ? [] : [for ip1, op1 in i : length(op1) == 0 ? [] : [for ip2, op2 in op1 : join("=2>", [join("=1>", [k, ip1]), ip2])]]]))
  sub_folders3_var = compact(flatten([for k, i in var.folder_map : length(i) == 0 ? [] : [for ip1, op1 in i : length(op1) == 0 ? [] : [for ip2, op2 in op1 : length(op2) == 0 ? [] : [for ip3, op3 in op2 : join("=3>", [join("=2>", [join("=1>", [k, ip1]), ip2]), ip3])]]]]))
}

module "folders" {
  source   = "terraform-google-modules/folders/google//examples/dynamic_example"
  for_each = var.folder_map
  parent   = "organizations/${var.org_id}"
  names    = each.key[*]
}

# module "folders_example_dynamic_example" {
#   source  = "terraform-google-modules/folders/google//examples/dynamic_example"
#   version = "4.0.1"
#   org_id = var.org_id
#   folder_map = var.folder_map
# }

module "sub_folders1" {
  source   = "terraform-google-modules/folders/google//examples/dynamic_example"
  for_each = toset(local.sub_folders1_var)
  parent   = module.folders[element(split("=1>", each.value), 0)].id
  names    = [element(split("=1>", each.value), 1)]
}

module "sub_folders2" {
  source   = "terraform-google-modules/folders/google//examples/dynamic_example"
  for_each = toset(local.sub_folders2_var)
  parent   = module.sub_folders1[element(split("=2>", each.value), 0)].id
  names    = [element(split("=2>", each.value), 1)]
}

module "sub_folders3" {
  source   = "terraform-google-modules/folders/google//examples/dynamic_example"
  for_each = toset(local.sub_folders3_var)
  parent   = module.sub_folders2[element(split("=3>", each.value), 0)].id
  names    = [element(split("=3>", each.value), 1)]
}