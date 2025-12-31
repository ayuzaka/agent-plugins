# Skill Review Plugin

A Claude Code plugin for reviewing Agent Skills for specification compliance and best practices.

## Features

- Review Agent Skills against the official specification
- Check SKILL.md structure and metadata
- Validate skill configuration and directory structure
- Provide actionable improvement suggestions

## Installation

```bash
/plugin marketplace add ayuzaka/agent-plugins
/plugin install skill-review@ayuzaka/agent-plugins
```

## Usage

### Skills

#### `skill-review`

Review an Agent Skill for specification compliance:

```
/skill skill-review Review the owasp-security-review skill
```

The skill will:

1. Identify the target skill directory and review scope
2. Check against the official specification at https://agentskills.io/specification
3. Report findings with severity levels and spec references
4. Provide recommendations for improvements

## Output Format

The review output follows this structure:

```markdown
## Skill Review Summary

### Findings

#### [Severity: High/Medium/Low] Title
- **Location**: path/to/file:line
- **Issue**: Description of the problem
- **Spec/Rule**: Corresponding specification point
- **Spec Link**: https://agentskills.io/specification#section-id
- **Recommendation**: Suggested fix

### Suggestions (Optional)
- Improvement ideas and operational suggestions

### OK (Optional)
- Confirmation of compliant areas
```

## Directory Structure

```
skill-review/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   └── skill-review/
│       └── SKILL.md
└── README.md
```

## License

MIT
