#!/bin/bash

RESOURCE_GROUP_NAME=$1

if [ -z "$1" ]; then
    echo "manadatory params not provided"
    echo "usage: ./delete-store.sh <resource-group-name>"
    exit 1
fi 

# Delete resource group
az group delete --name $RESOURCE_GROUP_NAME
