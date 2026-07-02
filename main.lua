local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- 1. إعداد واجهة المستخدم الرسمية الشفافة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- الزر العائم لفتح وإغلاق اللوحة
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "MasterToggle"
ToggleBtn.Parent = ScreenGui
ToggleBtn.Position = UDim2.new(0.02, 0, 0.12, 0)
ToggleBtn.Size = UDim2.new(0, 90, 0, 35)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ToggleBtn.Text = "🔮 OPEN"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 13
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn

-- لوحة التحكم الرئيسية الاحترافية والمنظمة (تم زيادة الارتفاع قليلاً للحقوق)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MasterMainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Position = UDim2.new(0.1, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 280, 0, 430) -- حجم مخصص ومريح للترتيب الجديد
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- عنوان اللوحة الرئيسي
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Title.Text = "⚡ ONE TAP MASTER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- ==================== إنشاء أزرار التحكم والـ Sliders ====================

local function createButton(text, pos, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 35)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(35, 30, 35)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 100, 100)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 12
    btn.Parent = parent
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    return btn
end

local AimBtn = createButton("🤖 AIMBOT: OFF", UDim2.new(0.075, 0, 0.12, 0), MainFrame)
local EspBtn = createButton("👁️ ESP WALLHACK: OFF", UDim2.new(0.075, 0, 0.22, 0), MainFrame)
local SpeedBtn = createButton("⚡ SPEED BOOST: OFF", UDim2.new(0.075, 0, 0.32, 0), MainFrame)
local JumpBtn = createButton("🦘 HIGH JUMP: OFF", UDim2.new(0.075, 0, 0.42, 0), MainFrame)

-- عنوان قسم تخصيص دائرة الـ FOV
local FOVTitle = Instance.new("TextLabel")
FOVTitle.Size = UDim2.new(1, 0, 0, 20)
FOVTitle.Position = UDim2.new(0, 0, 0.53, 0)
FOVTitle.BackgroundTransparency = 1
FOVTitle.Text = "─── FOV CIRCLE CUSTOMIZE ───"
FOVTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
FOVTitle.TextSize = 10
FOVTitle.Font = Enum.Font.GothamBold
FOVTitle.Parent = MainFrame

-- أزرار التحكم بحجم الدائرة
local FOVPlusBtn = createButton("➕ INCREASE FOV", UDim2.new(0.075, 0, 0.59, 0), MainFrame)
FOVPlusBtn.Size = UDim2.new(0.4, 0, 0, 30)
FOVPlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local FOVMinusBtn = createButton("➖ DECREASE FOV", UDim2.new(0.525, 0, 0.59, 0), MainFrame)
FOVMinusBtn.Size = UDim2.new(0.4, 0, 0, 30)
FOVMinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- زر تغيير الألوان للدائرة
local ColorBtn = createButton("🎨 CHANGE FOV COLOR", UDim2.new(0.075, 0, 0.69, 0), MainFrame)
ColorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- ==================== قسم الحقوق والديسكورد (Abo Laith) ====================

local CreditsTitle = Instance.new("TextLabel")
CreditsTitle.Size = UDim2.new(1, 0, 0, 20)
CreditsTitle.Position = UDim2.new(0, 0, 0.79, 0)
CreditsTitle.BackgroundTransparency = 1
CreditsTitle.Text = "👑 MADE BY ABO LAITH"
CreditsTitle.TextColor3 = Color3.fromRGB(0, 255, 150) -- لون نيون مميز للحقوق
CreditsTitle.TextSize = 11
CreditsTitle.Font = Enum.Font.GothamBold
CreditsTitle.Parent = MainFrame

-- زر الديسكورد لنسخ الرابط
local DiscordBtn = createButton("💬 COPY DISCORD LINK", UDim2.new(0.075, 0, 0.85, 0), MainFrame)
DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242) -- لون الديسكورد الرسمي
DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

