---
name: uefn-playtest
description: Launch, capture, drive, and shut down a Fortnite playtest session for a UEFN island. Use when validating spawn flow, objective progression, reset, solo play, or any runtime behavior.
---

# UEFN Playtest Session

## Launch & observe
- Click **Launch Session** in UEFN to cook and run an interactive Fortnite
  playtest. Poll the live Session toolset rather than stale notes for current
  client state.

## Capture & input (desktop only, outside sandbox)
- `Saved/capture-fortnite.ps1` captures only the visible
  `FortniteClient-Win64-Shipping` process window via `PrintWindow`.
- `Saved/input-fortnite.ps1` sends input only after verifying that exact window
  is foreground.
- Never capture the full desktop; automatic review rejects it. Scoped Fortnite
  capture and input are allowed.

## Log hygiene
- Avoid raw client log dumps: shutdown HTTP lines can contain account tokens.
- Filter to relevant Verse / build / validation / session categories and omit
  URLs.

## Shutdown (required)
- At the end of every task, stop the playtest with UEFN's **End Game** /
  **Stop Session** and verify the game is no longer running. Leave the editor
  open unless the user asks to close it. If it cannot be stopped, say so instead
  of claiming completion.

## Verification checklist
- Verify spawn flow, objective progression, reset behavior, and solo play.
- Test multiplayer behavior only when devices share state. Solo results never
  count as multiplayer evidence.
