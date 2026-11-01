local GroupLink = "https://www.roblox.com.ss/communities/4023493828/unset"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

if PG:FindFirstChild("XenoHubUI") then PG.XenoHubUI:Destroy() end

--// Colors
local Colors = {
    Background = Color3.fromRGB(18, 18, 22),
    Sidebar = Color3.fromRGB(14, 14, 18),
    TitleBar = Color3.fromRGB(16, 16, 20),
    Card = Color3.fromRGB(28, 28, 34),
    CardHover = Color3.fromRGB(36, 36, 44),
    Accent = Color3.fromRGB(120, 90, 255),
    Text = Color3.fromRGB(240, 240, 245),
    TextDim = Color3.fromRGB(150, 150, 165),
    TextMuted = Color3.fromRGB(110, 110, 125)
}

local SG = Instance.new("ScreenGui", PG)
SG.Name = "XenoHubUI"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Window
local MF = Instance.new("Frame", SG)
MF.Size = UDim2.new(0, 520, 0, 340)
MF.Position = UDim2.new(0.5, -260, 0.5, -170)
MF.BackgroundColor3 = Colors.Background
MF.BorderSizePixel = 0
Instance.new("UICorner", MF).CornerRadius = UDim.new(0, 14)

-- Soft Shadow
local Shadow = Instance.new("ImageLabel", MF)
Shadow.Size = UDim2.new(1, 50, 1, 50)
Shadow.Position = UDim2.new(0, -25, 0, -25)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.55
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
Shadow.ZIndex = 0

-- Title Bar
local TB = Instance.new("Frame", MF)
TB.Size = UDim2.new(1, 0, 0, 42)
TB.BackgroundColor3 = Colors.TitleBar
TB.BorderSizePixel = 0
Instance.new("UICorner", TB).CornerRadius = UDim.new(0, 14)

local TitleFix = Instance.new("Frame", TB)
TitleFix.Size = UDim2.new(1, 0, 0, 16)
TitleFix.Position = UDim2.new(0, 0, 1, -16)
TitleFix.BackgroundColor3 = Colors.TitleBar
TitleFix.BorderSizePixel = 0

local Title = Instance.new("TextLabel", TB)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 18, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Xeno Hub"
Title.TextColor3 = Colors.Text
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local Close = Instance.new("TextButton", TB)
Close.Size = UDim2.new(0, 42, 1, 0)
Close.Position = UDim2.new(1, -42, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "✕"
Close.TextColor3 = Colors.TextDim
Close.TextSize = 18
Close.Font = Enum.Font.GothamBold
Close.MouseButton1Click:Connect(function() SG:Destroy() end)

Close.MouseEnter:Connect(function()
    TweenService:Create(Close, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 90, 90)}):Play()
end)
Close.MouseLeave:Connect(function()
    TweenService:Create(Close, TweenInfo.new(0.15), {TextColor3 = Colors.TextDim}):Play()
end)

-- Sidebar
local Side = Instance.new("Frame", MF)
Side.Size = UDim2.new(0, 160, 1, -42)
Side.Position = UDim2.new(0, 0, 0, 42)
Side.BackgroundColor3 = Colors.Sidebar
Side.BorderSizePixel = 0

-- Content
local Content = Instance.new("Frame", MF)
Content.Size = UDim2.new(1, -160, 1, -42)
Content.Position = UDim2.new(0, 160, 0, 42)
Content.BackgroundColor3 = Colors.Background
Content.BorderSizePixel = 0

