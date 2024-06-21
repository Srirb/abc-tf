# /*****************************************************
#  * CALLING RANDOM MODULE TO ASSIGN LOGGING SYNC NAME *
#  *****************************************************/

# resource "random_id" "suffix" {
#   byte_length = 4
# }

# /*****************************************
#  * CREATING SYNC AT FOLDER LEVEL FOR DEV *
#  *****************************************/

# module "logsink-logbucketsink-mlai-dev" {
#   source  = "terraform-google-modules/log-export/google"
#   version = ">= 7.3.0"

#   destination_uri      = module.logging-destination-dev.destination_uri
#   log_sink_name        = "${var.org_id}-logbucketsink-${random_id.suffix.hex}"
#   parent_resource_id   = module.mlai-dev.id
#   parent_resource_type = "folder"
#   include_children     = true
#   filter               = "logName: /logs/cloudaudit.googleapis.com%2Factivity OR logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency"
# }

# module "logsink-logbucketsink-cloudsharedservices-dev" {
#   source  = "terraform-google-modules/log-export/google"
#   version = ">= 7.3.0"

#   destination_uri      = module.logging-destination-dev.destination_uri
#   log_sink_name        = "${var.org_id}-logbucketsink-${random_id.suffix.hex}"
#   parent_resource_id   = module.cloudsharedservices-dev.id
#   parent_resource_type = "folder"
#   include_children     = true
#   filter               = "logName: /logs/cloudaudit.googleapis.com%2Factivity OR logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency"
# }

# module "logsink-logbucketsink-enterprisedata-dev" {
#   source  = "terraform-google-modules/log-export/google"
#   version = ">= 7.3.0"

#   destination_uri      = module.logging-destination-dev.destination_uri
#   log_sink_name        = "${var.org_id}-logbucketsink-${random_id.suffix.hex}"
#   parent_resource_id   = module.enterprisedata-dev.id
#   parent_resource_type = "folder"
#   include_children     = true
#   filter               = "logName: /logs/cloudaudit.googleapis.com%2Factivity OR logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency"
# }

# /*******************************************
#  * POINTING TO DEV LOG DESTINATION PROJECT *
#  *******************************************/

# module "logging-destination-dev" {
#   source  = "terraform-google-modules/log-export/google//modules/logbucket"
#   version = ">= 7.4.1"

#   project_id               = module.prj-logmon-dev.project_id
#   name                     = "abc-dev-centralized-logging"
#   location                 = "australia-southeast1"
#   retention_days           = 90
#   log_sink_writer_identity = module.logsink-logbucketsink.writer_identity
# }

# /*****************************************
#  * CREATING SYNC AT FOLDER LEVEL FOR PRD *
#  *****************************************/

# module "logsink-logbucketsink-mlai-prd" {
#   source  = "terraform-google-modules/log-export/google"
#   version = ">= 7.3.0"

#   destination_uri      = module.logging-destination-prd.destination_uri
#   log_sink_name        = "${var.org_id}-logbucketsink-${random_id.suffix.hex}"
#   parent_resource_id   = module.mlai-prd.id
#   parent_resource_type = "folder"
#   include_children     = true
#   filter               = "logName: /logs/cloudaudit.googleapis.com%2Factivity OR logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency"
# }

# module "logsink-logbucketsink-cloudsharedservices-prd" {
#   source  = "terraform-google-modules/log-export/google"
#   version = ">= 7.3.0"

#   destination_uri      = module.logging-destination-prd.destination_uri
#   log_sink_name        = "${var.org_id}-logbucketsink-${random_id.suffix.hex}"
#   parent_resource_id   = module.cloudsharedservices-prd.id
#   parent_resource_type = "folder"
#   include_children     = true
#   filter               = "logName: /logs/cloudaudit.googleapis.com%2Factivity OR logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency"
# }

# module "logsink-logbucketsink-enterprisedata-prd" {
#   source  = "terraform-google-modules/log-export/google"
#   version = ">= 7.3.0"

#   destination_uri      = module.logging-destination-prd.destination_uri
#   log_sink_name        = "${var.org_id}-logbucketsink-${random_id.suffix.hex}"
#   parent_resource_id   = module.enterprisedata-prd.id
#   parent_resource_type = "folder"
#   include_children     = true
#   filter               = "logName: /logs/cloudaudit.googleapis.com%2Factivity OR logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency"
# }

# /*******************************************
#  * POINTING TO PRD LOG DESTINATION PROJECT *
#  *******************************************/

# module "logging-destination-prd" {
#   source  = "terraform-google-modules/log-export/google//modules/logbucket"
#   version = ">= 7.4.1"

#   project_id               = module.prj-logmon-prd.project_id
#   name                     = "abc-prd-centralized-logging"
#   location                 = "australia-southeast1"
#   retention_days           = 90
#   log_sink_writer_identity = module.logsink-logbucketsink.writer_identity
# }

