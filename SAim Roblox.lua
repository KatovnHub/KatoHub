-- [[ AIMBOT CONFIGURATION ]]
local FOV_RADIUS = 80 
local AIM_SMOOTHNESS = 0.35 
local PREDICTION_INTENSITY = 0.14 

-- [[ SYSTEM VARIABLES ]]
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local HoldingRightClick = false

-- [[ FOV CIRCLE INITIALIZATION ]]
local FOVCircle = Drawing.new("Circle")
FOVCircle.Radius = FOV_RADIUS
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Thickness = 1
FOVCircle.Filled = false
FOVCircle.Visible = true

-- [[ TỐI ƯU HÓA: QUÉT MỤC TIÊU KHÔNG DÙNG TABLE SORT (GIẢM LAG) ]]
local function GetClosestPlayer()
    local ClosestTarget = nil
    local ShortestDistance = 500 -- Chỉ lấy mục tiêu trong vòng 500 stud
    
    -- Dùng ipairs nhanh hơn pairs
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Team ~= LocalPlayer.Team and Player.Character and Player.Character:FindFirstChild("Head") and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.Humanoid.Health > 0 then
            
            local Head = Player.Character.Head
            local ScreenPosition, OnScreen = Camera:WorldToViewportPoint(Head.Position)
            
            if OnScreen then
                -- Tính khoảng cách chuột đến mục tiêu trên màn hình (2D)
                local MouseDistance = (Vector2.new(ScreenPosition.X, ScreenPosition.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                
                -- Nếu nằm trong vòng tròn FOV
                if MouseDistance < FOV_RADIUS then
                    -- Tính khoảng cách thực tế trong game (3D)
                    local Current3DDistance = (Player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    
                    -- CHỈ cập nhật nếu khoảng cách này ngắn hơn khoảng cách ngắn nhất hiện tại
                    if Current3DDistance < ShortestDistance then
                        ClosestTarget = Player.Character
                        ShortestDistance = Current3DDistance
                    end
                end
            end
        end
    end

    return ClosestTarget
end

-- [[ INPUT DETECTION (CHUỘT PHẢI) ]]
UserInputService.InputBegan:Connect(function(Input, gpe) 
    if not gpe and Input.UserInputType == Enum.UserInputType.MouseButton2 then 
        HoldingRightClick = true 
    end 
end)

UserInputService.InputEnded:Connect(function(Input, gpe) 
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then 
        HoldingRightClick = false 
    end 
end)

-- [[ MAIN LOOP ĐÃ GỘP CHUNG ĐỂ TRÁNH QUÁ TẢI ]]
RunService.RenderStepped:Connect(function()
    -- Cập nhật vòng FOV theo tâm màn hình
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    -- Thực thi Aimbot
    if HoldingRightClick and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local TargetChar = GetClosestPlayer()
        if TargetChar and TargetChar:FindFirstChild("Head") and TargetChar:FindFirstChild("HumanoidRootPart") then
            local Head = TargetChar.Head
            local RootPart = TargetChar.HumanoidRootPart
            
            -- Tính vị trí đón đầu và khóa tâm
            local TargetPosition = Head.Position + (RootPart.Velocity * PREDICTION_INTENSITY)
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, TargetPosition), AIM_SMOOTHNESS)
        end
    end
end)
