
#Folder output for validation

output "folder_id" {
  value = [[for k, v in var.folder_map : module.folders[k].ids], [for i in local.sub_folders1_var : module.sub_folders1[i].ids], [for j in local.sub_folders2_var : module.sub_folders2[j].ids], [for l in local.sub_folders3_var : module.sub_folders3[l].ids]]
}

# Project output for validation
locals {
  folder_id_map_out = merge(
    { for k, v in var.folder_map : k => module.folders[k].id },
    { for i in local.sub_folders1_var : element(split("=1>", i), 1) => module.sub_folders1[i].id },
    { for j in local.sub_folders2_var : element(split("=2>", j), 1) => module.sub_folders2[j].id },
    { for l in local.sub_folders3_var : element(split("=3>", l), 1) => module.sub_folders3[l].id }
  )
}

output "folder_id_map_out" {
  value = local.folder_id_map_out
}

output "project_ids" {
  value = { for k, v in var.projects : k => module.project_factory[k].project_id }
}

output "project_folder_mapping" {
  value = { for k, v in var.projects : k => local.folder_id_map_out[v.folder_name] }
}