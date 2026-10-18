# Gate 0 check

Run `rojo serve` from the repo, connect the Rojo Studio plugin, then start Play.
`world/Bootstrap` generates the world on the server and runs AnchorCheck automatically in Studio.
Expected Output: `[Gate0 anchors] PASS: 3 hub anchors; 2 plots; 25 anchors per plot; spacing 700`.
To rerun from the **server** Command Bar during Play:

```lua
require(game.ServerStorage.Gate0Tests.AnchorCheck)()
```

The checker asserts every contract tag, count, attribute, indexed slot, folder, root PrimaryPart,
hub spawn, boundary, ground ward, elevated mount, outside approach, and configured spacing.
It does not certify walking or HUD readability; check those in a real Play session.
HUD hooks are under `Players.LocalPlayer.PlayerGui.GlitchbloomHUD`.
The startup Script uses explicit `RunContext = Server` in ReplicatedStorage so it stays in
Codex's owned world folder. Claude's `src/server/` is reserved for gameplay.
