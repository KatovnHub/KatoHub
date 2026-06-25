-- LocalScript (StarterPlayer/StarterPlayerScripts)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- ================= CẤU HÌNH CHO SNIPER NÚP BỤI =================
local ENEMY_COLOR = Color3.fromRGB(255, 30, 30)     -- Màu đỏ đậm cho địch
local TEAM_COLOR = Color3.fromRGB(0, 255, 100)      -- Màu xanh đồng đội
local WARNING_COLOR = Color3.fromRGB(255, 150, 0)   -- Màu cam cảnh báo

local MAX_TRACER_DISTANCE = 800 -- Quét siêu xa lên tới 800m
local WARNING_DISTANCE = 150    -- Báo động sớm khi địch vào tầm 150m
-- =============================================================

-- 1. Tạo UI cảnh báo nguy hiểm trên màn hình
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Shturm_Warning_Gui"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local warningLabel = Instance.new("TextLabel")
warningLabel.Size = UDim2.new(0, 500, 0, 50)
warningLabel.Position = UDim2.new(0.5, -250, 0.15, 0) -- Giữa màn hình, hơi xích lên trên
warningLabel.BackgroundTransparency = 1
warningLabel.TextSize = 28
warningLabel.Font = Enum.Font.SourceSansBold
warningLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
warningLabel.TextStrokeTransparency = 0
warningLabel.Text = ""
warningLabel.Visible = false
warningLabel.Parent = screenGui

local function createESP(player)
	if player == LocalPlayer then return end

	local function onCharacterAdded(character)
		local humanoid = character:WaitForChild("Humanoid", 15)
		local rootPart = character:WaitForChild("HumanoidRootPart", 15)
		if not humanoid or not rootPart then return end

		-- 2. Khung viền Highlight (Đã chỉnh 0.3 để nhìn địch trong bụi rõ hơn)
		local highlight = Instance.new("Highlight")
		highlight.Name = "Shturm_Highlight"
		highlight.FillTransparency = 0.3 
		highlight.OutlineTransparency = 0.1
		highlight.Adornee = character
		highlight.Parent = character

		-- 3. Bảng thông tin (Tên, % Máu, Khoảng cách)
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "Shturm_Billboard"
		billboard.Size = UDim2.new(0, 150, 0, 40)
		billboard.AlwaysOnTop = true
		billboard.ExtentsOffset = Vector3.new(0, 3, 0)
		billboard.Adornee = rootPart
		billboard.Parent = character

		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.TextSize = 13
		textLabel.Font = Enum.Font.RobotoMono 
		textLabel.TextStrokeTransparency = 0
		textLabel.Parent = billboard

		-- 4. Đường Kẻ Chỉ Hướng (Tracer Line)
		local tracer = Instance.new("LineHandleAdornment")
		tracer.Name = "Shturm_Tracer"
		tracer.Length = 0
		tracer.Thickness = 2
		tracer.ZIndex = 1
		tracer.AlwaysOnTop = true
		tracer.Adornee = workspace.Terrain
		tracer.Parent = character

		_G.ClosestEnemyDist = 9999 -- Reset biến khoảng cách

		local connection
		connection = RunService.RenderStepped:Connect(function()
			-- Xóa ESP nếu nhân vật chết hoặc out
			if not character:IsDescendantOf(workspace) or humanoid.Health <= 0 then
				connection:Disconnect()
				billboard:Destroy()
				highlight:Destroy()
				tracer:Destroy()
				return
			end

			local isSameTeam = player.Team == LocalPlayer.Team and player.Team ~= nil
			local finalColor = isSameTeam and TEAM_COLOR or ENEMY_COLOR

			highlight.FillColor = finalColor
			highlight.OutlineColor = finalColor

			-- Tính toán khoảng cách
			local distance = 0
			local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			
			if myRoot then
				distance = math.round((rootPart.Position - myRoot.Position).Magnitude)
				
				-- Cập nhật kẻ địch gần nhất cho hệ thống cảnh báo
				if not isSameTeam and distance < _G.ClosestEnemyDist then
					_G.ClosestEnemyDist = distance
				end
			end

			-- Chỉ hiển thị ESP cho địch để đỡ rối mắt khi núp bụi (Bỏ comment dòng dưới nếu muốn ẩn ESP đồng đội)
			-- if isSameTeam then billboard.Enabled = false highlight.Enabled = false else billboard.Enabled = true highlight.Enabled = true end

			textLabel.TextColor3 = finalColor
			textLabel.Text = string.format("%s\nHP: %d%% | %dm", player.Name, math.ceil((humanoid.Health/humanoid.MaxHealth)*100), distance)

			-- Tracer thông minh: Chỉ vẽ cho kẻ địch từ 10m đến 800m
			if not isSameTeam and distance >= 10 and distance <= MAX_TRACER_DISTANCE and myRoot then
				tracer.Visible = true
				tracer.CFrame = CFrame.new(myRoot.Position, rootPart.Position)
				tracer.Length = (rootPart.Position - myRoot.Position).Magnitude
				tracer.Color3 = finalColor
			else
				tracer.Visible = false
			end
		end)
	end

	if player.Character then onCharacterAdded(player.Character) end
	player.CharacterAdded:Connect(onCharacterAdded)
end

-- Vòng lặp cảnh báo (Quét 0.2s một lần để chống lag)
task.spawn(function()
	while task.wait(0.2) do
		if _G.ClosestEnemyDist and _G.ClosestEnemyDist <= WARNING_DISTANCE then
			warningLabel.Text = string.format("⚠️ CẢNH BÁO: ĐỊCH ÁP SÁT (%dm) ⚠️", _G.ClosestEnemyDist)
			warningLabel.Visible = true
		else
			warningLabel.Visible = false
		end
		_G.ClosestEnemyDist = 9999 
	end
end)

-- Kích hoạt
for _, player in ipairs(Players:GetPlayers()) do createESP(player) end
Players.PlayerAdded:Connect(createESP)
