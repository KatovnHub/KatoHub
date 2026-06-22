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

LeTab:CreateSection("🎯 FPS Games (Arsenal, CBRO, Phantom Forces...)")
LeTab:CreateButton({
    Name = "🔫 Aim + ESP (KatovnHub)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KatovnHub/Universal-Roblox-Aim-ESP/main/script.lua"))()
        Rayfield:Notify({Title = "Loaded", Content = "Aim + ESP Loaded!", Duration = 4})
    end
})

LeTab:CreateButton({
    Name = "🎯 Silent Aim",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Silent%20Aim.lua"))()
    end
})

LeTab:CreateSection("⚡ Movement")
LeTab:CreateButton({
    Name = "🕊 Fly GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Fly%20GUI"))()
    end
})

LeTab:CreateButton({
    Name = "⚡ Speed + Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/main/source"))()
    end
})

LeTab:CreateSection("👁 Visual")
LeTab:CreateButton({
    Name = "ESP Full",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/Rbx_Scripts/main/Esp.lua"))()
    end
})

LeTab:CreateSection("🔧 Utility")
LeTab:CreateButton({
    Name = "Dex Explorer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/Rbx_Scripts/main/Dex%20Explorer.lua"))()
    end
})

-- ================== SCRIPT GAME (Từng Game Cụ Thể) ==================
local GameTab = Window:CreateTab("Script Game", 4483362458)

GameTab:CreateSection("🥷 Blox Fruits")
GameTab:CreateButton({
    Name = "Blox Fruits Script (Auto Farm, etc)",
    Callback = function()
        -- Thêm link script Blox Fruits bạn hay dùng
        Rayfield:Notify({Title = "Info", Content = "Chưa có script Blox Fruits, gửi link mình thêm", Duration = 5})
    end
})

GameTab:CreateSection("⚔️ The Strongest Battlegrounds (TSB)")
GameTab:CreateButton({
    Name = "TSB Script",
    Callback = function()
        Rayfield:Notify({Title = "Info", Content = "Gửi link TSB script bạn muốn thêm", Duration = 5})
    end
})

GameTab:CreateSection("👊 Anime Phantom / AniPho")
GameTab:CreateButton({
    Name = "AniPho Script",
    Callback = function()
        Rayfield:Notify({Title = "Info", Content = "Gửi link AniPho script bạn muốn thêm", Duration = 5})
    end
})

GameTab:CreateSection("Khác")
GameTab:CreateButton({
    Name = "Thêm Game Mới",
    Callback = function()
        Rayfield:Notify({Title = "Hướng dẫn", Content = "Gửi tên game + link script mình sẽ thêm ngay", Duration = 6})
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
    Content = "Load thành công!\nScript Lẻ = Universal theo thể loại\nScript Game = Script riêng từng game",
    Duration = 7
})
