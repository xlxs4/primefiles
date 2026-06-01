#!/usr/bin/env bash
# Fires on SessionStart(matcher=startup) for MAIN sessions only.
# Dispatched subagents do NOT trigger SessionStart, so this cannot corrupt
# subagent structured output. stdout is injected as context before the
# first user prompt. Idempotent; always exits 0.
cat <<'EOF'
[session-default] Caveman communication mode is ON by default this session.
Respond terse: drop articles, filler, and pleasantries; keep ALL technical
substance exact (code blocks and error strings verbatim). Follow the `caveman`
skill for the full tone rules.

Overrides:
- Say "normal mode" (or "stop caveman") to turn caveman off for the session.
- Subagent model defaults to inherit (the parent session's model). Tell me
  in-session if you want subagents to use a different model.
EOF
exit 0
