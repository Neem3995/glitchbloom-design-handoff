# Glitchbloom image import pack

The owner approved the mixed hub visual direction. The HUD and icons are new proposals awaiting visual review.

## What to import
Upload only the PNGs in `hud/icons/` as Roblox image assets. Keep their filenames unchanged:

| File | Intended HUD hook | Display size |
| --- | --- | --- |
| gb_ui_seed_v01.png | CurrencyLabel | 32–40 px square |
| gb_ui_carry_v01.png | CarryPanel | 32–40 px square |
| gb_ui_interact_v01.png | InteractPrompt | 32–40 px square |

All three originals are 1254 × 1254 RGBA PNGs with verified transparent and opaque pixels. No manual cutting from an icon sheet is needed. Preserve alpha when uploading. Full-resolution files are retained without image-processing edits. Actual appearance at small sizes and on devices needs Studio review.

After upload, copy each returned Roblox asset ID into the matching `assetId` field in `manifest.json`. Each icon is intended for an ImageLabel with transparent background and ScaleType Fit. Keep the containing HUD text editable and preserve its existing integration hook. Asset IDs are deliberately blank until real uploads occur; do not invent them.

## References — do not bulk-upload these
`references/gb_ref_hub_mixed_approved_v01.png` is the approved world-style reference. It does not turn into an editable world when imported.

`references/gb_ref_hud_mixed_proposal_v01.png` is a flattened visual proposal. Rebuild its panels and text with native Roblox GUI objects; do not use the whole screenshot as a HUD overlay. Its pictured icons and decorative flourishes are illustrative: use the three standalone icon files as the actual proposed assets. The mockup is not a tested screen layout.

See `hud/NATIVE-UI-SPEC.md` for native components and mobile guidance. The clock and toast indicator use native shapes; no additional PNG is required. Decorative crystal clusters on panel corners are optional and are not included as extracted assets.

## Naming and versions
`gb_ref_*` = reference only. `gb_ui_*` = individual UI image. `v01` is the first version; save future revisions as v02 rather than overwriting approved files.

`manifest.json` records asset roles and upload status. `file-validation.json` records actual file dimensions and alpha checks. `generation-prompts.txt` records the prompts used with the built-in image tool.

Status: files generated and inspected; no Roblox upload, asset-ID assignment, in-game integration or Studio test performed for this pack. The gameplay checkout was not changed.
