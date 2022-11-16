# Multiple Environments With Terraform on Azure

Example of how to use Terraform for managing multiple environments. Therefore we make use of Terraform Workspaces. Additionally we gonna store the state in an Azure Storage Account.

## Prerequisites
* Azure CLI installed and logged in 
* Terraform CLI installed

## Initialize
* Create Azure Storage Account: `./create-store.sh <resource-group-name> <storage-account-name> <container-name>`. Note that you have to do this step only once, as it is initially needed to store the state. Once it is there and some collaborator wants to work with Terraform on the infrastructure, there is obviously no need to create the storage again. 
* Go to `main.tf` and insert the name of the storage account to respective field (marked with `<CHANGE-ME>`) 
* `terraform init`. 

## Create Workspaces 
* `terraform workspace new dev`
* `terraform workspace new prod`
* Note that you have to do this step only once. Once the workspaces are created, they will be stored in the state. 
## Deploy
* List the available workspaces using `terraform workspace list`
* Select your workspace (equals the environment) using `terraform workspace select <workspace>`
* Run `terraform apply -var-file=variables-<workspace>.tfvars`

## Destroy 
* List the available workspaces using `terraform workspace list`
* Select your workspace (equals the environment) using `terraform workspace select <workspace>`
* Run `terraform destroy -var-file=variables-<workspace>.tfvars`

## Dispose
* `./delete-store.sh <resource-group-name>`
