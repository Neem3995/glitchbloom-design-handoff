# Design snapshot (what agents need)

Source of truth for details is the project owner's Claude doc. This is the short version. **LOCKED** = the project owner decided. **PROPOSED** = default awaiting his yes; build to it only when your gate needs it, and flag it in STATUS.md.

## Pillars
Grow (alien magic-and-tech flora), stealth raiding (always on), and a scheduled raid window ("Purge"). Protected baseline: progress can be set back, never wiped out.

## LOCKED
- Names: Gardener (auto-farms), Raider (fights beside you, boosts stealth, never grabs loot), Guardian (patrols and fights intruders). Creatures defeated go on a respawn cooldown, never die permanently.
- First session: hub, teleport to own base, starter chest with growing tools, Gardener introduced; growing produces the Raider; isolated tutorial raid; then ward placement and a staged NPC sneak-in. Raider/Guardian arrive during that flow.
- Early game: harvests sit visibly on the ground at the plot (stealable). Later unlock: auto-store.
- Loot is only yours once the raider delivers it to their own base. Defeat or failure loses it.
- Detection: wards = radius ping, no line of sight, placed on the ground. Cameras = directional cone, elevated; a catch happens if the owner watches the monitor. Actual catch (owner/guard in contact) starts a 60 s escape timer. Stealth items reveal wards and camera cones.
- Being caught costs nothing in the field. The targeted penalty (against that defender only) applies once the raider is home. Protection buffs are universal; penalties are target-scoped.
- Offline plots can never be raided.
- Raid window: all-out, detection off, success = reach your base with loot before it closes. Cycle: 30 min calm, 5 min prep, 10 min window.
- Combat is direct player control. Creatures: attackers or support-only.
- Travel feel: "close yet far", 45-60 s run between plots (16 studs/s). Final spacing tuned in Studio.
- Robux: speed-ups, protection, base relocation, concealment pass. Targeted debuffs only earned in-game.

## PROPOSED (not yet approved)
- Cycle is 45 min start to start.
- Loot states: Available, Carried, Delivered; failures return the item to its owner's plot. One carrier per item.
- Caught penalty is saved as pending, survives disconnects, activates at home (or after 10 min).
- Stealth escape = leaving the plot boundary.
- Protection triggers on delivered valuable loot, blocks new entries, sabotage alone does not trigger it.
- Hub: no entering or teleporting while carrying stolen loot or while caught.
- Recovery floor: starter tools and basic seeds always re-granted; manual planting/harvesting always possible.
- Eggs and brewing are cut from v1 loot.
- Individual (not group) penalties in the prototype.

## Prototype slice (confirmed by the project owner)
Two plots, Gardener growth loop with visible ground loot, a Raider that can steal from the other plot, a Guardian that detects and fights back. No raid windows, leaderboard or monetization.

## Out of scope until told
Raid-window cycle, leaderboards, monetization, merging, multiple plots per player, relocation, cameras with monitors, cosmetics, saves beyond a stub.
