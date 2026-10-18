-- Run in Play on the server; errors fail the test immediately.
local C = require(game:GetService("ReplicatedStorage").WorldConfig)
local Tags = game:GetService("CollectionService")
return function()
	local function expect(ok, message) assert(ok, "[Gate0 anchors] " .. message) end
	local function tagged(tag)
		local items = Tags:GetTagged(tag)
		for _, item in items do
			expect(item:IsDescendantOf(workspace), tag .. " outside Workspace")
			expect(item:IsA("BasePart") or (item:IsA("Model") and item.PrimaryPart ~= nil), tag .. " must be a Part or Model with PrimaryPart")
		end
		return items
	end
	local hub, plots, loot = workspace:FindFirstChild("Hub"), workspace:FindFirstChild("Plots"), workspace:FindFirstChild("Loot")
	for name, folder in {Hub = hub or false, Plots = plots or false, Loot = loot or false} do
		expect(folder and folder:IsA("Folder"), "missing folder " .. name)
	end
	for _, tag in {"HubSpawn", "HubVendor", "HubPlotPortal"} do
		local items = tagged(tag)
		expect(#items == 1 and items[1]:IsDescendantOf(hub), "hub count/location: " .. tag)
	end
	expect(tagged("HubSpawn")[1]:IsA("SpawnLocation") and tagged("HubSpawn")[1].Enabled, "HubSpawn must be enabled SpawnLocation")
	for _, item in workspace:GetDescendants() do
		if item:IsA("SpawnLocation") and item.Enabled then expect(Tags:HasTag(item, "HubSpawn"), "unexpected enabled spawn") end
	end
	expect(#plots:GetChildren() == C.PlotCount, "plot count")
	local spec = {PlotRoot = 1, PlotSpawn = 1, PlotBoundary = 1, StarterChest = 1, GardenerHome = 1, LootDrop = 1, DeliveryPad = 1, RaidApproach = 1,
		PlantSlot = C.PlantSlotsPerPlot, WardSlot = C.WardSlotsPerPlot, CameraMount = C.CameraMountsPerPlot, GuardianPost = C.GuardianPostsPerPlot}
	local indexed = {PlantSlot = true, WardSlot = true, CameraMount = true, GuardianPost = true}
	for tag, count in spec do
		local items = tagged(tag)
		expect(#items == count * C.PlotCount, "total count: " .. tag)
		for id = 1, C.PlotCount do
			local plot = plots:FindFirstChild("Plot_" .. id)
			expect(plot and plot:IsA("Model") and plot.PrimaryPart, "Plot_" .. id .. " missing root/PrimaryPart")
			local seen, found = {}, 0
			for _, item in items do
				local plotId = item:GetAttribute("PlotId")
				expect(type(plotId) == "number" and plotId % 1 == 0 and plotId >= 1 and plotId <= C.PlotCount, tag .. " invalid PlotId")
				if plotId == id then
					found += 1
					expect(item == plot or item:IsDescendantOf(plot), tag .. " incorrect plot parent")
					if tag == "PlotRoot" then expect(item == plot, "PlotRoot must tag root model") end
					if indexed[tag] then
						local index = item:GetAttribute("SlotIndex")
						expect(type(index) == "number" and index % 1 == 0 and index >= 1 and index <= count and not seen[index], tag .. " invalid/duplicate SlotIndex")
						seen[index] = true
					end
					if tag == "PlotBoundary" then expect(item:IsA("BasePart") and item.Size == C.PlotSizeStuds and not item.CanCollide, "boundary size/collision") end
					if tag == "CameraMount" then expect(item.Position.Y > C.MountSize.Y, "camera mount not elevated") end
					if tag == "WardSlot" then expect(math.abs(item.Position.Y - item.Size.Y / 2) < 0.01, "ward not on ground") end
					if tag == "RaidApproach" then
						local boundary = plot:FindFirstChild("PlotBoundary")
						local point = boundary.CFrame:PointToObjectSpace(item.Position)
						expect(math.abs(point.X) > boundary.Size.X / 2 or math.abs(point.Z) > boundary.Size.Z / 2, "RaidApproach inside plot")
					end
				end
			end
			expect(found == count, tag .. " wrong per-plot count for " .. id)
		end
	end
	for id = 2, C.PlotCount do
		local a, b = plots["Plot_" .. (id - 1)].PrimaryPart.Position, plots["Plot_" .. id].PrimaryPart.Position
		expect(math.abs((a - b).Magnitude - C.PlotSpacingStuds) < 0.01, "plot spacing")
	end
	print("[Gate0 anchors] PASS: 3 hub anchors; 2 plots; 25 anchors per plot; spacing 700")
	return true
end
