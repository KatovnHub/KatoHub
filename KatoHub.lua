-- Tối ưu cho Solara
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(1)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "〔 KATOHUB LOADER 〕",
    LoadingTitle = "Checking Authentication...",
    LoadingSubtitle = "KatoHub V1 - Secure Loader",
    Theme = "Black",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KatoHub",
        FileName = "Config"
    },
    KeySystem = false
})

-- ================== SCRIPT LẺ (Universal) ==================
local LeTab = Window:CreateTab("Script Lẻ", 0)

LeTab:CreateSection("🎯 FPS / Combat")
LeTab:CreateButton({
    Name = "🔫 Aim + ESP (KatovnHub)",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/Universal-Roblox-Aim-ESP/main/script.lua"))()
            Rayfield:Notify({Title = "Loaded", Content = "Aim + ESP Activated!", Duration = 4})
        end)
    end
})

LeTab:CreateSection("⚡ Movement")
LeTab:CreateButton({
    Name = "🕊 Fly GUI V3",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        end)
    end
})

LeTab:CreateButton({
    Name = "⚡ Speed + Infinite Yield",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/main/source"))()
        end)
    end
})

LeTab:CreateSection("🔧 Utility")
LeTab:CreateButton({
    Name = "⚙️ The Button",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/TheButton.lua"))()
        end)
    end
})

LeTab:CreateButton({
    Name = "🗂️ Dex Explorer",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/Rbx_Scripts/main/Dex%20Explorer.lua"))()
        end)
    end
})

-- ================== SCRIPT GAME ==================
local GameTab = Window:CreateTab("Script Game", 0)

GameTab:CreateSection("🚔 Notoriety")
GameTab:CreateButton({
    Name = "Notoriety Full Script",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/Notoriety/main/Notoriety.lua"))()
            Rayfield:Notify({Title = "Notoriety", Content = "Full Script Loaded!", Duration = 5})
        end)
    end
})

GameTab:CreateSection("🥷 FnF Remix")
GameTab:CreateButton({
    Name = "FnF Remix Script",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://orbitsc.net/bfnf"))()
        end)
    end
})

GameTab:CreateSection("⚔️ The Strongest Battlegrounds")
GameTab:CreateButton({
    Name = "🔥 TSB Script",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/premium.lua"))()
            Rayfield:Notify({Title = "TSB Premium", Content = "Script Loaded successfully!", Duration = 5})
        end)
    end
})

GameTab:CreateSection("👊 AniPhobia")
GameTab:CreateButton({
    Name = "♾️ Menu AniPhobia (V1)",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/KatoHub/main/INF%20Ammo%20AniPhobia"))()
            Rayfield:Notify({Title = "AniPhobia", Content = "Đã chạy Infinite Ammo!", Duration = 5})
        end)
    end
})

GameTab:CreateSection("🌡️ MTC V1.5")
GameTab:CreateButton({
    Name = "🌡️ MTC V1.5",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/MTC/main/MTC_V1.5.lua"))()
            Rayfield:Notify({Title = "MTC V1.5", Content = "Thermal ESP Loaded!", Duration = 5})
        end)
    end
})

GameTab:CreateSection("Khác")
GameTab:CreateButton({
    Name = "➕ Thêm Game Mới",
    Callback = function()
        Rayfield:Notify({Title = "Hướng dẫn", Content = "Gửi tên game + link script mình thêm ngay", Duration = 6})
    end
})

-- ================== THÔNG TIN ==================
local InfoTab = Window:CreateTab("Thông Tin", 0)

InfoTab:CreateSection("✨ KATO HUB ID: 91288476465587 ✨")
InfoTab:CreateLabel("⚡ Bản quyền thuộc về KatovnFake")
InfoTab:CreateLabel("🛠️ Executor tối ưu: Solara")
InfoTab:CreateLabel("📌 PlaceId hiện tại: " .. game.PlaceId)

InfoTab:CreateButton({
    Name = "❌ Đóng Toàn Bộ Hub",
    Callback = function()
        Rayfield:Destroy()
    end
})

Rayfield:Notify({
    Title = "〔 KATOHUB 〕",
    Content = "Hub đã được kích hoạt thành công!",
    Duration = 6
})
