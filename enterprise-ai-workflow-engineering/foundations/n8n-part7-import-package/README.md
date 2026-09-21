# n8n Masterclass — Part 7 Import Package

## Workflow A: N8N-F07A-Batch-Processing

Purpose:
- Create 5 n8n items
- Loop over them in batches of 2
- Process each batch
- Wait 1 second between batches
- Emit all processed data through the Loop Over Items `done` output
- Build a final summary

Expected batches:
- Batch 1: 2 items
- Batch 2: 2 items
- Batch 3: 1 item

## Workflow B: N8N-F07B-Pagination-and-Batching

Purpose:
- Call `https://dummyjson.com/users`
- Use HTTP Request built-in pagination
- Fetch 3 pages
- Page size = 5
- Pagination parameter: `skip = $pageCount * 5`
- Flatten each response page's `users` array into separate n8n items
- Process the user items in batches of 2
- Wait 1 second between batches
- Build a final summary

Expected API requests:
- Request 1: limit=5&skip=0
- Request 2: limit=5&skip=5
- Request 3: limit=5&skip=10

Expected total users:
- 15

## Important n8n behavior

For Loop Over Items / Split in Batches:
- output 0 = `done`
- output 1 = `loop`

The loop-processing path must connect back into the Loop Over Items node.

## If n8n asks to update a node

These workflows target the n8n 2.x node families used in this course. If your installed instance upgrades a node version on import, allow the migration, save, and execute again.
