local C = require(script.Parent.Parent.WorldConfig)
local P = require(script.Parent.Parts)
return function(parent)
	local hub = Instance.new("Folder")
	hub.Name = "Hub"
	hub.Parent = parent
	local o = C.HubOrigin
	P.part(hub, "HubFloor", C.HubSize, o - Vector3.new(0, C.HubSize.Y / 2, 0), C.Palette.Floor)
	P.rim(hub, o, C.HubSize)
	local spawn = Instance.new("SpawnLocation")
	spawn.Name = "HubSpawn"
	spawn.Anchored = true
	spawn.Size = C.SpawnSize
	spawn.Position = o + Vector3.new(0, C.SpawnSize.Y / 2, 0)
	spawn.Neutral = true
	spawn.Duration = 0
	spawn.Color = C.Palette.Gold
	spawn.Material = Enum.Material.SmoothPlastic
	spawn.Parent = hub
	P.tag(spawn, "HubSpawn")
	P.label(spawn, "GLITCHBLOOM\nArrival hub")
	local vendor = P.pad(hub, "HubVendor", o + C.VendorOffset, C.VendorSize, nil, nil, "SALVAGE EXCHANGE\nVendor placeholder")
	vendor.Color = C.Palette.Metal
	P.part(hub, "Canopy", C.VendorRoofSize, o + C.VendorOffset + Vector3.new(0, C.VendorRoofHeight, 0), C.Palette.Gold)
	local portal = P.pad(hub, "HubPlotPortal", o + C.PortalOffset, C.PadSize, nil, nil, "PLOT PORTAL\nOffline / walk to explore")
	portal.Color = C.Palette.Gold
	for _, side in {-1, 1} do
		P.part(hub, "PortalPillar", Vector3.new(C.PortalPillarWidth, C.PortalPillarHeight, C.PortalPillarWidth), o + C.PortalOffset + Vector3.new(side * C.PortalHalfWidth, C.PortalPillarHeight / 2, 0), C.Palette.Teal, Enum.Material.Neon)
	end
	for _, offset in C.CrystalOffsets do
		local crystal = P.part(hub, "AlienCrystal", C.CrystalSize, o + offset + Vector3.new(0, C.CrystalSize.Y / 2, 0), C.Palette.Teal, Enum.Material.Neon)
		crystal.CFrame *= CFrame.Angles(0, math.rad(45), math.rad(12))
	end
	return hub
end
