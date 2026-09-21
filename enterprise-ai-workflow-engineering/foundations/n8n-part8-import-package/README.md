# n8n Masterclass Part 8 — Credentials, API Keys & OAuth

This package intentionally contains **no secrets and no credential IDs**.

After import, open each HTTP Request node and create/select the required n8n credential.

## F08A — GitHub Header Auth

Create an n8n **Header Auth** credential:
- Name: `Authorization`
- Value: `Bearer YOUR_GITHUB_TOKEN`

Use a GitHub token with the minimum permissions required for `/user`.

Then select that credential in `GitHub Authenticated Request`.

## F08B — GitHub OAuth2

Create a GitHub OAuth App, then create/select a **Generic OAuth2 API** credential in n8n.

Typical GitHub endpoints:
- Authorization URL: `https://github.com/login/oauth/authorize`
- Access Token URL: `https://github.com/login/oauth/access_token`

Use only the scopes your workflow actually needs.

Because OAuth client ID/secret and tokens are secrets, they are not stored in this workflow JSON.

## F08C — Basic Auth

Create an n8n **Basic Auth** credential:
- Username: `n8n`
- Password: `masterclass`

This is a public HTTPBin learning endpoint only. Do not reuse this demo password elsewhere.

## Core rule

Workflow JSON = logic
n8n Credential = secret

Never commit production API keys, OAuth client secrets, access tokens, refresh tokens, or passwords to GitHub.
