local C = require(script.Parent.Parent.WorldConfig)
local P = require(script.Parent.Parts)
local buildHub = require(script.Parent.Hub)
local buildPlot = require(script.Parent.Plot)
local World = {}

function World.build()
	assert(not workspace:FindFirstChild("Hub") and not workspace:FindFirstChild("Plots"), "World already exists; restart Play to rebuild")
	local hub = buildHub(workspace)
	local plots = Instance.new("Folder")
	plots.Name = "Plots"
	plots.Parent = workspace
	if not workspace:FindFirstChild("Loot") then
		local loot = Instance.new("Folder")
		loot.Name = "Loot"
		loot.Parent = workspace
	end
	local span = (C.PlotCount - 1) * C.PlotSpacingStuds
	P.part(hub, "ConnectingGround", Vector3.new(span + C.GroundMargin * 2, C.GroundThickness, C.GroundDepth), Vector3.new(0, -C.GroundThickness / 2 - C.HubSize.Y, 0), C.Palette.Ground)
	-- Continuous flush walkways connect the hub and both home bases.
	local centerZ = C.PlotZ + C.ApproachOffset.Z
	P.part(hub, "Crosswalk", Vector3.new(span + C.WalkwayWidth, C.HubSize.Y, C.WalkwayWidth), Vector3.new(0, -C.HubSize.Y / 2, centerZ), C.Palette.Floor)
	local hubDistance = math.abs(centerZ - C.HubOrigin.Z)
	P.part(hub, "HubWalkway", Vector3.new(C.WalkwayWidth, C.HubSize.Y, hubDistance), Vector3.new(0, -C.HubSize.Y / 2, (centerZ + C.HubOrigin.Z) / 2), C.Palette.Floor)
	for id = 1, C.PlotCount do
		local origin = Vector3.new((id - 1) * C.PlotSpacingStuds - span / 2, 0, C.PlotZ)
		buildPlot(plots, id, origin)
		P.part(hub, "PlotWalkway_" .. id, Vector3.new(C.WalkwayWidth, C.HubSize.Y, math.abs(C.ApproachOffset.Z)), Vector3.new(origin.X, -C.HubSize.Y / 2, (centerZ + C.PlotZ) / 2), C.Palette.Floor)
	end
	local lighting = game:GetService("Lighting")
	lighting.ClockTime = 15
	lighting.Brightness = 2
	lighting.Ambient = Color3.fromRGB(78, 104, 100)
	lighting.OutdoorAmbient = Color3.fromRGB(104, 128, 119)
	local atmosphere = Instance.new("Atmosphere")
	atmosphere.Name = "GlitchbloomAtmosphere"
	atmosphere.Density = 0.18
	atmosphere.Haze = 0.8
	atmosphere.Color = Color3.fromRGB(165, 218, 196)
	atmosphere.Decay = Color3.fromRGB(65, 98, 91)
	atmosphere.Parent = lighting
	local bloom = Instance.new("BloomEffect")
	bloom.Name = "GlitchbloomGlow"
	bloom.Intensity = 0.15
	bloom.Size = 18
	bloom.Threshold = 1.5
	bloom.Parent = lighting
	workspace:SetAttribute("GlitchbloomWorldReady", true)
	print("[Gate0] World built: Hub, 2 plots, Loot folder; spacing " .. C.PlotSpacingStuds)
end

return World
