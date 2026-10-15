# Microsoft Entra Conditional Access (Chapter 5)

`CA-012-require-compliant-device.json` is a Microsoft Graph `conditionalAccessPolicy` body for the Chapter 5 design.

- It is created in **report-only** state (`enabledForReportingButNotEnforced`). Change `state` to `enabled` only after the observation period and verification cases V5-1 to V5-7 pass.
- Replace each `<object-id-...>` placeholder with the object ID from your tenant.
- Emergency access accounts must stay excluded.

Create the policy with Microsoft Graph (requires `Policy.ReadWrite.ConditionalAccess`):

```powershell
Connect-MgGraph -Scopes "Policy.ReadWrite.ConditionalAccess","Policy.Read.All"
$body = Get-Content .\CA-012-require-compliant-device.json -Raw
Invoke-MgGraphRequest -Method POST -Uri "https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies" -Body $body -ContentType "application/json"
```

Export the current state for the baseline and drift comparison (Chapter 20):

```powershell
Invoke-MgGraphRequest -Method GET -Uri "https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies" -OutputFilePath .\ca-policies-export.json
```

Status: **Documented**. Validate against the current Graph schema before you use it.
