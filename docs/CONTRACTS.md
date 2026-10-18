# Contracts (shared interface)

Change anything here only via a note in `STATUS.md` that the other agent acknowledges. If a name below is wrong or missing, add it here first, then use it.

## Folder ownership
| Path | Owner |
| --- | --- |
| `src/shared/world/` (hub + plot builders), `src/shared/WorldConfig.luau` | Codex |
| `src/client/ui/` | Codex |
| `tests/anchors/` (anchor checker) | Codex |
| `src/server/`, `src/shared/Config.luau`, `src/shared/Remotes.luau` | Claude Code |
| `src/client/input/` (input requests, touch/keyboard/gamepad) | Claude Code |
| `default.project.json`, `.gitignore`, `STATUS.md` | shared (note changes) |

## World model
Everything is generated at server start by Luau builders under `src/shared/world/` (placeholder Parts/Models), so the world is reproducible and version-controlled. Nothing the logic needs may exist only in the Studio place file.

Folders in Workspace: `Hub`, `Plots` (children `Plot_1`, `Plot_2`, ...), `Loot` (runtime items, owned by logic).

## Tags and anchors (CollectionService tags + Attributes)
Codex creates them; Claude Code reads them. Every anchor is a Part (or Model with PrimaryPart). Names below are tags; attributes in brackets.

| Tag | Where | Meaning |
| --- | --- | --- |
| `HubSpawn` | Hub | where new players first appear |
| `HubVendor` | Hub | vendor stall (ProximityPrompt added by logic) |
| `HubPlotPortal` | Hub | pad that sends a player to their own plot |
| `PlotRoot` [PlotId] | each plot | root Model of a plot |
| `PlotSpawn` [PlotId] | each plot | where the owner arrives |
| `PlotBoundary` [PlotId] | each plot | Part whose volume is the plot area (used for inside/outside checks) |
| `StarterChest` [PlotId] | each plot | chest with starter tools |
| `PlantSlot` [PlotId, SlotIndex] | each plot | one plant position; 8 per plot by default |
| `GardenerHome` [PlotId] | each plot | where the Gardener creature idles |
| `LootDrop` [PlotId] | each plot | area where harvests appear on the ground (early-game visible stockpile) |
| `DeliveryPad` [PlotId] | each plot | where a raider drops off carried loot |
| `WardSlot` [PlotId, SlotIndex] | each plot | valid ward placement points (ground level) |
| `CameraMount` [PlotId, SlotIndex] | each plot | elevated mount points |
| `GuardianPost` [PlotId, SlotIndex] | each plot | guardian patrol waypoints |
| `RaidApproach` [PlotId] | outside each plot | a path-friendly entry zone toward the plot |

Plots are numbered; plot assignment is logic's job (first free `Plot_N`).

## WorldConfig (Codex owns; logic reads)
`PlotCount` (2 for the prototype), `PlotSpacingStuds` (default 700; target 45-60 s of running at 16 studs/s is 720-960; tune in Studio), `PlantSlotsPerPlot` (8), `WardSlotsPerPlot` (4), `CameraMountsPerPlot` (2), `GuardianPostsPerPlot` (3), `PlotSizeStuds`.

## Remotes (Claude Code owns; UI binds to them)
All under `ReplicatedStorage.Remotes`, defined in `src/shared/Remotes.luau`. Clients **request**; the server decides.
- Client to server (RemoteEvent): `RequestPickup(lootId)`, `RequestDeliver()`, `RequestPlaceWard(slotIndex)`, `RequestInteract(targetId)`
- Server to client (RemoteEvent): `StateSync(snapshot)`, `Notify(kind, text)`, `CarryChanged(items)`, `PlotStatus(plotId, status)`

## UI hooks (Codex builds, logic fills)
UI reads server state only through `StateSync`/`Notify`/`CarryChanged`. HUD elements Codex builds in Gate 0 (values are static placeholders until logic wires them):
`CurrencyLabel`, `CarryPanel` (what you hold), `CycleTimer` (calm / prep / raid countdown), `NotifyToast`, `InteractPrompt`. Touch-first: thumb-sized buttons, readable at phone width.

## Visual direction (placeholders, not final art)
Alien and otherworldly, magic fused with tech, not generic fantasy. Palette hint: deep emerald and teal with warm gold accents, soft glowing edges. Plants feel like glowing organic crystal-vine; equipment feels like salvaged alien rigs. Name candidates in the design snapshot are for labels only.
