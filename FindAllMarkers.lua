local workspace = game:GetService("Workspace")
local lp = game.Players.LocalPlayer

for i,v in pairs(workspace:GetChildren()) do
	if string.find(v.Name, "Marker") then
		lp.Character.HumanoidRootPart.CFrame = CFrame.new(v:FindFirstChild("Part").Position)
		wait(2)
		continue
	end
end
