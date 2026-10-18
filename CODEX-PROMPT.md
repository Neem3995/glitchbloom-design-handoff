# Codex prompt — Glitchbloom visual review and implementation handoff

Read this repository directly: https://github.com/Neem3995/glitchbloom-design-handoff.
Do not request a complete folder upload. This private repository requires authorized GitHub access. If access fails, report that specific problem; do not substitute another project.

You are Glitchbloom's world/UI builder. Claude Code owns gameplay. Spend only the tokens needed: read narrowly, preserve existing work, avoid repeated exploration, and stop after two failed attempts at the same fix.

## Read and inspect
1. README.md and READ-ME-FIRST.txt.
2. docs/CONTRACTS.md and docs/design-snapshot.md.
3. src/shared/WorldConfig.luau, the relevant builders in src/shared/world/, and src/client/ui/Hud.client.luau.
4. Gate0-anchor-positions.csv and the existing Studio screenshots in reference/.
5. Open all three images in reference/concepts/:
   - A: hub-A-bright-alien-garden.png — sunny, green, welcoming.
   - B: hub-B-salvaged-tech-garden.png — chunky salvaged machinery and colorful equipment.
   - C: hub-C-crystal-garden.png — readable purple twilight and glowing crystals.

## Current decision
The owner approved the MIXED hub direction in `image-import/references/gb_ref_hub_mixed_approved_v01.png`: A's greenery, B's chunky teal/gold technology and C's purple crystal accents, under warm daylight. Use this reference; do not ask the owner to choose A/B/C again.

The next visual task is the HUD. Read `image-import/README.md`, `image-import/manifest.json` and `image-import/hud/NATIVE-UI-SPEC.md`; inspect the HUD preview and standalone icons. This HUD is a proposal, not yet approved or integrated. Approval of the world style does not establish approval of every HUD detail. PNG asset IDs remain unset until actual Roblox upload. The user is collecting visual elements for later implementation; do not change gameplay or treat the flattened preview as an importable GUI.

## After a style is selected
Use the image for palette, silhouettes, materials and atmosphere. Derive the actual layout from the Luau builders and contracts. Preserve two plots spaced 700 studs apart, all 53 anchor memberships, exact names, numeric PlotId/SlotIndex values, counts and positions. Keep CurrencyLabel, CarryPanel, CycleTimer, NotifyToast and InteractPrompt as compatible HUD hooks.

The generated images are illustrative. Do not copy invented floating islands, extra buildings, altered distances or routes into the game without an explicit scope decision. A scene PNG is not a 3D model or a UV-ready texture. Rebuild world forms as simple Parts/Models; use native editable GUI objects for panels and text. Propose separate PNG assets only where needed and identify upload requirements honestly.

This handoff is a historical Gate 0 snapshot, not the active gameplay repository. Before implementation, inspect the live glitchbloom checkout's AGENTS.md, STATUS.md, contracts and git status. Account for Claude's newer gameplay changes. Never copy this snapshot over the live checkout, reset/switch its active branch, or modify src/server/, Config, Remotes or src/client/input/. Keep implementation on an appropriate feat/world-* or feat/ui-* branch with existing work preserved. Do not commit to main or merge without authorization.

Keep dimensions in WorldConfig. Separate decorative geometry from tagged anchors; evaluate CanCollide, CanTouch and CanQuery, walking clearance, visibility and mobile cost. Use restrained lighting effects and readable labels. Do not add gameplay, currencies, inventory limits, raid timers or new systems.

Before risky Studio changes, ask the owner to save a backup/version. Coordinate Studio ownership in STATUS.md. Validate the anchor checker, hub spawn, walking routes, HUD layout and selected visual direction in real Studio Play; distinguish live checks from static checks and report any unavailable test. Provide concise before/after evidence and update STATUS.md with the handoff. Do not claim imports, exports or tests passed unless performed.