-- Sidebar Button Maker
local function MakeBtn(name, y, active)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -16, 0, 42)
    b.Position = UDim2.new(0, 8, 0, y)
    b.BackgroundColor3 = active and Color3.fromRGB(32, 30, 48) or Colors.Sidebar
    b.BorderSizePixel = 0
    b.Text = ""
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

    local ind = Instance.new("Frame", b)
    ind.Size = UDim2.new(0, 3, 0, 22)
    ind.Position = UDim2.new(0, 0, 0.5, -11)
    ind.BackgroundColor3 = Colors.Accent
    ind.BorderSizePixel = 0
    ind.Visible = active
    Instance.new("UICorner", ind).CornerRadius = UDim.new(0, 2)

    local lbl = Instance.new("TextLabel", b)
    lbl.Size = UDim2.new(1, -24, 1, 0)
    lbl.Position = UDim2.new(0, 18, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = active and Colors.Text or Colors.TextDim
    lbl.TextSize = 14
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    return b, ind, lbl
end

local AuthBtn, AuthInd, AuthLbl = MakeBtn("Authentication", 16, true)
local InstrBtn, InstrInd, InstrLbl = MakeBtn("Instructions", 66, false)

-- ========== AUTH PAGE ==========
local AuthPage = Instance.new("Frame", Content)
AuthPage.Size = UDim2.new(1, 0, 1, 0)
AuthPage.BackgroundTransparency = 1

local AuthTitle = Instance.new("TextLabel", AuthPage)
AuthTitle.Size = UDim2.new(1, -40, 0, 28)
AuthTitle.Position = UDim2.new(0, 24, 0, 22)
AuthTitle.BackgroundTransparency = 1
AuthTitle.Text = "Authentication"
AuthTitle.TextColor3 = Colors.Text
AuthTitle.TextSize = 22
AuthTitle.Font = Enum.Font.GothamBold
AuthTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Locked Card
local Locked = Instance.new("Frame", AuthPage)
Locked.Size = UDim2.new(1, -48, 0, 78)
Locked.Position = UDim2.new(0, 24, 0, 64)
Locked.BackgroundColor3 = Colors.Card
Locked.BorderSizePixel = 0
Instance.new("UICorner", Locked).CornerRadius = UDim.new(0, 10)

local LTitle = Instance.new("TextLabel", Locked)
LTitle.Size = UDim2.new(1, -28, 0, 22)
LTitle.Position = UDim2.new(0, 16, 0, 14)
LTitle.BackgroundTransparency = 1
LTitle.Text = "Access Locked"
LTitle.TextColor3 = Colors.Text
LTitle.TextSize = 15
LTitle.Font = Enum.Font.GothamBold
LTitle.TextXAlignment = Enum.TextXAlignment.Left

local LDesc = Instance.new("TextLabel", Locked)
LDesc.Size = UDim2.new(1, -28, 0, 34)
LDesc.Position = UDim2.new(0, 16, 0, 38)
LDesc.BackgroundTransparency = 1
LDesc.Text = "This hub requires you to join our community\nto unlock the rest of the script"
LDesc.TextColor3 = Colors.TextDim
LDesc.TextSize = 13
LDesc.Font = Enum.Font.Gotham
LDesc.TextXAlignment = Enum.TextXAlignment.Left
LDesc.TextYAlignment = Enum.TextYAlignment.Top

-- Copy Button
local CopyBtn = Instance.new("TextButton", AuthPage)
CopyBtn.Size = UDim2.new(1, -48, 0, 56)
CopyBtn.Position = UDim2.new(0, 24, 0, 158)
CopyBtn.BackgroundColor3 = Colors.Card
CopyBtn.BorderSizePixel = 0
CopyBtn.Text = ""
CopyBtn.AutoButtonColor = false
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 10)

local CTitle = Instance.new("TextLabel", CopyBtn)
CTitle.Size = UDim2.new(1, -50, 0, 20)
CTitle.Position = UDim2.new(0, 16, 0, 10)
CTitle.BackgroundTransparency = 1
CTitle.Text = "Copy Access Link"
CTitle.TextColor3 = Colors.Text
CTitle.TextSize = 14
CTitle.Font = Enum.Font.GothamBold
CTitle.TextXAlignment = Enum.TextXAlignment.Left

local CDesc = Instance.new("TextLabel", CopyBtn)
CDesc.Size = UDim2.new(1, -50, 0, 18)
CDesc.Position = UDim2.new(0, 16, 0, 30)
CDesc.BackgroundTransparency = 1
CDesc.Text = "Copies the community link to your clipboard"
CDesc.TextColor3 = Colors.TextMuted
CDesc.TextSize = 12
CDesc.Font = Enum.Font.Gotham
CDesc.TextXAlignment = Enum.TextXAlignment.Left

