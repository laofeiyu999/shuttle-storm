---
name: understand-anything
description: "Build an interactive knowledge graph of any codebase: architecture, components, relationships, and a browsable dashboard. Analyzes a repo into knowledge-graph.json, then explains, chats with, diffs, diagrams (Figma), and onboards over that graph. Use when the user wants to understand a codebase, architecture, or how parts relate."
---

# Understand Anything — pack root

This bundle is the upstream `understand-anything-plugin`. **This directory is the plugin root** (it holds `packages/core`, `agents/`, `skills/`).

## Entry point

- Main analyzer skill: `skills/understand/SKILL.md` (the `/understand` flow that writes `knowledge-graph.json` into `.ua/`).

| Sub-skill | Path |
|---|---|
| analyze / build the graph | `skills/understand/SKILL.md` |
| chat over the graph | `skills/understand-chat/SKILL.md` |
| dashboard | `skills/understand-dashboard/SKILL.md` |
| diff two graphs | `skills/understand-diff/SKILL.md` |
| domain model view | `skills/understand-domain/SKILL.md` |
| explain a symbol or file | `skills/understand-explain/SKILL.md` |
| Figma import | `skills/understand-figma/SKILL.md` |
| knowledge base | `skills/understand-knowledge/SKILL.md` |
| onboarding tour | `skills/understand-onboard/SKILL.md` |

## One-time setup

The skills invoke Node scripts that import `@understand-anything/core`, which is TypeScript source here and needs a build once:

```
pnpm install && pnpm --filter @understand-anything/core build
```

(run from this directory; `packages/core/dist/index.js` must exist). Agent definitions live in `agents/*.md`, hooks in `hooks/`.
