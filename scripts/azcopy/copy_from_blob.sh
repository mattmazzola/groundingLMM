#!/bin/bash

set -e

DRY_RUN="${1:-True}"

STORAGE_ACCOUNT_NAME=willowdev
STORAGE_CONTAINER_NAME=data
STORAGE_BLOB_ENDPOINT=$(az storage account show -n $STORAGE_ACCOUNT_NAME --subscription $EFFICIENT_AI_SUBSCRIPTION_ID --query "primaryEndpoints.blob" -o tsv)
STORAGE_ACCOUNT_KEY=$(az storage account keys list --account-name $STORAGE_ACCOUNT_NAME --subscription $EFFICIENT_AI_SUBSCRIPTION_ID --query "[0].value" -o tsv)
echo "STORAGE_BLOB_ENDPOINT: $STORAGE_BLOB_ENDPOINT"
echo "STORAGE_ACCOUNT_KEY: ${STORAGE_ACCOUNT_KEY:0:5}...${STORAGE_ACCOUNT_KEY: -5}"

EXPIRATION_DATE=$(date -u -d "60 minutes" '+%Y-%m-%dT%H:%MZ')
SAS=$(az storage account generate-sas \
    --permissions racwdli \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $STORAGE_ACCOUNT_KEY \
    --resource-types sco \
    --services b \
    --expiry $EXPIRATION_DATE \
    -o tsv)

BASE_URL="${STORAGE_BLOB_ENDPOINT}${STORAGE_CONTAINER_NAME}"

echo ""
echo "Copy a local file to blob storage"
echo "================================="

SOURCE="${BASE_URL}/merged_descriptions/2023_12_11T18_59Z/merged_descriptions.jsonl?$SAS"

DESTINATION="_data/merged_descriptions.jsonl"

azcopy cp $SOURCE $DESTINATION --dry-run=$DRY_RUN
