/**************************************
 * CREATING NESSESARY LOCAL VARIABLES *
 **************************************/

locals {
  project_factory = module.project_factory
  flattened_service_projects = flatten([
    for host_key, host_value in var.shared_vpc_hosts :
    [
      for sp in host_value.service_project :
      {
        host_key        = host_key
        service_project = sp
      }
    ]
    if host_value.service_project != null
  ])

  service_projects_map = {
    for item in local.flattened_service_projects :
    "${item.host_key}-${item.service_project}" => item
  }
}

/*************************************
 * CREATING SHARED VPC HOST PROJECTS *
 *************************************/

module "shared_vpc_host" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.1"

  for_each = var.shared_vpc_hosts

  project_id              = local.project_factory[each.key].project_id
  network_name            = each.value.network_name
  routing_mode            = "GLOBAL"
  delete_default_internet_gateway_routes = true

  subnets = [
    for subnet in each.value.subnets :
    {
      subnet_name               = subnet.name
      subnet_region             = subnet.region
      subnet_ip                 = subnet.ip_cidr_range
      subnet_private_access     = true
      subnet_flow_logs          = subnet.flow_logs
      subnet_flow_logs_interval = subnet.subnet_flow_logs_interval
      subnet_flow_logs_sampling = subnet.subnet_flow_logs_sampling
      subnet_flow_logs_metadata = subnet.subnet_flow_logs_metadata
    }
  ]

  depends_on = [
    module.project_factory,
    google_compute_shared_vpc_host_project.host
  ]
}

/*************************************
 * ENABLING SHARED VPC HOST PROJECTS *
 *************************************/

resource "google_compute_shared_vpc_host_project" "host" {
  for_each = var.shared_vpc_hosts
  project  = local.project_factory[each.key].project_id
}

/******************************************
 * SHARED VPC SERVICE PROJECT ATTACHMENTS *
 ******************************************/

# resource "google_compute_shared_vpc_service_project" "service_project" {
#   for_each           = { for k, v in var.shared_vpc_hosts : k => v if v.service_project != null }
#   host_project       = local.project_factory[each.key].project_id       
#   service_project    = [for sp in each.value.service_project : local.project_factory[sp].project_id]  

#   depends_on = [
#     google_compute_shared_vpc_host_project.host # Wait for host project to be enabled
#   ]
# }
# resource "google_compute_shared_vpc_service_project" "service_project" {
#   for_each = {
#     for host_key, host_value in var.shared_vpc_hosts :
#     host_key => host_value.service_project
#     if host_value.service_project != null
#   }
#   host_project    = local.project_factory[each.key].project_id
#   service_project = local.project_factory[each.value].project_id

#   depends_on = [
#     google_compute_shared_vpc_host_project.host # Wait for host project to be enabled
#   ]
# }
resource "google_compute_shared_vpc_service_project" "service_project_individual" {
  for_each = local.service_projects_map

  host_project    = local.project_factory[each.value.host_key].project_id
  service_project = local.project_factory[each.value.service_project].project_id

  depends_on = [
    google_compute_shared_vpc_host_project.host
  ]
}