DiscordBtn.MouseButton1Click:Connect(function()
    -- استبدل الرابط أدناه برابط سيرفر الديسكورد الخاص بك
    local discordLink = "https://discord.gg/YOUR_LINK_HERE"
    
    if setclipboard then
        setclipboard(discordLink)
        DiscordBtn.Text = "✅ COPIED TO CLIPBOARD!"
        task.wait(2)
        DiscordBtn.Text = "💬 COPY DISCORD LINK"
    else
        DiscordBtn.Text = "❌ ERROR: NOT SUPPORTED"
    end
end)

-- ==================== إعداد دائرة الـ FOV الرسومية ====================

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 60
FOVCircle.Radius = 150
FOVCircle.Filled = false
FOVCircle.Visible = true
FOVCircle.Color = Color3.fromRGB(255, 0, 0)

local colorsList = {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 150, 255),
    Color3.fromRGB(255, 255, 0)
}
local currentColorIndex = 1

-- ==================== برمجة وظائف التفاعل الفورية ====================

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "❌ CLOSE" or "🔮 OPEN"
    ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(50, 30, 30) or Color3.fromRGB(30, 30, 40)
end)

local aimbotEnabled = false
local espEnabled = false
local speedEnabled = false
local jumpEnabled = false

AimBtn.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    AimBtn.BackgroundColor3 = aimbotEnabled and Color3.fromRGB(35, 50, 35) or Color3.fromRGB(35, 30, 35)
    AimBtn.Text = aimbotEnabled and "🤖 AIMBOT: ON" or "🤖 AIMBOT: OFF"
    AimBtn.TextColor3 = aimbotEnabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
end)

EspBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    EspBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(35, 50, 35) or Color3.fromRGB(35, 30, 35)
    EspBtn.Text = espEnabled and "👁️ ESP WALLHACK: ON" or "👁️ ESP WALLHACK: OFF"
    EspBtn.TextColor3 = espEnabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
    
    if not espEnabled then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("LuxuryESP") then
                p.Character.LuxuryESP:Destroy()
            end
        end
    end
end)

SpeedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    SpeedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(35, 50, 35) or Color3.fromRGB(35, 30, 35)
    SpeedBtn.Text = speedEnabled and "⚡ SPEED BOOST: ON" or "⚡ SPEED BOOST: OFF"
    SpeedBtn.TextColor3 = speedEnabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
end)

JumpBtn.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    JumpBtn.BackgroundColor3 = jumpEnabled and Color3.fromRGB(35, 50, 35) or Color3.fromRGB(35, 30, 35)
    JumpBtn.Text = jumpEnabled and "🦘 HIGH JUMP: ON" or "🦘 HIGH JUMP: OFF"
    JumpBtn.TextColor3 = jumpEnabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
end)

FOVPlusBtn.MouseButton1Click:Connect(function()
    FOVCircle.Radius = math.min(FOVCircle.Radius + 25, 400)
end)

FOVMinusBtn.MouseButton1Click:Connect(function()
    FOVCircle.Radius = math.max(FOVCircle.Radius - 25, 50)
end)

ColorBtn.MouseButton1Click:Connect(function()
    currentColorIndex = currentColorIndex + 1
    if currentColorIndex > #colorsList then currentColorIndex = 1 end
    FOVCircle.Color = colorsList[currentColorIndex]
end)

-- ==================== خوارزمية الذكاء والحركة المستمرة ====================

local function getClosestPlayerToCrosshair()
    local closestPlayer = nil
    local shortestDistance = FOVCircle.Radius

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character.Head.Position)
            if onScreen then
                local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                if distance < shortestDistance then
                    closestPlayer = player
                    shortestDistance = distance
                end
            end
        end
    end
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    if aimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = getClosestPlayerToCrosshair()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            local targetCFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
            Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, 0.25)
        end
    end

    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                local highlight = player.Character:FindFirstChild("LuxuryESP")
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "LuxuryESP"
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(160, 50, 255)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                end
            end
        end
    end

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speedEnabled and 55 or 16
        LocalPlayer.Character.Humanoid.JumpPower = jumpEnabled and 100 or 50
        LocalPlayer.Character.Humanoid.UseJumpPower = true
    end
end)
