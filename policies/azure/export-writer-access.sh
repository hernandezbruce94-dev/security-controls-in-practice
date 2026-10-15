#!/usr/bin/env bash
# Chapter 10: container-scoped data access for the export job.
# Status: Documented. Run as an engineer with Microsoft.Authorization/roleAssignments/write
# at the container scope (activated through PIM). Review each command before running.
set -euo pipefail

SUB_ID="<subscription-id>"
RG="rg-exports"
ACCOUNT="stmerexports01"
CONTAINER="service-exports"
MI_NAME="mi-export-writer"

# 1. Create the user-assigned managed identity.
az identity create --name "$MI_NAME" --resource-group "$RG"
PRINCIPAL_ID=$(az identity show -n "$MI_NAME" -g "$RG" --query principalId -o tsv)
CLIENT_ID=$(az identity show -n "$MI_NAME" -g "$RG" --query clientId -o tsv)
echo "principalId=$PRINCIPAL_ID clientId=$CLIENT_ID"

# 2. Assign the data role at container scope using the principal (object) ID (Case 10-E).
SCOPE="/subscriptions/$SUB_ID/resourceGroups/$RG/providers/Microsoft.Storage/storageAccounts/$ACCOUNT/blobServices/default/containers/$CONTAINER"
az role assignment create \
  --assignee-object-id "$PRINCIPAL_ID" \
  --assignee-principal-type ServicePrincipal \
  --role "Storage Blob Data Contributor" \
  --scope "$SCOPE"

# 3. Confirm exactly one assignment.
az role assignment list --assignee "$PRINCIPAL_ID" --all -o table

# 4. Only after the 30-day key-usage review (queries/kql/storage-auth-methods.kql) shows no AccountKey or SAS callers:
# az storage account update --name "$ACCOUNT" --resource-group "$RG" --allow-shared-key-access false
