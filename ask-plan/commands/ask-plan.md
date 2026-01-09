---
description: Review AI-generated PLAN files and clarify ambiguities with the user
---

# Ask Plan Command

A command that instructs the AI Agent to review its own generated PLAN file, identify unclear points or assumptions, and ask the user for clarification using `AskUserQuestionTool`.

## PURPOSE

When an AI Agent creates a PLAN file, it may contain:

- Assumptions made without explicit user confirmation
- Ambiguous requirements that need clarification
- Implementation decisions that should be validated
- Missing details that only the user can provide

This command triggers a self-review process where the AI Agent critically examines its own plan and proactively seeks user input on uncertain areas.

## TARGET FILE RESOLUTION

Identify the PLAN file using the following priority order:

1. **If $ARGUMENTS is provided**: Use the specified file path directly
1. **If currently in Plan mode**: Extract the PLAN file path from the conversation context
   - Look for patterns like `plan file exists at <path>` or `create your plan at <path>` in the system prompt
1. **If neither applies**: Display an error message and exit
   ```md
   PLAN file not found. Please specify using one of the following methods:
   - Provide a file path as argument: /ask-plan path/to/plan.md
   - Run during Plan mode: The current session's PLAN file will be auto-detected
   ```

## SELF-REVIEW METHODOLOGY

After reading the PLAN file you created, critically examine it for the following:

### Category 1: Unvalidated Assumptions

- Requirements you interpreted without explicit user confirmation
- Default choices you made (libraries, patterns, approaches)
- Inferred user preferences or constraints
- Scope boundaries you assumed

### Category 2: Ambiguous Points

- Areas where you weren't certain of the user's intent
- Multiple valid interpretations you chose between
- Trade-offs you resolved without user input
- Edge cases you handled based on assumptions

### Category 3: Missing Information

- Details the user didn't specify but are needed for implementation
- Configuration or environment-specific decisions
- Integration points with external systems
- Error handling and failure scenarios

### Category 4: Validation Needed

- Architectural decisions that significantly impact the project
- Technology choices that may have alternatives the user prefers
- Implementation approaches with different trade-offs
- Priorities and ordering of tasks

## QUESTION GENERATION RULES

When generating questions to ask the user:

1. **Focus on uncertainty**: Only ask about things you genuinely need clarification on
1. **Be honest about assumptions**: Explain what you assumed and why
1. **Provide context**: Reference the specific part of the PLAN related to the question
1. **Offer options**: Present the alternatives you considered with their trade-offs
1. **Limit questions**: Restrict to 1-3 questions per round

### AskUserQuestionTool Format

When creating questions, include the following elements:

- **question**: A clear question explaining what you need clarified
- **header**: A short label indicating the topic (max 12 characters)
- **options**: 2-4 options including what you assumed (mark with "Current assumption")
- **multiSelect**: Set to true when multiple selections are appropriate

Example:

```md
question: "In the PLAN, I assumed we'd use PostgreSQL for the database. Should I proceed with this choice?"
header: "Database"
options:
  - label: "PostgreSQL (Current assumption)"
    description: "Robust, good for complex queries, widely supported"
  - label: "MySQL"
    description: "Simpler setup, good performance for read-heavy workloads"
  - label: "SQLite"
    description: "Lightweight, no server needed, good for small projects"
```

## PLAN UPDATE PROTOCOL

After the user answers a question:

1. **Update the PLAN**: Integrate the user's decision into the relevant section
1. **Mark as confirmed**: Indicate that this decision is now user-validated
1. **Save immediately**: Use Edit tool to update the PLAN file
1. **Report the change**: Briefly inform the user what was updated

### Update Format Guidelines

- Replace assumptions with confirmed decisions
- Add user-provided details inline where relevant
- Maintain consistent formatting with the existing PLAN structure
- Optionally add a `## Confirmed Decisions` section to track validated items

## WORKFLOW

### Phase 1: Load and Announce

1. Resolve the file path according to TARGET FILE RESOLUTION
1. Verify file existence and readability
1. Read the entire PLAN file
1. Display: "Reviewing my PLAN to identify points that need your confirmation..."

### Phase 2: Self-Critical Analysis

1. Re-examine each section of the PLAN you created
1. Identify assumptions you made
1. List areas where you were uncertain
1. Find decisions that should be validated by the user
1. Prioritize by impact on implementation

### Phase 3: Clarification Loop

```
WHILE (unvalidated assumptions or unclear points exist AND user chooses to continue):
    1. Select the most impactful unconfirmed item(s)
    2. Present question(s) using AskUserQuestionTool
       - Explain what you assumed and why
       - Offer alternatives you considered
    3. Wait for user response
    4. Update the PLAN file with the confirmed decision
    5. Continue to next uncertain point
    6. Ask user "Should I continue reviewing?" (if items remain)
END WHILE
```

### Phase 4: Completion

1. Summarize all confirmed decisions
1. List any remaining assumptions (if user chose to stop early)
1. Display: "PLAN review complete. [N] decisions confirmed with you."

## EDGE CASES

### File not specified and not in Plan mode

```md
PLAN file not found. Please specify using one of the following methods:
- Provide a file path as argument: /ask-plan path/to/plan.md
- Run during Plan mode: The current session's PLAN file will be auto-detected
```

### Specified file does not exist

```md
The specified file was not found: [file path]
Please verify the path and try again.
```

### Empty PLAN file

```md
The PLAN file is empty. There is nothing to review.
Please create a plan first, then run /ask-plan to review it.
```

### No clarification needed

If the PLAN was created with explicit user input for all decisions:

```md
I reviewed the PLAN and found no assumptions that need your confirmation.
All decisions were based on explicit requirements you provided.
The PLAN is ready for implementation.
```

### User chooses to stop early

1. Save all confirmed changes
1. Display remaining unconfirmed assumptions count
1. Show: "PLAN updated with [N] confirmed decisions. [M] assumptions remain unvalidated."

## CRITICAL RULES

- Always use `AskUserQuestionTool` for questions (plain text questions are not allowed)
- Be honest about what you assumed vs. what the user explicitly stated
- Update the PLAN file immediately after each confirmation
- Do not ask about things the user already clearly specified
- Prioritize questions that have the biggest impact on implementation success
- Respect user's time - offer to continue or stop after each round of questions
