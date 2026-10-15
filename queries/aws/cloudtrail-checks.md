# AWS CloudTrail checks (Chapters 12 and 13)

Management events, last 90 days (event history):

```bash
# Who tried to stop logging?
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=StopLogging
# KMS decrypt failures behind an S3 AccessDenied (Case 12-A)
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=Decrypt \
  --query "Events[?contains(CloudTrailEvent, 'AccessDenied')]"
```

On the instance (Case 12-C):

```bash
aws sts get-caller-identity   # must show assumed-role/role-invoice-reader/...
env | grep -E '^AWS_(ACCESS_KEY_ID|SECRET_ACCESS_KEY|PROFILE)='   # must return nothing
```

Data events (S3 object reads) aren't in event history. Query them from the trail's log bucket, a CloudTrail Lake event data store, or your SOC platform. Filter on `eventName = GetObject` and `userIdentity.arn` containing `role-invoice-reader`.

Validate log integrity (V13-5):

```bash
aws cloudtrail validate-logs --trail-arn <org-trail-arn> --start-time <ISO-8601>
```
