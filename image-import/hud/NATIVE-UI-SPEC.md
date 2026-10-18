# Mixed-style HUD — proposed native GUI implementation

Keep `GlitchbloomHUD` and its five direct TextLabel hooks compatible with the current source. Design approval applies to the mixed world style; this HUD treatment is still a proposal. Review the current gameplay checkout before later implementation.

## Tokens
- Panel: #092E2A; text: #FFF1C7; border: #E5B64A.
- Secondary teal: #2DBAA4; sparing purple: #A964E8.
- GothamMedium/GothamBold, 16–18px for compact screens, 18–20px desktop.
- UICorner 12px; UIStroke 2px. Simple native fills; no rasterized panel text or shadows.
- Horizontal padding 12px; gap 8px; panel height at least 48px. Treat these as implementation starting values, not tested limits.

## Existing hooks
| Hook | Static baseline | Proposed treatment |
| --- | --- | --- |
| CurrencyLabel | SEEDS • — | Compact upper-left pill with seed icon |
| CycleTimer | CYCLE • Preview | Upper-right pill with native clock circle and hands |
| NotifyToast | GLITCHBLOOM / World preview | Small upper-center toast below top row; native indicator optional |
| CarryPanel | CARRY / Empty | Lower-center compact panel with carry icon |
| InteractPrompt | Explore on foot • Interactions coming | Prompt below carry panel with hand icon |

Source text remains the authority if active gameplay has already wired these labels. Do not overwrite live text with preview values during integration. No inventory capacity, new currency, functioning countdown or new input behavior is specified.

Icons can be child ImageLabels with 1:1 aspect ratio, ScaleType Fit and BackgroundTransparency 1. Reserve sufficient left padding for the icon instead of covering the hook's text. Keep icon tint white. InteractPrompt remains a TextLabel unless a separately coordinated input change requires otherwise.

## Responsive layout requirements for implementation
Use the GUI's safe content area. Reserve Roblox top-bar space, screen cutouts and both bottom corners for touch movement/jump. Do not trace the mockup's top-edge placement literally.

Use scale-based width with pixel min/max constraints. On desktop keep pills compact; on narrow screens let toast and prompt text wrap and adjust height/position together. Do not shrink text below readability to force the screenshot composition. Center the carry/prompt stack above mobile controls without obscuring the character or central interaction target. Large decorative corner crystals from the mockup may be omitted.

Before accepting implementation, check phone landscape, narrow portrait and desktop: text fit, panel overlap, core UI overlap, control accessibility, icon appearance at 32/40px, and all five original hooks. No layout/device test has been run on this new proposal.
