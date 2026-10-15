#!/usr/bin/env bash
# Chapter 10: how the export job authenticates on vm-export-01.
# Always name the identity explicitly (Case 10-C). The flag that selects a
# user-assigned identity has changed across Azure CLI versions; confirm it for your version.
set -euo pipefail
az login --identity --client-id "<mi-export-writer-client-id>"
az storage blob upload \
  --account-name stmerexports01 \
  --container-name service-exports \
  --name "$(date -u +%F)/export.csv" \
  --file /data/export.csv \
  --auth-mode login
