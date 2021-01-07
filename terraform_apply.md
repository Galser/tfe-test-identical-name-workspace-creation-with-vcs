# Terraform apply

```Terraform

 ✘  ~/labs/skills/tfe-test-identical-name-workspace-creation-with-vcs   f-init ●  terraform apply
random_pet.workspace: Refreshing state... [id=secure-lab]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # tfe_workspace.ws-test-doppelganger[0] will be created
  + resource "tfe_workspace" "ws-test-doppelganger" {
      + auto_apply            = false
      + external_id           = (known after apply)
      + file_triggers_enabled = true
      + id                    = (known after apply)
      + name                  = "secure-lab"
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "Galser/tfe-test-identical-name-workspace-creation-with-vcs"
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
      + name                  = "secure-lab"
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "Galser/tfe-test-identical-name-workspace-creation-with-vcs"
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
      + name                  = "secure-lab"
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "Galser/tfe-test-identical-name-workspace-creation-with-vcs"
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
      + name                  = "secure-lab"
      + operations            = true
      + organization          = "migrotest"
      + queue_all_runs        = true
      + terraform_version     = (known after apply)

      + vcs_repo {
          + identifier         = "Galser/tfe-test-identical-name-workspace-creation-with-vcs"
          + ingress_submodules = false
          + oauth_token_id     = "ot-XBbeoMfT8JAtf8yN"
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.


Warning: Version constraints inside provider configuration blocks are deprecated

  on main.tf line 35, in provider "tfe":
  35:   version  = "~> 0.15.0"

Terraform 0.13 and earlier allowed provider version constraints inside the
provider configuration block, but that is now deprecated and will be removed
in a future version of Terraform. To silence this warning, move the provider
version constraint into the required_providers block.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

tfe_workspace.ws-test-main[0]: Creating...
tfe_workspace.ws-test-doppelganger[1]: Creating...
tfe_workspace.ws-test-main[1]: Creating...
tfe_workspace.ws-test-doppelganger[0]: Creating...
tfe_workspace.ws-test-main[0]: Creation complete after 2s [id=ws-paW84yHtFJmkPQob]
tfe_workspace.ws-test-doppelganger[0]: Creation complete after 2s [id=ws-pKF9Npc2ZsEEt4P6]
tfe_workspace.ws-test-main[1]: Creation complete after 2s [id=ws-KvDTvLzHb58u47Ph]
tfe_workspace.ws-test-doppelganger[1]: Creation complete after 2s [id=ws-HRy4t4GJ5pX7aKcj]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

```
