# Claude Design prompts

## Shared requirements — read before every task
Read READ-ME-FIRST.txt, docs/CONTRACTS.md, WorldConfig and the relevant Luau builders or HUD source before designing. Use the supplied Gate 0 baseline. Do not infer gameplay from decorative shapes or static text.

Create Roblox-friendly visual specifications: native Parts/Models for world geometry; native GUI objects for editable panels/text. Use emerald/teal, warm gold, restrained glow and clear alien magic-meets-tech silhouettes. Keep designs mobile-friendly and walking routes clear.

Preserve exact anchor tags, instance names, numeric PlotId/SlotIndex values, counts and positions. Separate functional anchors from decoration. Clearly mark proposals that alter the baseline; do not silently adopt them.

For each world assembly give dimensions in studs, pivots, named pieces, materials and collision suggestions. For UI give hierarchy, RGB/hex colors, font sizes, spacing, anchor points and responsive sizing. Preserve direct HUD hooks under GlitchbloomHUD. Avoid web-only blur, stacked shadows and fonts unavailable in Roblox. Keep text out of raster assets.

Deliver actual exported files only when supported. Optional icons should be individual transparent PNGs with filename/dimensions/use manifest. HTML/CSS is a reference, not Roblox-importable UI. If FBX/glTF export is unavailable, native-Part assembly specs and orthographic references are accepted. Do not claim Studio verification. Do not modify game source or implement gameplay.

## 1. Correct and finish the hub
Replace the provisional four-base/diagonal-route layout with the supplied TWO plots, 700 studs apart, and actual orthogonal walkways. Match HubSpawn, HubVendor and HubPlotPortal coordinates exactly. Label the drawing axes; if north is -Z, state this as a diagram convention. Lamp-lined routes may appear only as optional decoration that does not obstruct walking.

Deliver a corrected overhead, third-person concept, landmark assembly breakdowns and palette/material guide. Distinguish source geometry from proposed decoration. Do not invent measured travel times.

## 2. Home base kit
Design a reusable visual kit around the existing 160 x 140 stud plot. Preserve all 25 tagged anchors per plot: PlotRoot, PlotSpawn, PlotBoundary, StarterChest, GardenerHome, LootDrop, DeliveryPad, RaidApproach; eight PlantSlots, four WardSlots, two elevated CameraMounts, three GuardianPosts. Read exact positions and sizes from the supplied files.

Deliver an annotated overhead, player-eye concept and native-Part assembly specification. Make ground loot and delivery distinct in shape as well as color. Reuse the kit for both plots.

## 3. HUD
Style CurrencyLabel, CarryPanel, CycleTimer, NotifyToast and InteractPrompt while preserving their exact names and integration hierarchy. Use the source's static placeholder text. No invented economy, carry capacity, functioning timers, raid-window behavior or input logic. InteractPrompt is currently a TextLabel.

Deliver phone-landscape, desktop-landscape and narrow-width reference layouts. Keep the center view clear and respect Roblox top-bar and mobile controls. Use at least 48px heights for proposed interactive targets. Current placeholder dimensions are a baseline; responsive styling improvements may be proposed.

Include a native-GUI component spec and optional icon manifest. Keep labels editable. Do not flatten the entire HUD into an image.