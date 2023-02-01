local workspace = game:GetService("Workspace")
local lp = game.Players.LocalPlayer
local originalPos = lp.Character.HumanoidRootPart.CFrame.Position
local originalGravity = workspace.Gravity

for i,v in pairs(workspace:GetChildren()) do
	workspace.Gravity = 0
	if string.find(v.Name, "Marker") then
		local part = v:FindFirstChild("Part")
		if part then
			lp.Character.HumanoidRootPart.CFrame = CFrame.new(part.Position)
			wait(4)
		end
	end
end

print("Found all markers")
lp.Character.HumanoidRootPart.CFrame = CFrame.new(originalPos)
workspace.Gravity = originalGravity
