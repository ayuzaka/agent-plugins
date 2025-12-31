---
name: skill-review
description: Review Agent Skills and provide findings and improvement suggestions from the perspective of official specification compliance and best practices. Use for skill review requests, SKILL.md quality checks, skill structure validation, and Agent Skills specification conformance evaluation.
---

# Skill Review

Review skills based on the Agent Skills specification and provide conformance assessment and improvement suggestions.

## Review Workflow

### Input Examples

- "Review this skill"
- "Check SKILL.md specification compliance"

### 1. Identify Request and Target

- Confirm the root directory of the target skill.
- Clarify the review scope (SKILL.md only / including scripts, references, and assets).

### 2. Review Against Official Specification

- Always reference https://agentskills.io/specification as the authoritative source.
- Include a link to the relevant section (Spec Link) for each finding.
- Use heading anchors within the specification page as needed.

### 3. Create Improvement Suggestions

- Always flag specification violations and provide remediation.
- For items not following best practices, explain the reason and improvement steps.

## Output Format

```markdown
## Skill Review Summary

### Findings

#### [Severity: High/Medium/Low] Title
- **Location**: path/to/file:line
- **Issue**: Description of the problem
- **Spec/Rule**: Corresponding specification point
- **Spec Link**: https://agentskills.io/specification#section-id
- **Recommendation**: Remediation

### Suggestions (Optional)
- Improvement ideas or operational recommendations

### OK (Optional)
- No issues found
```

## Notes

- Prioritize specification compliance findings.
- Even if there are no specification violations, suggest improvements where applicable.
