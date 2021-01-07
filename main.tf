# VARIABLES
# We putting them here as we want to have ON code file for thw hole test
# ---


# Variables
variable "hostname" {
  default = "tfe-migtest-2.guselietov.com"
}

variable "org" {
  default = "migrotest"  
}

variable "oauth_token" {
  default = "ot-XBbeoMfT8JAtf8yN" # VCS! 
}

variable "repo_identifier" {
  default = "Galser/tfe-test-identical-name-workspace-creation-with-vcs"
}

resource "random_pet" "workspace" { }

# LOCALS
locals {
  workspace_to_create = random_pet.workspace.id
  resources_count = 2
}

provider "tfe" {
  hostname = var.hostname
#  token    = var.token. --> oinly if we really want it
#  for the test we assume it is coming from TFE_TOKEN env var
  version  = "~> 0.15.0"
}

# RESOURCES 

# Creating workspace(s) 1 
resource "tfe_workspace" "ws-test-main" {
  count        = local.resources_count
  name         = local.workspace_to_create
  organization = var.org
  vcs_repo {
    identifier         = var.repo_identifier
    ingress_submodules = false
    oauth_token_id     = var.oauth_token
  }
}


# Creating workspace(s) 2
resource "tfe_workspace" "ws-test-doppelganger" {
  count        = local.resources_count
  name         = local.workspace_to_create
  organization = var.org
  vcs_repo {
    identifier         = var.repo_identifier
    ingress_submodules = false
    oauth_token_id     = var.oauth_token
  }
}

