#!/usr/bin/env bash
# Chapter 11: assign built-in storage definitions at the management group in DoNotEnforce mode.
# Built-in definitions are looked up by display name, so no GUIDs are hard-coded.
# Status: Documented. Some built-ins expose an "effect" parameter; inspect each
# definition's parameters before passing --params.
set -euo pipefail
MG="mg-meridian-prod"
SCOPE="/providers/Microsoft.Management/managementGroups/$MG"
DEFS=(
  "Storage accounts should prevent shared key access"
  "Storage account public access should be disallowed"
  "Storage accounts should disable public network access"
  "Secure transfer to storage accounts should be enabled"
)
for d in "${DEFS[@]}"; do
  ID=$(az policy definition list --query "[?displayName=='$d'].id | [0]" -o tsv)
  if [ -z "$ID" ]; then echo "Not found: $d (display names change; search the built-in list)"; continue; fi
  NAME="mer-$(echo "$d" | tr 'A-Z ' 'a-z-' | cut -c1-50)"
  az policy assignment create --name "$NAME" --display-name "MER: $d" \
    --policy "$ID" --scope "$SCOPE" --enforcement-mode DoNotEnforce
done
echo "Review compliance, then change enforcement mode to Default through change control."
