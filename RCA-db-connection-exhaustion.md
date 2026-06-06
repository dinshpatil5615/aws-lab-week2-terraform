# RCA: Database Connection Pool Exhaustion
**Date:** 2026-06-06
**Severity:** P1 — Database Unavailable
**Duration:** ~15 minutes
**Author:** [Your Name]

## Summary
RDS MySQL instance was configured with max_connections=2 causing
complete database unavailability for all application connections
beyond the 2-connection limit.

## Timeline
| Time | Event |
|------|-------|
| T+00 | Parameter group week2-lab-low-connections created with max_connections=2 |
| T+02 | Parameter group attached to week2-lab-db RDS instance |
| T+05 | RDS rebooted — max_connections=2 now enforced |
| T+07 | Incident detected via CloudWatch DatabaseConnections metric |
| T+08 | Diagnosed via aws rds describe-db-parameters — confirmed max_connections=2 |
| T+12 | Parameter group updated to max_connections=151 (MySQL default) |
| T+15 | RDS rebooted — service fully restored |

## Root Cause
RDS parameter group was modified to set max_connections=2, far below
the application's minimum required connections. Any application with
a connection pool larger than 2 would immediately exhaust all
available DB connections causing "Too many connections" errors.

## Contributing Factors
- No CloudWatch alarm configured for DatabaseConnections metric
- Parameter group change applied without peer review
- No staging environment to test parameter changes before production

## What Went Wrong
Direct modification of a production RDS parameter group without
proper change management process or alerting in place.

## Resolution
1. Updated max_connections back to 151 (MySQL default) via AWS CLI
2. Rebooted RDS instance to enforce new parameter value
3. Verified recovery via describe-db-instances showing available + in-sync

## Long Term Fix (Interview Answer)
- Add RDS Proxy to manage connection pooling at infrastructure level
- Set CloudWatch alarm: DatabaseConnections > 80% of max_connections
- Require peer approval for all RDS parameter group changes
- Use PgBouncer/ProxySQL for connection pooling at app level

## Lessons Learned
- Always set CloudWatch alarms on DatabaseConnections metric
- Parameter group changes need same review process as code changes
- RDS Proxy would have prevented this entirely by managing pooling

## STAR Story (For Interviews)
**Situation:** Production RDS MySQL became unavailable due to
connection exhaustion. All app requests failing with DB errors.

**Task:** Identify root cause and restore DB within 15 minutes
without data loss.

**Action:** Used CloudWatch metrics to detect spike, confirmed
max_connections=2 via describe-db-parameters, immediately updated
parameter group to 151, rebooted RDS, verified recovery.

**Result:** Service restored in 15 minutes. Added CloudWatch alarm
on DatabaseConnections and proposed RDS Proxy as permanent fix.
Zero data loss. Process updated to require review for param changes.