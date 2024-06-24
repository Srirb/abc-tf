# Local variable to map folder names to their IDs
locals {
  folder_id_map = merge(
    { for k, v in var.folder_map : k => module.folders[k].id },
    { for i in local.sub_folders1_var : element(split("=1>", i), 1) => module.sub_folders1[i].id },
    { for j in local.sub_folders2_var : element(split("=2>", j), 1) => module.sub_folders2[j].id },
    { for l in local.sub_folders3_var : element(split("=3>", l), 1) => module.sub_folders3[l].id }
  )
}

# Create projects
module "project_factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.0"

  for_each          = var.projects
  name              = each.value.name
  random_project_id = true
  org_id            = var.org_id
  billing_account   = var.billing_account
  folder_id         = local.folder_id_map[each.value.folder_name]
  #activate_apis     = each.value.activate_apis
  labels            = each.value.labels
}
