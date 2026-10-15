// Chapter 18: onboarding validation patterns for Cortex XSIAM.
// Replace <source_dataset> and <user_field> with names from your tenant's dataset schema.
// Status: Documented pattern; confirm functions and fields in your tenant version.

// 1. Gaps over time (V18-1, Case 18-B)
config timeframe = 7d
| dataset = <source_dataset>
| bin _time span = 1h
| comp count() as events by _time
| sort asc _time

// 2. Field completeness (Case 18-E)
config timeframe = 24h
| dataset = <source_dataset>
| alter has_user = if(<user_field> != null, 1, 0)
| comp count() as events, sum(has_user) as with_user

// 3. Latency (V18-7, Case 18-C)
config timeframe = 24h
| dataset = <source_dataset>
| alter lag_s = timestamp_diff(_insert_time, _time, "SECOND")
| comp avg(lag_s) as avg_lag, max(lag_s) as max_lag, min(lag_s) as min_lag

// 4. Firewall events by device and rule (V18-1, Case 18-A)
config timeframe = 1h
| dataset = <ngfw_traffic_dataset>
| comp count() as events by <device_field>, <rule_field>
