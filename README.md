# tfe-test-identical-name-workspace-creation-with-vcs
Repo to test possibility of creating in TFE two (2) workspaces with IDENTICAL names (which should not be possible according to our documentation) - with VCS settings defined

Based on : https://github.com/Galser/tfe-test-identical-name-workspace-creation

# Hypothesis

According to our manuals here: https://www.terraform.io/docs/cloud/workspaces/creating.html :

> Each new workspace needs a unique name, and needs to know where its Terraform configuration will come from.

And from here : 

> Workspace names need to be 90 characters or less and can only include letters, numbers, -, and _.

> The best way to make names that are both unique and useful is to combine the workspace's most distinguishing attributes in a consistent order. Attributes can be any defining characteristic of a workspace — such as the component being managed, the environment it runs in, and the region it is provisioned into.

So there is no **BOLD** requirement for it to be unique, yet normally when you are trying to create a workspace with the same name it fails.

While we have a screenshot : 

![identically named_workspaces screenshot](identically_named_workspaces.png)

# Test

Providing the code in [main.tf](main.tf) include the following piece for workspaces creation : 

```Terraform
...
# Creating workspace 1 
resource "tfe_workspace" "ws-test-main" {
  name         = local.workspace_to_create
  organization = var.org
}

# Creating workspace 2
resource "tfe_workspace" "ws-test-doppelganger" {
  name         = local.workspace_to_create
  organization = var.org
}
...
```
> I've left away variables and provider definition

We defined also **TFE_TOKEN** env variable with the value of the freshly created API TOKEN for the used TFE instance,

Plan (*successfully*) goes like this : 

```Terraform
Terraform v0.13.5
Configuring remote state backend...
Initializing Terraform configuration...
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

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

  # tfe_workspace.ws-test-doppelganger will be created
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
    }

  # tfe_workspace.ws-test-main will be created
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
    }

Plan: 3 to add, 0 to change, 0 to destroy.
```

And apply, as expected fails on 2-nd workspace creation : 

```bash
 
 
 
Terraform v0.13.5
Initializing plugins and modules...
random_pet.workspace: Creating...
random_pet.workspace: Creation complete after 0s [id=advanced-yeti]
tfe_workspace.ws-test-main: Creating...
tfe_workspace.ws-test-doppelganger: Creating...
tfe_workspace.ws-test-doppelganger: Creation complete after 0s [id=ws-qqiWXbvjZkNVvcbS]

Error: Error creating workspace advanced-yeti for organization migrotest: invalid attribute

Name has already been taken

  on main.tf line 30, in resource "tfe_workspace" "ws-test-main":
  30: resource "tfe_workspace" "ws-test-main" {
```

# Conclusion

For the TFE versions : v202005-2 and v202012-2 and TF versions ranging from v 0.12.24 up to v 0.13.5 the behavior is the same : 

```Terraform
Error: Error creating workspace XXX for organization YYYY : invalid attribute

Name has already been taken
```

We could not reproduce this issue in either of combinations, literally the same as customer claiming, or newer

# TODO

- [x] save historical evidence
- [x] make testing code
- [x] test
- [x] conclusion


Test of the creation of 2 identical workspaces in TFE, provided that we have VCS settings defined
