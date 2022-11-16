#!/bin/bash

RESOURCE_GROUP_NAME=$1
STORAGE_ACCOUNT_NAME=$2
CONTAINER_NAME=$3

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "manadatory params not provided"
    echo "usage: ./create-store.sh <resource-group-name> <storage-account-name> <container-name>"
    exit 1
fi 

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME