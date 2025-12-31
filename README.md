# Agent Plugins

A collection of Claude Code plugins for development workflows.

## Plugins

This repository contains the following plugins:

### [owasp-security-review](./owasp-security-review)

Security review and implementation support based on OWASP Cheat Sheet Series. Covers XSS, SQL Injection, CSRF, authentication, authorization, and other security topics.

### [skill-review](./skill-review)

Review Agent Skills for specification compliance and best practices.

## Installation

Each plugin can be installed independently:

```bash
# Install owasp-security-review
claude plugin add ayuzaka/agent-plugins/owasp-security-review

# Install skill-review
claude plugin add ayuzaka/agent-plugins/skill-review
```

## Development

Validate plugin configuration:

```bash
# Validate individual plugin
claude plugin validate ./owasp-security-review
claude plugin validate ./skill-review
```

## License

MIT
