# AWS (Chapters 12 and 13)

| File | Purpose |
|---|---|
| `role-invoice-reader-trust.json` | Trust policy: EC2 can assume the role |
| `role-invoice-reader-permissions.json` | Least-privilege read of `incoming/` plus KMS decrypt (Case 12-A) |
| `bucket-policy-meridian-invoices-prod.json` | TLS-only and approved-role denies using `aws:PrincipalArn` |
| `scp-protect-logging.json` | Organization guardrail protecting CloudTrail, Config, and Block Public Access |
| `cloudtrail-data-events-selector.json` | Advanced event selector for S3 data events on one bucket |

Apply the data-event selector to an existing trail:

```bash
aws cloudtrail put-event-selectors --trail-name org-trail \
  --advanced-event-selectors file://cloudtrail-data-events-selector.json
```

`put-event-selectors` replaces the trail's existing selectors. Include management-event selectors in the same file if the trail uses advanced selectors for them.

Test explicit denies in a non-production bucket first, and keep a break-glass session open while you test.

Status: **Documented**.
