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
local ItemTab = Window:CreateTab("Item Spawner", 4483362458)

-- Auto-Farm Variables
local AutoFarm = false
local player = game.Players.LocalPlayer
local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

-- Function to find the enemy folder dynamically
local function findEnemyFolder()
    local workspaceFolders = game:GetService("Workspace"):GetChildren()
    for _, folder in pairs(workspaceFolders) do
        if folder:IsA("Folder") and #folder:GetChildren() > 0 then
            local firstChild = folder:GetChildren()[1]
            if firstChild:FindFirstChild("HumanoidRootPart") then
                return folder
            end
        end
    end
    return nil
end

-- Function to find attack remote automatically
local function findAttackRemote()
    for _, v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:lower():find("attack") then
            return v
        end
    end
    return nil
end

-- Function to find item spawn remote (or you can adjust this to work with part spawns)
local function findItemSpawnRemote()
    for _, v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
        if v:IsA("RemoteEvent") and v.Name:lower():find("item") then
            return v
        end
    end
    return nil
end

-- Auto-Farm Toggle
AutoFarmTab:CreateToggle({
    Name = "Enable Auto-Farm",
    CurrentValue = false,
    Callback = function(value)
        AutoFarm = value
        local enemyFolder = findEnemyFolder()
        local attackRemote = findAttackRemote()

        if not enemyFolder then
            Rayfield:Notify({Title = "Error", Content = "No enemies found!", Duration = 3})
            return
        end

        if not attackRemote then
            Rayfield:Notify({Title = "Error", Content = "No attack remote found!", Duration = 3})
            return
        end

        Rayfield:Notify({Title = "Auto-Farm", Content = "Auto-Farm Started!", Duration = 5})

        while AutoFarm do
            pcall(function()
                for _, enemy in pairs(enemyFolder:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") then
                        -- Move smoothly to enemy
                        local TweenService = game:GetService("TweenService")
                        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
                        local goal = {CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)}
                        local tween = TweenService:Create(root, tweenInfo, goal)
                        tween:Play()

                        -- Attack enemy
                        attackRemote:FireServer(enemy)

                        wait(math.random(1, 2)) -- Random delay to look human
                    end
                end
            end)
            wait(0.5) -- Prevent lag
        end
    end
})

-- Item Spawner (use this to spawn items)
ItemTab:CreateButton({
    Name = "Spawn Item 1",
    Callback = function()
        local itemRemote = findItemSpawnRemote()

        if itemRemote then
            -- Fire the remote event to spawn the item (this will vary based on the game’s setup)
            itemRemote:FireServer("ItemType1") -- Replace "ItemType1" with the actual item name or argument needed
            Rayfield:Notify({Title = "Item Spawn", Content = "Item 1 Spawned!", Duration = 5})
        else
            Rayfield:Notify({Title = "Error", Content = "Item Spawn Remote not found!", Duration = 3})
        end
    end
})

ItemTab:CreateButton({
    Name = "Spawn Item 2",
    Callback = function()
        local itemRemote = findItemSpawnRemote()

        if itemRemote then
            -- Fire the remote event to spawn the item
            itemRemote:FireServer("ItemType2") -- Replace "ItemType2" with actual item name or argument
            Rayfield:Notify({Title = "Item Spawn", Content = "Item 2 Spawned!", Duration = 5})
        else
            Rayfield:Notify({Title = "Error", Content = "Item Spawn Remote not found!", Duration = 3})
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
