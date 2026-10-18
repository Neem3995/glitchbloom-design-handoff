local C = require(script.Parent.Parent.WorldConfig)
local P = require(script.Parent.Parts)
return function(parent, id, origin)
	local plot = Instance.new("Model")
	plot.Name = "Plot_" .. id
	plot.Parent = parent
	P.tag(plot, "PlotRoot", id)
	local size = C.PlotSizeStuds
	local boundary = P.part(plot, "PlotBoundary", size, origin + Vector3.new(0, size.Y / 2, 0))
	boundary.Transparency = 1
	boundary.CanCollide = false
	boundary.CanTouch = false
	boundary.CanQuery = false
	P.tag(boundary, "PlotBoundary", id)
	plot.PrimaryPart = boundary
	P.part(plot, "PlotFloor", Vector3.new(size.X, C.HubSize.Y, size.Z), origin - Vector3.new(0, C.HubSize.Y / 2, 0), C.Palette.Floor)
	P.rim(plot, origin, size)
	P.pad(plot, "PlotSpawn", origin + C.PlotSpawnOffset, C.SpawnSize, id, nil, "HOME BASE " .. id .. "\nPlotSpawn")
	local chest = P.pad(plot, "StarterChest", origin + C.ChestOffset, C.ChestSize, id, nil, "STARTER CHEST")
	chest.Color = C.Palette.Gold
	local home = P.pad(plot, "GardenerHome", origin + C.HomeOffset, C.HomeSize, id, nil, "GARDENER HOME")
	home.Color = C.Palette.Metal
	P.rim(plot, origin + C.HomeOffset + Vector3.new(0, C.HomeSize.Y, 0), C.HomeSize)
	P.pad(plot, "LootDrop", origin + C.LootOffset, C.LootSize, id, nil, "GROUND LOOT\nHarvest stockpile")
	P.pad(plot, "DeliveryPad", origin + C.DeliveryOffset, C.PadSize, id, nil, "DELIVERY PAD").Color = C.Palette.Gold
	P.pad(plot, "RaidApproach", origin + C.ApproachOffset, C.PadSize, id, nil, "APPROACH / " .. id)
	for i = 1, C.PlantSlotsPerPlot do
		local offset = C.GardenOrigin + Vector3.new(((i - 1) % 4) * C.SlotGap.X, 0, math.floor((i - 1) / 4) * C.SlotGap.Y)
		P.pad(plot, "PlantSlot", origin + offset, C.SlotSize, id, i)
	end
	for i = 1, C.WardSlotsPerPlot do
		P.pad(plot, "WardSlot", origin + C.WardOffsets[i], C.PostSize, id, i).Color = C.Palette.Gold
	end
	for i = 1, C.GuardianPostsPerPlot do
		P.pad(plot, "GuardianPost", origin + C.GuardianOffsets[i], C.PostSize, id, i).Color = C.Palette.Gold
	end
	for i = 1, C.CameraMountsPerPlot do
		local offset = C.CameraOffsets[i]
		P.part(plot, "MountPole", Vector3.new(C.PoleWidth, offset.Y, C.PoleWidth), origin + Vector3.new(offset.X, offset.Y / 2, offset.Z), C.Palette.Metal)
		P.pad(plot, "CameraMount", origin + offset, C.MountSize, id, i)
	end
	return plot
end
