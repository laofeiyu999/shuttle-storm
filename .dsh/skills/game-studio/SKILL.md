---
name: game-studio
description: "Route early browser-game work: stack selection, workflow, and the specialist playbooks for Phaser 2D, Three.js, React Three Fiber, 3D assets, UI, sprites and playtest. Use when starting or planning a browser game, choosing an engine, or asking which game skill applies."
---

# Game Studio — entry point

This bundle is the OpenAI "game-studio" plugin. The dispatcher skill lives in a package layout, so read it first:

- **Router / start here:** `skills/game-studio/SKILL.md`

The router links its siblings and shared references using paths relative to this directory:

| What | Path |
|---|---|
| Web-game foundations and architecture | `skills/web-game-foundations/SKILL.md` |
| Phaser 2D implementation | `skills/phaser-2d-game/SKILL.md` |
| Vanilla Three.js implementation | `skills/three-webgl-game/SKILL.md` |
| React Three Fiber implementation | `skills/react-three-fiber-game/SKILL.md` |
| 3D asset shipping and optimization | `skills/web-3d-asset-pipeline/SKILL.md` |
| HUD and menu direction | `skills/game-ui-frontend/SKILL.md` |
| 2D sprite generation and normalization | `skills/sprite-pipeline/SKILL.md` |
| Browser QA and visual review | `skills/game-playtest/SKILL.md` |
| Shared references | `references/*.md` |
| Assets and scripts | `assets/`, `scripts/` |

When a linked skill says `../<name>/SKILL.md` or `../../references/...`, resolve it from this bundle root as `skills/<name>/SKILL.md` and `references/...`.
