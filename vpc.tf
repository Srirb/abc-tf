# locals {

#   # Filter out projects without a 'name' attribute
# project_factory = module.project_factory
# }

# # Shared VPC Host Projects
# module "shared_vpc_host" {
#   source  = "terraform-google-modules/network/google"
#   version = "~> 9.1"

#   for_each = var.shared_vpc_hosts

#   project_id              = local.project_factory[each.key].project_id
#   network_name            = each.value.network_name
#   routing_mode            = "GLOBAL"
#   delete_default_internet_gateway_routes = true

#   subnets = [
#     for subnet in each.value.subnets :
#     {
#       subnet_name           = subnet.name
#       subnet_region         = subnet.region
#       subnet_ip             = subnet.ip_cidr_range
#       subnet_private_access = true
#     }
#   ]

#   depends_on = [
#     module.project_factory,
#     google_compute_shared_vpc_host_project.host # Wait for host project to be enabled
#   ]
# }

# # Enable Shared VPC Host Projects
# resource "google_compute_shared_vpc_host_project" "host" {
#   for_each = var.shared_vpc_hosts
#   project = local.project_factory[each.key].project_id
# }

# # Shared VPC Service Project Attachments
# resource "google_compute_shared_vpc_service_project" "service_project" {
#   for_each           = { for k, v in var.shared_vpc_hosts : k => v if v.service_project != null }
#   host_project       = local.project_factory[each.key].project_id       
#   service_project    = local.project_factory[each.value.service_project].project_id  

#   depends_on = [
#     google_compute_shared_vpc_host_project.host # Wait for host project to be enabled
#   ]
# }

