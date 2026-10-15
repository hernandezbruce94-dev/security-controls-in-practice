# Okta authentication policies (Chapter 4)

- `tier2-authentication-policy.tf` describes the Tier 2 policy and its specific rule.
- The policy is **shared**. Before you change it, list every application attached to it and run V4-7 for each one.
- Set the catch-all rule to **Deny**.

Saved System Log searches are in `../../queries/okta/`.

Status: **Documented**.
