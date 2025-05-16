##---
## Global Configuration
##-
account_id       = "974105205880"
project          = "euc-scbin"
environment      = "staging"
primary_region   = "ap-south-1"
secondary_region = ""
az_selector = [
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1c",
]

tag_map = {
  pattern = "itp.pattern.cd-int-sr-001"
  version = "v100.2"
}

mandatory_tag_map = {
  "active.compliance.account"              = "974105205880"
  "active.compliance.business-regions"     = "mumbai"
  "active.compliance.ibs"                  = "false"
  "active.compliance.org-unit"             = "nonprod-green"
  "active.cost-allocation.cost-center"     = "na"
  "active.cost-allocation.lob"             = ""
  "active.cost-allocation.sub-lob"         = ""
  "active.operations.environment"          = "staging"
  "active.operations.environment-sub-type" = "staging" // Environment
  "active.platform.application-id"         = "51212"       // ITAM ID
  "active.platform.application-name"       = "euc-scbin"
  "active.platform.cloud-onboarding-id"    = "2504002" // LEAP request ID
  "active.platform.criticality"            = "2"
  "active.platform.material"               = "na"
  "passive.compliance.hosting-regions"     = "mumbai"
  "passive.operations.account-type"        = "na"
  "passive.operations.ito-unit"            = "na"
}

## service level configuration

# To be completed
