local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/HilanderGK/idk/refs/heads/main/2.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "Evohub",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by mal & v ant",
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
