# Ask Plan

A Claude Code command that analyzes PLAN files and refines them through interactive questioning.

## Features

- Automatic detection of ambiguities and implementation gaps in PLAN files
- Interactive questioning using `AskUserQuestionTool`
- Immediate PLAN file updates based on user responses
- Automatic detection of session plan files during Plan mode
- Recursive refinement through iterative questioning

## Usage

```bash
# With explicit file path
/ask-plan path/to/plan.md

# During Plan mode (auto-detects current session's plan file)
/ask-plan
```

## Workflow

1. **File Resolution**: Locate the target PLAN file
2. **Analysis**: Detect ambiguities and implementation gaps
3. **Interview**: Ask clarifying questions via AskUserQuestionTool
4. **Update**: Immediately update the PLAN file based on responses
5. **Repeat**: Continue until no questions remain or user stops

## Question Categories

- **Ambiguous Requirements**: Unclear specifications, missing acceptance criteria
- **Implementation Gaps**: Undecided architecture, undefined edge cases
- **Dependencies**: Unclear integration points, unspecified APIs
- **Scope Issues**: Unclear boundaries, missing constraints

## Installation

```bash
/plugin marketplace add ayuzaka/agent-plugins
/plugin install ask-plan@ayuzaka/agent-plugins
```

## Directory Structure

```
ask-plan/
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   └── ask-plan.md
└── README.md
```

## License

MIT