local Arrow = Instance.new("TextLabel", CopyBtn)
Arrow.Size = UDim2.new(0, 24, 1, 0)
Arrow.Position = UDim2.new(1, -32, 0, 0)
Arrow.BackgroundTransparency = 1
Arrow.Text = "›"
Arrow.TextColor3 = Colors.Accent
Arrow.TextSize = 26
Arrow.Font = Enum.Font.GothamBold

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard(GroupLink)
    StarterGui:SetCore("SendNotification", {
        Title = "Xeno Hub",
        Text = "Link berhasil disalin!",
        Duration = 3
    })
end)

CopyBtn.MouseEnter:Connect(function()
    TweenService:Create(CopyBtn, TweenInfo.new(0.18), {BackgroundColor3 = Colors.CardHover}):Play()
end)
CopyBtn.MouseLeave:Connect(function()
    TweenService:Create(CopyBtn, TweenInfo.new(0.18), {BackgroundColor3 = Colors.Card}):Play()
end)

-- ========== INSTRUCTIONS PAGE ==========
local InstrPage = Instance.new("Frame", Content)
InstrPage.Size = UDim2.new(1, 0, 1, 0)
InstrPage.BackgroundTransparency = 1
InstrPage.Visible = false

local InstrTitle = Instance.new("TextLabel", InstrPage)
InstrTitle.Size = UDim2.new(1, -40, 0, 28)
InstrTitle.Position = UDim2.new(0, 24, 0, 22)
InstrTitle.BackgroundTransparency = 1
InstrTitle.Text = "Instructions"
InstrTitle.TextColor3 = Colors.Text
InstrTitle.TextSize = 22
InstrTitle.Font = Enum.Font.GothamBold
InstrTitle.TextXAlignment = Enum.TextXAlignment.Left

local steps = {
    {"1. Open Browser", "Open your preferred web browser on your device"},
    {"2. Paste Link", "Paste the link you copied from the Authentication tab"},
    {"3. Final Step", "Join the community then re-run the script"}
}

for i, s in ipairs(steps) do
    local box = Instance.new("Frame", InstrPage)
    box.Size = UDim2.new(1, -48, 0, 62)
    box.Position = UDim2.new(0, 24, 0, 64 + (i-1)*72)
    box.BackgroundColor3 = Colors.Card
    box.BorderSizePixel = 0
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)

    local t = Instance.new("TextLabel", box)
    t.Size = UDim2.new(1, -28, 0, 20)
    t.Position = UDim2.new(0, 16, 0, 11)
    t.BackgroundTransparency = 1
    t.Text = s[1]
    t.TextColor3 = Colors.Text
    t.TextSize = 14
    t.Font = Enum.Font.GothamBold
    t.TextXAlignment = Enum.TextXAlignment.Left

    local d = Instance.new("TextLabel", box)
    d.Size = UDim2.new(1, -28, 0, 22)
    d.Position = UDim2.new(0, 16, 0, 32)
    d.BackgroundTransparency = 1
    d.Text = s[2]
    d.TextColor3 = Colors.TextDim
    d.TextSize = 13
    d.Font = Enum.Font.Gotham
    d.TextXAlignment = Enum.TextXAlignment.Left
end

-- Tab Switch
local function Switch(tab)
    local isAuth = tab == "Auth"
    AuthPage.Visible = isAuth
    InstrPage.Visible = not isAuth

    AuthInd.Visible = isAuth
    InstrInd.Visible = not isAuth

    AuthBtn.BackgroundColor3 = isAuth and Color3.fromRGB(32, 30, 48) or Colors.Sidebar
    InstrBtn.BackgroundColor3 = isAuth and Colors.Sidebar or Color3.fromRGB(32, 30, 48)

    AuthLbl.TextColor3 = isAuth and Colors.Text or Colors.TextDim
    InstrLbl.TextColor3 = isAuth and Colors.TextDim or Colors.Text
end

AuthBtn.MouseButton1Click:Connect(function() Switch("Auth") end)
InstrBtn.MouseButton1Click:Connect(function() Switch("Instr") end)

-- Drag
local dragging, dragStart, startPos
TB.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MF.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MF.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
