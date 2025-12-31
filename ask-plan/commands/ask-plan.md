---
description: Analyze PLAN files and refine them through interactive questioning
---

# Ask Plan Command

A command that analyzes PLAN file contents, identifies ambiguities and unclear implementation details, conducts interactive questioning using `AskUserQuestionTool`, and immediately updates the PLAN file based on user responses.

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

## ANALYSIS METHODOLOGY

After reading the PLAN file, identify issues in the following categories:

### Category 1: Ambiguous Requirements

- Unclear feature descriptions
- Missing acceptance criteria
- Ambiguous terminology or expressions with multiple interpretations
- Undefined success metrics

### Category 2: Implementation Gaps

- Undecided architecture decisions (patterns, libraries, etc.)
- Unspecified technology choices
- Unclear data structures or schemas
- Missing error handling strategies
- Undefined edge cases

### Category 3: Dependencies and Integration

- Unclear integration points with existing code
- Missing dependency information
- Unspecified API contracts
- Unclear implementation step ordering

### Category 4: Scope and Boundaries

- Unclear in/out of scope boundaries
- Missing assumptions
- Unspecified constraints (performance, security, compatibility)

## QUESTION GENERATION RULES

Follow these rules when generating questions:

1. **Prioritize by impact**: Ask about issues that most significantly affect implementation first
1. **Be specific**: Reference specific sections or phrases from the PLAN file
1. **Provide options**: When asking about implementation choices, present 2-4 concrete options
1. **Limit questions**: Restrict to 1-3 questions per round (avoid overwhelming the user)

### AskUserQuestionTool Format

When creating questions, include the following elements:

- **question**: A clear, specific question
- **header**: A short label indicating the question category (max 12 characters)
- **options**: 2-4 options, each with a label and description
- **multiSelect**: Set to true when multiple selections are appropriate

Example:

```md
question: "Which storage method should we use for auth tokens?"
header: "Auth Design"
options:
  - label: "httpOnly Cookie"
    description: "High XSS resistance, recommended for web apps"
  - label: "localStorage"
    description: "Simple but has XSS vulnerability risks"
  - label: "sessionStorage"
    description: "For per-tab session management"
```

## PLAN UPDATE PROTOCOL

After the user answers a question, update the PLAN file using these steps:

1. **Parse the answer**: Extract decisions and clarifications
1. **Identify update location**: Determine where this information belongs in the PLAN
1. **Apply the update**: Integrate changes naturally with existing content
1. **Save immediately**: Use Edit/Write tools to update the PLAN file instantly
1. **Report the update**: Briefly inform the user what was updated

### Update Format Guidelines

- Add clarifications inline where they relate to existing content
- Create new sections if the answer reveals new components
- Maintain consistent formatting with the existing PLAN structure
- Optionally add a `## Clarifications` section at the end to track Q&A history

## WORKFLOW

### Phase 1: File Resolution and Validation

1. Resolve the file path according to TARGET FILE RESOLUTION
1. Verify file existence and readability
1. Read the entire PLAN file
1. Display: "Analyzing PLAN file: [filename]..."

### Phase 2: Initial Analysis

1. Parse the PLAN structure
1. Identify all sections and their contents
1. Generate initial list of ambiguities and gaps (internal)
1. Prioritize questions by impact

### Phase 3: Interview Loop

```
WHILE (unresolved questions exist AND user chooses to continue):
    1. Select the highest priority unasked question(s)
    2. Present question(s) using AskUserQuestionTool
    3. Wait for user response
    4. Parse the response
    5. Update the PLAN file immediately
    6. Re-analyze the updated PLAN to discover new questions
    7. Ask user "Continue with more questions?" (if questions remain)
END WHILE
```

### Phase 4: Completion

1. Display a summary of all changes made to the PLAN
1. Show the final PLAN file location
1. Suggest next steps (e.g., "Ready for implementation" or "Consider reviewing with your team")

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

Suggest to the user:

```md
The PLAN file is empty. Please choose from the following:
1. Enter a project description to create a new plan
2. Specify a different file
3. Cancel
```

### User chooses to stop early

1. Confirm all changes so far have been saved
1. Display the number of remaining unasked questions (if any)
1. Show: "PLAN updated with [N] clarifications. [M] questions remain for future refinement."

### No questions can be generated

If the PLAN is sufficiently detailed:

```md
Analyzed the PLAN but found no points requiring clarification at this time.
The PLAN appears ready for implementation.
```

## CRITICAL RULES

- Always use `AskUserQuestionTool` for questions (plain text questions are not allowed)
- Update the PLAN file immediately after each answer (no batch updates)
- Track what has been clarified to avoid redundant questions
- Recognize when a user's answer addresses multiple potential questions
- Respect user's time - if they seem fatigued, offer to save progress and continue later
