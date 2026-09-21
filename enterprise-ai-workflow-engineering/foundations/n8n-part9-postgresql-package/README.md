# n8n Masterclass Part 9 — PostgreSQL & Business Data

## Files
- `N8N-F09-PostgreSQL-Business-Data.json` — import into n8n
- `000-create-business-database.sql` — creates the `business` database
- `001-business-schema.sql` — creates `customers` and `customer_audit`
- `valid-customer.json`
- `invalid-customer.json`

## Credential requirement
After import, select the same n8n PostgreSQL credential on all three Postgres nodes:
- Upsert Customer
- Write Audit Event
- Read Persisted Customer

Credential example for the Docker setup used in this masterclass:
- Host: `postgres`
- Port: `5432`
- Database: `business`
- User: `n8n`
- Password: your POSTGRES_PASSWORD
- SSL: disabled locally unless you configured TLS

No credential ID or password is embedded in this JSON.

## Test URL
`http://localhost:5678/webhook-test/customer-persistence`

## Production local URL after activation
`http://localhost:5678/webhook/customer-persistence`

## Notes
The workflow uses parameterized PostgreSQL queries and UPSERT by email.
If n8n upgrades the Postgres node after import, let it migrate the node and save the workflow before testing.
