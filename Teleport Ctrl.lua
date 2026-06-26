-- [[ CTRL + CLICK TELEPORT ]]
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Lắng nghe sự kiện click chuột trái
Mouse.Button1Down:Connect(function()
    -- Kiểm tra xem phím Ctrl (Trái hoặc Phải) có đang được giữ không
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
        local Character = LocalPlayer.Character
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            local RootPart = Character.HumanoidRootPart
            local TargetPosition = Mouse.Hit.Position
            
            -- Dịch chuyển (Cộng thêm 3 stud trục Y để không bị kẹt dưới đất)
            RootPart.CFrame = CFrame.new(TargetPosition + Vector3.new(0, 3, 0))
        end
    end
end)

print("✅ Ctrl + Click Teleport Loaded! Giữ Ctrl và Click chuột trái để bay.")
