local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "KatoHub - Multi Script",
    LoadingTitle = "Kato Hub",
    LoadingSubtitle = "by KatovnFake",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KatoHub",
        FileName = "Config"
    }
})

-- ================== SCRIPT LẺ (Universal) ==================
local LeTab = Window:CreateTab("Script Lẻ", 4483362458)

LeTab:CreateSection("🎯 FPS / Combat")
LeTab:CreateButton({
    Name = "🔫 Aim + ESP (KatovnHub)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/Universal-Roblox-Aim-ESP/main/script.lua"))()
        Rayfield:Notify({Title = "Loaded", Content = "Aim + ESP Activated!", Duration = 4})
    end
})

LeTab:CreateButton({
    Name = "🌡️ MTC V1.5 - Thermal ESP (Xuyên Xe)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/MTC/main/MTC_V1.5.lua"))()
        Rayfield:Notify({Title = "MTC V1.5", Content = "Thermal ESP Loaded!", Duration = 5})
    end
})

LeTab:CreateSection("⚡ Movement")
LeTab:CreateButton({
    Name = "🕊 Fly GUI V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

LeTab:CreateButton({
    Name = "⚡ Speed + Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/main/source"))()
    end
})

LeTab:CreateSection("🔧 Utility")
LeTab:CreateButton({
    Name = "The Button",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/TheButton.lua"))()
    end
})

LeTab:CreateButton({
    Name = "Dex Explorer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/Rbx_Scripts/main/Dex%20Explorer.lua"))()
    end
})

-- ================== SCRIPT GAME ==================
local GameTab = Window:CreateTab("Script Game", 4483362458)

GameTab:CreateSection("🚔 Notoriety")
GameTab:CreateButton({
    Name = "Notoriety Full Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/Notoriety/main/Notoriety.lua"))()
        Rayfield:Notify({Title = "Notoriety", Content = "Full Script Loaded!", Duration = 5})
    end
})

GameTab:CreateSection("🥷 FnF Remix")
GameTab:CreateButton({
    Name = "FnF Remix Script",
    Callback = function()
        loadstring(game:HttpGet("https://orbitsc.net/bfnf"))()
    end
})

GameTab:CreateSection("⚔️ The Strongest Battlegrounds (TSB)")
GameTab:CreateButton({
    Name = "TSB Script",
    Callback = function()
        Rayfield:Notify({Title = "TSB", Content = "Chưa có script, gửi link mình thêm", Duration = 5})
    end
})

GameTab:CreateSection("👊 AniPho")
GameTab:CreateButton({
    Name = "AniPho Script",
    Callback = function()
        Rayfield:Notify({Title = "AniPho", Content = "Gửi link script mình sẽ thêm", Duration = 5})
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
local InfoTab = Window:CreateTab("Thông Tin", 4483362458)

InfoTab:CreateLabel("KatoHub - Multi Script")
InfoTab:CreateLabel("Executor: Solara")
InfoTab:CreateLabel("PlaceId: " .. game.PlaceId)

InfoTab:CreateButton({
    Name = "🔄 Reload Hub",
    Callback = function()
        Rayfield:Destroy()
    end
})

Rayfield:Notify({
    Title = "KatoHub",
    Content = "Load thành công!",
    Duration = 6
})
