# Agent Plugins

A collection of Claude Code plugins for development workflows.

## Plugins

This repository contains the following plugins:

### [owasp-security-review](./owasp-security-review)

Security review and implementation support based on OWASP Cheat Sheet Series. Covers XSS, SQL Injection, CSRF, authentication, authorization, and other security topics.

### [skill-review](./skill-review)

Review Agent Skills for specification compliance and best practices.

### [ask-plan](./ask-plan)

A command that analyzes PLAN files and refines them through interactive questioning. Automatically detects ambiguities and implementation gaps, then updates the PLAN file based on user responses.

## Installation

First, add this repository as a marketplace:

```bash
/plugin marketplace add ayuzaka/agent-plugins
```

Then install the plugins you need:

```bash
# Install owasp-security-review
/plugin install owasp-security-review@ayuzaka/agent-plugins

# Install skill-review
/plugin install skill-review@ayuzaka/agent-plugins

# Install ask-plan
/plugin install ask-plan@ayuzaka/agent-plugins
```

## Development

Validate plugin configuration:

```bash
# Validate individual plugin
claude plugin validate ./owasp-security-review
claude plugin validate ./skill-review
claude plugin validate ./ask-plan
```

## License

MIT
