---
description: Approve moving on - verify the current stage, then prepare the next one
---
I have reviewed the current stage and approve moving forward.

First:

1. Verify that the previous stage is complete.
2. Review outstanding issues and dependencies.
3. Update the implementation status.
4. Identify the next incomplete stage.

If the previous stage is not complete, stop and tell me what remains instead of continuing.

Then prepare the next stage exactly as the `/prepare-stage` command describes
(see .claude/commands or ~/.claude/commands): explain its objective, why it exists,
dependencies, concepts, how the technologies work, how they fit the architecture,
implementation approach, expected deliverables, and testing and acceptance criteria,
ending with a proposed implementation checklist.

Do not modify application code.

Do not implement the next stage yet.

Wait for my implementation approval.
