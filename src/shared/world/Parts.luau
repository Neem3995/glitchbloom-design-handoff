local C = require(script.Parent.Parent.WorldConfig)
local Tags = game:GetService("CollectionService")
local Parts = {}

function Parts.part(parent, name, size, position, color, material)
	local part = Instance.new("Part")
	part.Name = name
	part.Anchored = true
	part.Size = size
	part.Position = position
	part.Color = color or C.Palette.Metal
	part.Material = material or Enum.Material.SmoothPlastic
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth
	part.Parent = parent
	return part
end

function Parts.label(part, text)
	local gui = Instance.new("BillboardGui")
	gui.Name = "AnchorLabel"
	gui.Size = UDim2.fromScale(C.LabelSize.X, C.LabelSize.Y)
	gui.StudsOffset = Vector3.new(0, part.Size.Y / 2 + C.LabelHeight, 0)
	gui.MaxDistance = C.LabelDistance
	gui.AlwaysOnTop = false
	gui.Parent = part
	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundColor3 = C.Palette.Metal
	label.BackgroundTransparency = 0.12
	label.TextColor3 = C.Palette.Text
	label.Text = text
	label.TextSize = 15
	label.TextScaled = true
	label.Font = Enum.Font.GothamMedium
	label.TextWrapped = true
	label.Parent = gui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = label
end

function Parts.tag(item, tag, plotId, index)
	Tags:AddTag(item, tag)
	if plotId then item:SetAttribute("PlotId", plotId) end
	if index then item:SetAttribute("SlotIndex", index) end
	return item
end

function Parts.pad(parent, tag, origin, size, plotId, index, label)
	local part = Parts.part(parent, tag .. (index and "_" .. index or ""), size, origin + Vector3.new(0, size.Y / 2, 0), C.Palette.Teal)
	Parts.tag(part, tag, plotId, index)
	Parts.label(part, label or tag .. (index and " " .. index or ""))
	return part
end

function Parts.rim(parent, origin, size)
	for _, side in {-1, 1} do
		Parts.part(parent, "GlowEdge", Vector3.new(size.X, C.RimHeight, C.RimWidth), origin + Vector3.new(0, C.RimHeight / 2, side * size.Z / 2), C.Palette.Teal, Enum.Material.Neon).CanCollide = false
		Parts.part(parent, "GlowEdge", Vector3.new(C.RimWidth, C.RimHeight, size.Z), origin + Vector3.new(side * size.X / 2, C.RimHeight / 2, 0), C.Palette.Teal, Enum.Material.Neon).CanCollide = false
	end
end

return Parts
