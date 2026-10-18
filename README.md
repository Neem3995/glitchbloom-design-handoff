# Glitchbloom — Claude Design handoff

Design reference repository. Read [READ-ME-FIRST.txt](READ-ME-FIRST.txt), then [PROMPTS.md](PROMPTS.md).

## Source of truth
- [World/UI contracts](docs/CONTRACTS.md)
- [Design snapshot](docs/design-snapshot.md)
- [All 53 anchor positions](Gate0-anchor-positions.csv)
- [World dimensions and palette](src/shared/WorldConfig.luau)
- [Luau world builders](src/shared/world/)
- [Static HUD source](src/client/ui/Hud.client.luau)
- [Studio screenshots](reference/)
- [Anchor checker](tests/anchors/)

This is the Gate 0 visual baseline from gameplay-repository commit `18f3d3f`, not the active gameplay checkout. It intentionally excludes Gate 1 gameplay. The Rojo project file is reference context, not a complete runnable checkout.

Two plots, 700 studs apart. Preserve the supplied anchors and HUD hooks. The CSV positions are derived from the builders; the builders are authoritative. Concept images and HTML/CSS are references for later Roblox implementation, not proof of a successful Studio import.

This repository is private. Claude Design needs authorized GitHub access to read it; a URL alone does not grant access.