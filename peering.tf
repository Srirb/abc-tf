# module "peering" {
#   source                     = "terraform-google-modules/network/google//modules/network-peering"
#   version                    = "~> 5.0"  # Match the network module version
#   for_each                   = var.vpc_peerings
#   prefix                     = "peering"       # Optional prefix for peering names
#   local_network              = module.shared_vpc_host[each].network_self_link
#   peer_network               = module.shared_vpc_host[each.value].network_self_link

#   # Optional: Export custom routes if needed
#   export_local_custom_routes = true  
#   export_peer_custom_routes  = true
# }