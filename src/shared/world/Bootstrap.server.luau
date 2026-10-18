-- Visual-only startup in Codex's owned folder; explicitly runs on the server.
require(script.Parent.World).build()
if game:GetService("RunService"):IsStudio() then
	require(game:GetService("ServerStorage"):WaitForChild("Gate0Tests"):WaitForChild("AnchorCheck"))()
end
