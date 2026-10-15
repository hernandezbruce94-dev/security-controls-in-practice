# Security Controls in Practice: Companion Repository

Policies, queries, and test templates for the book **Security Controls in Practice: From Requirements to Working Enterprise Protection** by Bruce L. Hernandez.

The book follows a fictional enterprise, Meridian Regional Services, through 20 controls on Okta, Microsoft Entra ID and Intune, Palo Alto Networks NGFW and Panorama, Zscaler ZIA and ZPA, Microsoft Azure, AWS, Tenable, Microsoft Defender for Office 365 and Purview, and Cortex XSIAM. This repository provides the material behind those chapters as files you can adapt.

> **Read this first.** Every hostname, address, group, account, and ID here is fictional or a `<placeholder>`. Nothing here has been run against your environment. Product behavior is labeled **Documented** (based on vendor documentation reviewed October 2026), not lab-tested. Vendor schemas, CLI flags, and defaults change. Review every file, test in a non-production tenant, and follow your change process before you apply anything to production.

## Contents

| Folder | What it holds | Book chapters |
|---|---|---|
| `policies/okta` | Tier 2 authentication policy (Terraform) | 4 |
| `policies/entra` | CA-012 Conditional Access policy (Microsoft Graph JSON) | 5 |
| `policies/intune` | Windows compliance baseline (Microsoft Graph JSON) and tenant settings | 5 |
| `policies/panos` | DC1 Panorama rulebase (set commands) | 7 |
| `policies/zpa` | Private access design specification | 8 |
| `policies/zia` | SSL/TLS inspection rule design, QUIC and DNS controls, developer trust settings | 9 |
| `policies/azure` | Managed identity and container-scope role, job authentication, Azure Policy assignment | 10, 11 |
| `policies/aws` | Role trust and permissions, bucket policy, SCP, CloudTrail data-event selector | 12, 13 |
| `policies/defender` | Read-only inspection of preset policies and quarantine policies | 16 |
| `policies/purview` | DLP policy in test mode | 17 |
| `queries/kql` | Storage authorization, CA-012 results, CA changes, PIM activations | 5, 6, 10, 20 |
| `queries/xql` | Onboarding validation: gaps, field completeness, latency | 18 |
| `queries/okta` | System Log saved searches | 4, 18, 19 |
| `queries/panos` | `test security-policy-match` cases and diagnostics | 7 |
| `queries/aws` | CloudTrail, credential, and log-integrity checks | 12, 13 |
| `tests` | One CSV per chapter with every verification case from the book, ready to record results | 2 to 20 |
| `templates` | Verification record, verification log, control register, exception register, onboarding register, change checklist, operating acceptance | 1, 3, 15, 18, 20 |
| `mapping` | Chapter-to-framework mapping: NIST SP 800-53 Rev. 5, SP 800-171 Rev. 2, CMMC Level 2 | Appendix D |

## How to use the test matrices

Each `tests/chNN-verification.csv` lists the book's verification cases with their expected observations. Fill in the case type, preconditions, observed result, evidence reference, tester, date, and reviewer as you run each case. Set `evidence_status` to **Lab-tested** only when the case actually ran in a lab and passed. The book's status labels are defined in Chapter 1.

## Framework mapping

`mapping/framework-mapping.csv` shows where each chapter's mechanism contributes implementation or evidence. It does not mean a chapter satisfies a requirement on its own. CMMC Level 2 currently uses NIST SP 800-171 Rev. 2 numbering; see the book's Appendix D for the Rev. 3 transition note.

## Corrections and contributions

Corrections to vendor behavior are welcome as issues. Please include a link to the vendor documentation that supports the change.

## License

Code and templates are released under the MIT License (see `LICENSE`). The book's text and illustrations are not included and remain under the author's copyright. Product names are trademarks of their respective owners; no vendor sponsored or endorsed this material.
