-- Static Gate 0 presentation. No input actions, state, remotes, or countdowns.
local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local gui = Instance.new("ScreenGui")
gui.Name = "GlitchbloomHUD"
gui.ResetOnSpawn = false
gui.DisplayOrder = 10
gui.Parent = playerGui

local function label(name, text, position, size, anchor)
	local item = Instance.new("TextLabel")
	item.Name = name
	item.Position = position
	item.Size = size
	item.AnchorPoint = anchor or Vector2.zero
	item.BackgroundColor3 = Color3.fromRGB(13, 35, 35)
	item.BackgroundTransparency = 0.08
	item.TextColor3 = Color3.fromRGB(231, 245, 224)
	item.Font = Enum.Font.GothamMedium
	item.TextSize = 16
	item.TextWrapped = true
	item.Text = text
	item.Parent = gui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = item
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(102, 167, 141)
	stroke.Transparency = 0.25
	stroke.Parent = item
	local padding = Instance.new("UIPadding")
	padding.PaddingLeft = UDim.new(0, 10)
	padding.PaddingRight = UDim.new(0, 10)
	padding.Parent = item
	local cap = Instance.new("UISizeConstraint")
	cap.MaxSize = Vector2.new(420, 64)
	cap.Parent = item
	return item
end

label("CurrencyLabel", "SEEDS  •  —", UDim2.new(0, 12, 0, 12), UDim2.new(0.42, 0, 0, 48))
label("CycleTimer", "CYCLE  •  Preview", UDim2.new(1, -12, 0, 12), UDim2.new(0.42, 0, 0, 48), Vector2.new(1, 0))
label("NotifyToast", "GLITCHBLOOM  /  World preview", UDim2.new(0.5, 0, 0, 70), UDim2.new(1, -24, 0, 48), Vector2.new(0.5, 0))
label("CarryPanel", "CARRY  /  Empty", UDim2.new(0.5, 0, 1, -130), UDim2.new(0.65, 0, 0, 48), Vector2.new(0.5, 1))
label("InteractPrompt", "Explore on foot • Interactions coming", UDim2.new(0.5, 0, 1, -72), UDim2.new(1, -24, 0, 52), Vector2.new(0.5, 1))
print("[Gate0] HUD ready: five static hooks")
