# Multiple Environments With Terraform on Azure

Example of how to use Terraform for managing multiple environments. Therefore we make use of Terraform Workspaces. Additionally we gonna store the state in an Azure Storage Account.

## Prerequisites
* az cli installed and logged in 
* Terraform CLI installed
* Create Azure Storage Account: `./create-store.sh <resource-group-name> <storage-account-name> <container-name>`
* `terraform init`

## Create Workspaces 
* `terraform workspace new dev`
* `terraform workspace new prod`

## Deploy
* List the available workspaces using `terraform workspace list`
* Select your workspace (equals the environment) using `terraform workspace select <workspace>`
* Run `terraform apply -var-file=variables-<workspace>.tfvars`

## Destroy 
* List the available workspaces using `terraform workspace list`
* Select your workspace (equals the environment) using `terraform workspace select <workspace>`
* Run `terraform destroy -var-file=variables-<workspace>.tfvars`
