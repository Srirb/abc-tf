# module "skip-default-network" {
#   source  = "terraform-google-modules/org-policy/google//modules/skip_default_network"
#   version = "~> 5.0"

#   policy_for      = "organization"
#   organization_id = var.org_id
# }

# module "bucket-policy-only" {
#   source  = "terraform-google-modules/org-policy/google//modules/bucket_policy_only"
#   version = "~> 5.0"

#   policy_for      = "organization"
#   organization_id = var.org_id
# }