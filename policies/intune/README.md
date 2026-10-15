# Intune compliance (Chapter 5)

`CP-Win-Baseline.json` is a Microsoft Graph `windows10CompliancePolicy` body. Property names and semantics change between Graph versions. Compare each property with the current Graph reference before you create the policy. For example, confirm that `signatureOutOfDate: true` means "require up-to-date definitions" in your API version.

Tenant-wide settings this control depends on (set in the Intune admin center, under compliance policy settings):

| Setting | Meridian value |
|---|---|
| Mark devices with no compliance policy assigned as | Not compliant |
| Compliance status validity period (days) | 14 |

Status: **Documented**.
