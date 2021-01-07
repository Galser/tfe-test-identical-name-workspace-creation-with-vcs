# Terraform plan

```Terraform
 ~/labs/skills/tfe-test-identical-name-workspace-creation-with-vcs   f-init ●  terraform plan

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.workspace will be created
  + resource "random_pet" "workspace" {
      + id        = (known after apply)
      + length    = 2
      + separator = "-"
    }

  # tfe_workspace.ws-test-doppelganger[0] will be created
  + resource "tfe_workspace" "ws-test-doppelganger" {
      + auto_apply            = false
      + external_id           = (known after apply)
      + file_triggers_enabled = true
      + id                    = (known after apply)
      + name                  = (known after apply)
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "hashitop/test_null_resource"
          + ingress_submodules = false
          + oauth_token_id     = "ot-XBbeoMfT8JAtf8yN"
        }
    }

  # tfe_workspace.ws-test-doppelganger[1] will be created
  + resource "tfe_workspace" "ws-test-doppelganger" {
      + auto_apply            = false
      + external_id           = (known after apply)
      + file_triggers_enabled = true
      + id                    = (known after apply)
      + name                  = (known after apply)
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "hashitop/test_null_resource"
          + ingress_submodules = false
          + oauth_token_id     = "ot-XBbeoMfT8JAtf8yN"
        }
    }

  # tfe_workspace.ws-test-main[0] will be created
  + resource "tfe_workspace" "ws-test-main" {
      + auto_apply            = false
      + external_id           = (known after apply)
      + file_triggers_enabled = true
      + id                    = (known after apply)
      + name                  = (known after apply)
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "hashitop/test_null_resource"
          + ingress_submodules = false
          + oauth_token_id     = "ot-XBbeoMfT8JAtf8yN"
        }
    }

  # tfe_workspace.ws-test-main[1] will be created
  + resource "tfe_workspace" "ws-test-main" {
      + auto_apply            = false
      + external_id           = (known after apply)
      + file_triggers_enabled = true
      + id                    = (known after apply)
      + name                  = (known after apply)
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "hashitop/test_null_resource"
          + ingress_submodules = false
          + oauth_token_id     = "ot-XBbeoMfT8JAtf8yN"
        }
    }

Plan: 5 to add, 0 to change, 0 to destroy.

Warning: Version constraints inside provider configuration blocks are deprecated

  on main.tf line 35, in provider "tfe":
  35:   version  = "~> 0.15.0"

Terraform 0.13 and earlier allowed provider version constraints inside the
provider configuration block, but that is now deprecated and will be removed
in a future version of Terraform. To silence this warning, move the provider
version constraint into the required_providers block.


------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

