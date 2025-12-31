# OWASP Security Review Plugin

A Claude Code plugin for security review and implementation support based on OWASP Cheat Sheet Series.

## Features

- Security code review based on OWASP guidelines
- Vulnerability detection and remediation guidance
- Coverage of common security topics: XSS, SQL Injection, CSRF, authentication, authorization, and more

## Installation

```bash
claude plugin add ayuzaka/agent-plugins/owasp-security-review
```

## Usage

### Commands

#### `/security-review-frontend`

Review frontend code for security vulnerabilities:

```
/security-review-frontend src/components/LoginForm.tsx
```

### Skills

#### `owasp-security-review`

General security review skill that leverages OWASP Cheat Sheet Series:

```
/skill owasp-security-review Review the authentication module
```

## Setup

The skill uses OWASP Cheat Sheet Series as a reference. To set up the cheatsheets locally:

```bash
bash skills/owasp-security-review/scripts/setup_cheatsheets.sh
```

This clones the cheatsheets to `~/.local/share/owasp-cheatsheets` by default.

## Directory Structure

```
owasp-security-review/
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   └── frontend-security-review.md
├── skills/
│   └── owasp-security-review/
│       ├── SKILL.md
│       ├── references/
│       │   └── top10-mapping.md
│       └── scripts/
│           └── setup_cheatsheets.sh
└── README.md
```

## License

MIT
