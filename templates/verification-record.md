# Verification record

One record per verification case (book Appendix A). A completed record should let a second engineer repeat the test and compare results without asking the original tester anything.

| Field | Entry |
|---|---|
| Case ID | |
| Control (register entry) | |
| Case type | Intended success / Intended denial / Boundary / Failure condition |
| Configuration version | Export file, commit, or snapshot reference |
| Preconditions | Test identity, device, network location, group memberships |
| Action | |
| Expected observation (written before execution) | |
| Observed result | |
| Evidence | Query and result, export, screenshot reference, timestamps with time zone |
| Result | Pass / Fail / Blocked |
| Evidence status | Documented / Lab-tested / Design pattern / Customer-validated / Assumption |
| Tester, date and time | |
| Reviewer | |
| Follow-up | Ticket or change record for any failure |

A record marked **Pass** must have the evidence status **Lab-tested** or **Customer-validated**.
