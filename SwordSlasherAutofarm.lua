local Players = game:GetService("Players")
                local Workspace = game:GetService("Workspace")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")

                local LocalPlayer = Players.LocalPlayer
                local OriginalGravity = Workspace.Gravity

                local mobsFolder = Workspace.Mobs

                getgenv().attackToggle = not getgenv().attackToggle

                function attack()
                    ReplicatedStorage.EventStorage.Attack:InvokeServer()
                end

                function isAlive(instance)
                    if instance.Parent == Players then
                        return (instance.Character:FindFirstChild("Humanoid") and instance.Character.Humanoid.Health > 0 and instance.Character:FindFirstChild("HumanoidRootPart"))
                    elseif instance.Parent == mobsFolder then
                        return (instance:FindFirstChild("Humanoid") and instance.Humanoid.Health > 0 and instance:FindFirstChild("HumanoidRootPart"))
                    end
                end

                while getgenv().attackToggle and task.wait() do
                    if isAlive(LocalPlayer) and #mobsFolder:GetChildren() > 0 then
                        for _, v in pairs(mobsFolder:GetChildren()) do
                            if isAlive(v) then
                                if v:FindFirstChild("Head") then
                                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position) + Vector3.new(0, 4, 0)
                                    Workspace.Gravity = 0
                                    attack()
                                end
                            end
                        end
                    end
                end
                Workspace.Gravity = OriginalGravity
