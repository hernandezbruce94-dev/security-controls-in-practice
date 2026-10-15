# Okta System Log saved searches (Chapters 4 and 19)

| Purpose | Filter expression |
|---|---|
| Which rule matched for the Field Service Portal | `eventType eq "policy.evaluate_sign_on" and target.displayName eq "Field Service Portal"` |
| All policy and rule changes (Case 4-A) | `eventType sw "policy.rule" or eventType sw "policy.lifecycle"` |
| SSO failures | `eventType eq "user.authentication.sso" and outcome.result eq "FAILURE"` |
| API token creation (Case 18-B) | `eventType eq "system.api_token.create"` |

Event types change. Confirm against the Okta event type catalog: https://developer.okta.com/docs/reference/api/event-types/

The same filters work with the System Log API: `GET /api/v1/logs?filter=<expression>&since=<ISO-8601>`.
