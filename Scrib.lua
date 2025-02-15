-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "Jujutsu Infinite Hub",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by HilanderGK",
    Theme = "Default"
})

-- Create Tabs
local AutoFarmTab = Window:CreateTab("Auto-Farm", 4483362458)
local TeleportTab = Window:CreateTab("Teleport", 4483362458)

-- Auto-Farm Toggle
local AutoFarm = false
AutoFarmTab:CreateToggle({
    Name = "Enable Auto-Farm",
    CurrentValue = false,
    Callback = function(value)
        AutoFarm = value
        while AutoFarm do
            pcall(function()
                for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") then
                        local player = game.Players.LocalPlayer
                        player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                        game:GetService("ReplicatedStorage").Remotes.Attack:FireServer(enemy)
                    end
                end
            end)
            wait(0.5)
        end
    end
})

-- Teleport to Locations
TeleportTab:CreateButton({
    Name = "Teleport to Training Area",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 50, 200) -- Change XYZ based on location
    end
})

TeleportTab:CreateButton({
    Name = "Teleport to Boss",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(500, 60, 1000) -- Change XYZ based on boss location
    end
})

-- Notification
Rayfield:Notify({
    Title = "Jujutsu Infinite Hub",
    Content = "Script Loaded Successfully!",
    Duration = 5
})
