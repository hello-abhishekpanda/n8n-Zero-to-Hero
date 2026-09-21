# n8n Masterclass Part 6 Import Package

## Workflows

### F06A — Business Decision Routing
Webhook -> Validate -> IF -> Request ID -> Normalize -> Qualification -> Switch -> HOT/WARM/COLD/Fallback -> HTTP response.

Test URL:
`http://localhost:5678/webhook-test/customer-qualification`

Production URL after activation:
`http://localhost:5678/webhook/customer-qualification`

### F06B — Merge Fan-out/Fan-in
Manual Trigger -> seed lead -> two parallel branches -> Merge -> final result.

This is separate from F06A intentionally: mutually exclusive Switch branches are a routing concept, while Merge is best demonstrated with true parallel branches.

## Qualification rules
- HOT: budget >= 100000 AND employees >= 1000 AND timelineMonths <= 3
- WARM: budget >= 25000 OR employees >= 200
- COLD: otherwise

## Important
If your installed n8n version upgrades a node on import, allow n8n to migrate it and save the workflow before testing.
