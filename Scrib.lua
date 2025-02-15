local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Evohub",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Some Guy",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Evohub"
   },

   Discord = {
      Enabled = true,
      Invite = "evohub",
      RememberJoins = true
   },

   KeySystem = false
})

local Tab1 = Window:CreateTab("Evohub Invite", 4483362458)

Tab1:CreateButton({
   Name = "Evohub Invite",
   Callback = function()
      setclipboard("https://discord.gg/evohub")
      Rayfield:Notify({
         Title = "Discord",
         Content = "Discord Invite has been copied to your Clipboard!",
         Duration = 15,
         Image = 4483362458
      })
   end
})
