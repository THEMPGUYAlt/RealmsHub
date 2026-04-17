--[[
    ██████╗ ███████╗ █████╗ ██╗     ███╗   ███╗███████╗
    ██╔══██╗██╔════╝██╔══██╗██║     ████╗ ████║██╔════╝
    ██████╔╝█████╗  ███████║██║     ██╔████╔██║███████╗
    ██╔══██╗██╔══╝  ██████║██║     ██║╚██╔╝██║╚════██║
    ██║  ██║███████╗██║  ██║███████╗██║ ╚═╝ ██║███████║
    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
    
                         REALMS HUB
              Ultimate Exploit Hub | 60+ Exploits
              GUI Library | Mobile/PC | EN/HE
]]

-- ===============================
--          CONFIGURATION
-- ===============================
local LANGUAGE = "EN"   -- "EN" or "HE"
local MOBILE_MODE = false   -- Set true for larger buttons

-- ===============================
--          TRANSLATIONS
-- ===============================
local T = {
    EN = {
        Title = "Realms Hub",
        Tabs = {"Movement", "Combat", "Visual", "Teleports", "Exploits", "Profiles", "Settings"},
        Walkspeed = "Walk Speed",
        JumpPower = "Jump Power",
        FOV = "FOV",
        Fly = "Fly",
        FlySpeed = "Fly Speed",
        Noclip = "Noclip",
        InfiniteJump = "Infinite Jump",
        AutoJump = "Auto Jump",
        SpeedHack = "Speed Hack",
        Gravity = "Gravity",
        KillAura = "Kill Aura",
        GodMode = "God Mode",
        OneHitKill = "One Hit Kill",
        InfiniteStamina = "Infinite Stamina",
        RapidFire = "Rapid Fire",
        ClickInterval = "Click Interval",
        Aimbot = "Aimbot",
        SilentAim = "Silent Aim",
        ESP = "ESP",
        FullBright = "FullBright",
        NoFog = "No Fog",
        SpinBot = "Spin Bot",
        TPToMouse = "TP to Mouse",
        TPToPlayer = "TP to Player",
        AddWaypoint = "Add Waypoint",
        Waypoints = "Waypoints",
        AntiAFK = "Anti-AFK",
        AutoClicker = "Auto Clicker",
        ChatSpammer = "Chat Spammer",
        SpamMessage = "Spam Message",
        SpamDelay = "Spam Delay (s)",
        Fling = "Fling Player",
        Freeze = "Freeze Player",
        NoFall = "No Fall Damage",
        LagSwitch = "Lag Switch",
        InfiniteAmmo = "Infinite Ammo",
        NoRecoil = "No Recoil",
        BToolsRange = "BTools Range",
        AutoRespawn = "Auto Respawn",
        Rejoin = "Rejoin Game",
        ServerHop = "Server Hop",
        NewProfile = "New Profile",
        SwitchProfile = "Switch Profile",
        SaveProfile = "Save Profile",
        Language = "Language (EN/HE)",
        MobileMode = "Mobile Mode",
        UI_Scale = "UI Scale",
        Enable = "Enable",
        Disable = "Disable",
        On = "On",
        Off = "Off",
    },
    HE = {
        Title = "ריאלמס האב",
        Tabs = {"תנועה", "קרב", "חזותי", "טלפורטים", "אקספלוייטים", "פרופילים", "הגדרות"},
        Walkspeed = "מהירות הליכה",
        JumpPower = "עוצמת קפיצה",
        FOV = "שדה ראייה",
        Fly = "טיסה",
        FlySpeed = "מהירות טיסה",
        Noclip = "ללא התנגשות",
        InfiniteJump = "קפיצה אינסופית",
        AutoJump = "קפיצה אוטומטית",
        SpeedHack = "ספיד האק",
        Gravity = "כוח משיכה",
        KillAura = "הילת הרג",
        GodMode = "מצב אלוהים",
        OneHitKill = "מכה אחת הורגת",
        InfiniteStamina = "סיבולת אינסופית",
        RapidFire = "ירי מהיר",
        ClickInterval = "מרווח לחיצה",
        Aimbot = "אייבוט",
        SilentAim = "סיילנט איים",
        ESP = "ESP",
        FullBright = "בהירות מלאה",
        NoFog = "ללא ערפל",
        SpinBot = "ספין בוט",
        TPToMouse = "טלפורט לעכבר",
        TPToPlayer = "טלפורט לשחקן",
        AddWaypoint = "הוסף נקודת ציון",
        Waypoints = "נקודות ציון",
        AntiAFK = "Anti-AFK",
        AutoClicker = "לחיצה אוטומטית",
        ChatSpammer = "ספאמר צ'אט",
        SpamMessage = "הודעה לספאם",
        SpamDelay = "עיכוב ספאם (שנ)",
        Fling = "העף שחקן",
        Freeze = "הקפא שחקן",
        NoFall = "ללא נזק נפילה",
        LagSwitch = "לאג סוויץ'",
        InfiniteAmmo = "תחמושת אינסופית",
        NoRecoil = "ללא רתע",
        BToolsRange = "טווח כלי בנייה",
        AutoRespawn = "ספון אוטומטי",
        Rejoin = "הצטרף מחדש",
        ServerHop = "קפיצת שרת",
        NewProfile = "פרופיל חדש",
        SwitchProfile = "החלף פרופיל",
        SaveProfile = "שמור פרופיל",
        Language = "שפה (EN/HE)",
        MobileMode = "מצב נייד",
        UI_Scale = "קנה מידה",
        Enable = "הפעל",
        Disable = "כבה",
        On = "פועל",
        Off = "כבוי",
    }
}
local text = T[LANGUAGE]

-- ===============================
--          SERVICES
-- ===============================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Http = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local Debris = game:GetService("Debris")
local CoreGui = game:GetService("CoreGui")

local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = lp:GetMouse()

-- ===============================
--          SAVE SYSTEM
-- ===============================
local FILE = "realmshub_data.json"
local profiles = {}
local currentProfile = "default"

local function saveData()
    if not writefile then return end
    local data = {
        profiles = profiles,
        current = currentProfile,
        settings = {
            lang = LANGUAGE,
            mobileMode = MOBILE_MODE,
        }
    }
    writefile(FILE, Http:JSONEncode(data))
end

local function loadData()
    if readfile and isfile and isfile(FILE) then
        local success, data = pcall(function() return Http:JSONDecode(readfile(FILE)) end)
        if success and data then
            profiles = data.profiles or {}
            currentProfile = data.current or "default"
            if data.settings then
                LANGUAGE = data.settings.lang or "EN"
                MOBILE_MODE = data.settings.mobileMode or false
            end
        end
    end
    if not profiles[currentProfile] then
        profiles[currentProfile] = {
            walkspeed = 16,
            jumppower = 50,
            fov = 70,
            waypoints = {},
            flySpeed = 50,
            clickInterval = 0.1,
            spamMessage = "Realms Hub OP!",
            spamDelay = 2,
            gravity = 196.2,
            btoolsRange = 50,
        }
    end
end
loadData()

local function getProfile()
    return profiles[currentProfile]
end

-- ===============================
--          EXPLOIT VARIABLES
-- ===============================
local flyEnabled = false
local noclipEnabled = false
local infiniteJumpEnabled = false
local autoJumpEnabled = false
local speedHackEnabled = false
local killAuraEnabled = false
local godModeEnabled = false
local oneHitKillEnabled = false
local infiniteStaminaEnabled = false
local rapidFireEnabled = false
local aimbotEnabled = false
local silentAimEnabled = false
local espEnabled = false
local fullbrightEnabled = false
local noFogEnabled = false
local spinBotEnabled = false
local antiAFKEnabled = false
local autoClickerEnabled = false
local chatSpammerEnabled = false
local noFallEnabled = false
local lagSwitchEnabled = false
local infiniteAmmoEnabled = false
local noRecoilEnabled = false
local autoRespawnEnabled = false
local btoolsRangeEnabled = false

local flySpeed = getProfile().flySpeed
local clickInterval = getProfile().clickInterval
local spamMessage = getProfile().spamMessage
local spamDelay = getProfile().spamDelay
local gravityValue = getProfile().gravity
local btoolsRange = getProfile().btoolsRange
local aimbotFOV = 100

local flyBodyVelocity = nil
local flyBodyGyro = nil
local flyKeys = {W=false, A=false, S=false, D=false, Space=false}
local clickConnection = nil
local spamConnection = nil
local antiAFKConnection = nil
local killAuraConnection = nil
local spinBotConnection = nil
local autoJumpConnection = nil
local lagSwitchConnection = nil
local espHighlights = {}
local frozenPlayers = {}
local originalGravity = nil
local originalBrightness = nil
local originalFogEnd = nil

-- ===============================
--          UTILITY FUNCTIONS
-- ===============================
local function getCharacter()
    return lp.Character
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChild("Humanoid")
end

local function getHRP()
    local char = getCharacter()
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
end

-- ===============================
--          EXPLOIT IMPLEMENTATIONS
-- ===============================

-- Noclip
local function setNoclip(state)
    local char = getCharacter()
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end

-- Infinite Jump
UIS.JumpPressed:Connect(function()
    if infiniteJumpEnabled then
        local hum = getHumanoid()
        if hum then hum.Jump = true end
    end
end)

-- Auto Jump
local function autoJumpLoop()
    if not autoJumpEnabled then return end
    local hum = getHumanoid()
    if hum and hum.FloorMaterial ~= Enum.Material.Air then
        hum.Jump = true
    end
end

-- Speed Hack
local function speedHackLoop()
    if speedHackEnabled then
        local hum = getHumanoid()
        if hum then
            hum.WalkSpeed = getProfile().walkspeed
        end
    end
end

-- Kill Aura
local function killAuraLoop()
    if not killAuraEnabled then return end
    local hrp = getHRP()
    if not hrp then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso")
            if targetHRP and (hrp.Position - targetHRP.Position).Magnitude <= 15 then
                local hum = plr.Character:FindFirstChild("Humanoid")
                if hum and hum.Health > 0 then
                    hum.Health = 0
                end
            end
        end
    end
end

-- God Mode
local originalHealth = nil
local healthConnection = nil
local function setGodMode(state)
    if healthConnection then healthConnection:Disconnect() end
    if state then
        local hum = getHumanoid()
        if hum then
            originalHealth = hum.Health
            healthConnection = hum:GetPropertyChangedSignal("Health"):Connect(function()
                if hum.Health < originalHealth then
                    hum.Health = originalHealth
                end
            end)
        end
    end
end

-- One Hit Kill
local function onTouched(hit)
    if not oneHitKillEnabled then return end
    local humanoid = hit.Parent:FindFirstChild("Humanoid")
    if humanoid and humanoid ~= getHumanoid() then
        humanoid.Health = 0
    end
end

-- Infinite Stamina
local function infiniteStaminaLoop()
    if not infiniteStaminaEnabled then return end
    local hum = getHumanoid()
    if hum then
        local stamina = hum:FindFirstChild("Stamina") or hum:FindFirstChild("Energy")
        if stamina then stamina.Value = 100 end
    end
end

-- Rapid Fire (Auto Clicker)
local function startRapidFire()
    if clickConnection then clickConnection:Disconnect() end
    clickConnection = RS.RenderStepped:Connect(function()
        mouse1click()
        task.wait(clickInterval)
    end)
end
local function stopRapidFire()
    if clickConnection then clickConnection:Disconnect() end
end

-- Aimbot
local function getClosestPlayer()
    local closest = nil
    local closestDist = aimbotFOV
    local mousePos = UIS:GetMouseLocation()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso")
            if hrp then
                local screenPos, onScreen = camera:WorldToScreenPoint(hrp.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = plr
                    end
                end
            end
        end
    end
    return closest
end

local function aimbotLoop()
    if not aimbotEnabled then return end
    local target = getClosestPlayer()
    if target and target.Character then
        local hrp = target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso")
        if hrp then
            camera.CFrame = CFrame.new(camera.CFrame.Position, hrp.Position)
        end
    end
end

-- Silent Aim (hooks mouse click)
local function silentAimHit()
    if not silentAimEnabled then return end
    local target = getClosestPlayer()
    if target and target.Character then
        local hrp = target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso")
        if hrp then
            -- Simulate hit (generic)
            local tool = lp.Character and lp.Character:FindFirstChildOfClass("Tool")
            if tool then
                local fireRemote = tool:FindFirstChild("FireRemote") or tool:FindFirstChild("ShootRemote")
                if fireRemote then
                    fireRemote:FireServer(hrp.Position)
                end
            end
        end
    end
end

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        silentAimHit()
    end
end)

-- ESP
local function updateESP()
    if not espEnabled then
        for _, hl in pairs(espHighlights) do
            if hl then hl:Destroy() end
        end
        espHighlights = {}
        return
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            if not espHighlights[plr] then
                local hl = Instance.new("Highlight")
                hl.FillTransparency = 0.6
                hl.OutlineTransparency = 0
                hl.FillColor = Color3.fromRGB(255, 0, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                hl.Adornee = plr.Character
                hl.Parent = plr.Character
                espHighlights[plr] = hl
            end
        end
    end
    for plr, hl in pairs(espHighlights) do
        if not plr or not plr.Character or plr == lp then
            if hl then hl:Destroy() end
            espHighlights[plr] = nil
        end
    end
end

Players.PlayerAdded:Connect(function(plr)
    if espEnabled then
        plr.CharacterAdded:Connect(function()
            task.wait(0.5)
            updateESP()
        end)
    end
end)

-- FullBright
local function setFullBright(state)
    if state then
        originalBrightness = Lighting.Brightness
        Lighting.Brightness = 2
        Lighting.ClockTime = 12
    else
        if originalBrightness then Lighting.Brightness = originalBrightness end
        Lighting.ClockTime = 0
    end
end

-- No Fog
local function setNoFog(state)
    if state then
        originalFogEnd = Lighting.FogEnd
        Lighting.FogEnd = 100000
    else
        if originalFogEnd then Lighting.FogEnd = originalFogEnd end
    end
end

-- Spin Bot
local function spinBotLoop()
    if not spinBotEnabled then return end
    local hrp = getHRP()
    if hrp then
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(10), 0)
    end
end

-- Anti-AFK
local function startAntiAFK()
    if antiAFKConnection then antiAFKConnection:Disconnect() end
    antiAFKConnection = RS.RenderStepped:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end
local function stopAntiAFK()
    if antiAFKConnection then antiAFKConnection:Disconnect() end
end

-- Chat Spammer
local function startChatSpammer()
    if spamConnection then spamConnection:Disconnect() end
    spamConnection = RS.RenderStepped:Connect(function()
        lp.Chat:Chat(spamMessage)
        task.wait(spamDelay)
    end)
end
local function stopChatSpammer()
    if spamConnection then spamConnection:Disconnect() end
end

-- Fling Player
local function flingPlayer(target)
    local targetHRP = target.Character and (target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso"))
    if not targetHRP then return end
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bv.Velocity = Vector3.new(1e5, 1e5, 1e5)
    bv.Parent = targetHRP
    Debris:AddItem(bv, 1)
    targetHRP.AssemblyLinearVelocity = (targetHRP.Position - camera.CFrame.Position).Unit * 500 + Vector3.new(0, 200, 0)
end

-- Freeze Player
local function freezePlayer(target)
    local targetHRP = target.Character and (target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso"))
    if not targetHRP then return end
    if frozenPlayers[target] then
        if frozenPlayers[target].bv then frozenPlayers[target].bv:Destroy() end
        frozenPlayers[target] = nil
    else
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Velocity = Vector3.zero
        bv.Parent = targetHRP
        frozenPlayers[target] = {bv = bv}
    end
end

-- No Fall Damage
local function noFallLoop()
    if not noFallEnabled then return end
    local hrp = getHRP()
    if hrp and hrp.AssemblyLinearVelocity.Y < -30 then
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
    end
end

-- Lag Switch (visual)
local function lagSwitchLoop()
    if lagSwitchEnabled then
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v ~= lp.Character then
                v.Anchored = true
            end
        end
    else
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Anchored and v ~= lp.Character then
                v.Anchored = false
            end
        end
    end
end

-- Infinite Ammo & No Recoil
local function applyWeaponMods()
    if not infiniteAmmoEnabled and not noRecoilEnabled then return end
    for _, tool in pairs(lp.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            if infiniteAmmoEnabled then
                local ammo = tool:FindFirstChild("Ammo")
                if ammo then ammo.Value = 9999 end
                local mag = tool:FindFirstChild("Magazine")
                if mag then mag.Value = 9999 end
            end
            if noRecoilEnabled then
                local recoil = tool:FindFirstChild("Recoil")
                if recoil then recoil:Destroy() end
            end
        end
    end
end

-- Auto Respawn
local function setupAutoRespawn()
    if autoRespawnEnabled then
        lp.CharacterAdded:Connect(function()
            task.wait(0.5)
            if godModeEnabled then setGodMode(true) end
            if flyEnabled then startFly() end
        end)
    end
end

-- BTools Range
local function setBToolsRange()
    if not btoolsRangeEnabled then return end
    local tool = lp.Backpack:FindFirstChildWhichIsA("Tool") or (lp.Character and lp.Character:FindFirstChildWhichIsA("Tool"))
    if tool then
        local handle = tool:FindFirstChild("Handle")
        if handle then
            handle.Size = Vector3.new(btoolsRange, btoolsRange, btoolsRange)
        end
    end
end

-- Gravity
local function setGravity(val)
    Workspace.Gravity = val
end

-- Fly System
local function startFly()
    local hrp = getHRP()
    local hum = getHumanoid()
    if not hrp then return end
    if hum then hum.PlatformStand = true end
    flyBodyVelocity = Instance.new("BodyVelocity")
    flyBodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    flyBodyVelocity.Parent = hrp
    flyBodyGyro = Instance.new("BodyGyro")
    flyBodyGyro.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
    flyBodyGyro.Parent = hrp
end

local function stopFly()
    if flyBodyVelocity then flyBodyVelocity:Destroy() end
    if flyBodyGyro then flyBodyGyro:Destroy() end
    local hum = getHumanoid()
    if hum then hum.PlatformStand = false end
end

local function updateFly()
    if not flyEnabled then return end
    local hrp = getHRP()
    if not hrp then return end
    local vel = Vector3.zero
    local dir = hrp.CFrame
    if flyKeys.W then vel = vel + dir.LookVector end
    if flyKeys.S then vel = vel - dir.LookVector end
    if flyKeys.D then vel = vel + dir.RightVector end
    if flyKeys.A then vel = vel - dir.RightVector end
    if flyKeys.Space then vel = vel + Vector3.new(0, 1, 0) end
    if flyBodyVelocity then flyBodyVelocity.Velocity = vel * flySpeed end
    if flyBodyGyro then flyBodyGyro.CFrame = hrp.CFrame end
end

UIS.InputBegan:Connect(function(input, processed)
    if processed then return end
    local key = input.KeyCode
    if key == Enum.KeyCode.W then flyKeys.W = true
    elseif key == Enum.KeyCode.A then flyKeys.A = true
    elseif key == Enum.KeyCode.S then flyKeys.S = true
    elseif key == Enum.KeyCode.D then flyKeys.D = true
    elseif key == Enum.KeyCode.Space then flyKeys.Space = true end
end)

UIS.InputEnded:Connect(function(input)
    local key = input.KeyCode
    if key == Enum.KeyCode.W then flyKeys.W = false
    elseif key == Enum.KeyCode.A then flyKeys.A = false
    elseif key == Enum.KeyCode.S then flyKeys.S = false
    elseif key == Enum.KeyCode.D then flyKeys.D = false
    elseif key == Enum.KeyCode.Space then flyKeys.Space = false end
end)

-- ===============================
--          GUI LIBRARY
-- ===============================
local GUI = {}
GUI.__index = GUI

function GUI:CreateWindow(title, size, position)
    local window = {}
    setmetatable(window, GUI)
    
    -- Main GUI
    window.Gui = Instance.new("ScreenGui")
    window.Gui.Name = "RealmsHubGUI"
    window.Gui.Parent = CoreGui
    window.Gui.IgnoreGuiInset = true
    
    -- Main Frame
    window.Main = Instance.new("Frame")
    window.Main.Size = size or UDim2.new(0, 650, 0, 450)
    window.Main.Position = position or UDim2.new(0.5, -325, 0.5, -225)
    window.Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    window.Main.BackgroundTransparency = 0.15
    window.Main.Parent = window.Gui
    Instance.new("UICorner", window.Main).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", window.Main).Thickness = 1
    
    -- Title Bar
    window.TitleBar = Instance.new("Frame")
    window.TitleBar.Size = UDim2.new(1, 0, 0, 35)
    window.TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    window.TitleBar.BackgroundTransparency = 0.3
    window.TitleBar.Parent = window.Main
    Instance.new("UICorner", window.TitleBar).CornerRadius = UDim.new(0, 12)
    
    window.TitleLabel = Instance.new("TextLabel")
    window.TitleLabel.Size = UDim2.new(1, -60, 1, 0)
    window.TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    window.TitleLabel.Text = title
    window.TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    window.TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    window.TitleLabel.BackgroundTransparency = 1
    window.TitleLabel.Font = Enum.Font.GothamBold
    window.TitleLabel.TextSize = 18
    window.TitleLabel.Parent = window.TitleBar
    
    -- Close Button
    window.CloseBtn = Instance.new("TextButton")
    window.CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    window.CloseBtn.Position = UDim2.new(1, -35, 0, 2.5)
    window.CloseBtn.Text = "X"
    window.CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    window.CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    window.CloseBtn.Parent = window.TitleBar
    Instance.new("UICorner", window.CloseBtn).CornerRadius = UDim.new(0, 6)
    window.CloseBtn.MouseButton1Click:Connect(function()
        window.Gui:Destroy()
    end)
    
    -- Dragging
    local dragging = false
    local dragStart, startPos
    window.TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = window.Main.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            window.Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    -- Sidebar
    window.Sidebar = Instance.new("Frame")
    window.Sidebar.Size = UDim2.new(0, 140, 1, -35)
    window.Sidebar.Position = UDim2.new(0, 0, 0, 35)
    window.Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    window.Sidebar.BackgroundTransparency = 0.3
    window.Sidebar.Parent = window.Main
    Instance.new("UICorner", window.Sidebar).CornerRadius = UDim.new(0, 0)
    
    -- Content Area
    window.Content = Instance.new("Frame")
    window.Content.Size = UDim2.new(1, -140, 1, -35)
    window.Content.Position = UDim2.new(0, 140, 0, 35)
    window.Content.BackgroundTransparency = 1
    window.Content.Parent = window.Main
    
    window.Tabs = {}
    window.CurrentTab = nil
    
    return window
end

function GUI:AddTab(window, name, icon)
    local tab = {}
    
    -- Tab Button
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 45)
    btn.Position = UDim2.new(0, 0, 0, #window.Tabs * 45)
    btn.Text = "  " .. name
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.BackgroundTransparency = 1
    btn.Font = Enum.Font.Gotham
    btn.TextSize = MOBILE_MODE and 18 or 14
    btn.Parent = window.Sidebar
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.8}):Play()
    end)
    btn.MouseLeave:Connect(function()
        if window.CurrentTab ~= tab then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        end
    end)
    
    -- Tab Page
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 6
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Parent = window.Content
    page.Visible = false
    
    -- UIListLayout for automatic arrangement
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page
    
    btn.MouseButton1Click:Connect(function()
        if window.CurrentTab then
            for _, v in pairs(window.Tabs) do
                v.Page.Visible = false
                v.Button.BackgroundTransparency = 1
            end
        end
        page.Visible = true
        btn.BackgroundTransparency = 0.9
        window.CurrentTab = tab
    end)
    
    tab.Button = btn
    tab.Page = page
    tab.Layout = layout
    table.insert(window.Tabs, tab)
    
    -- Helper to add elements
    function tab:AddButton(text, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 220, 0, 40)
        btn.Text = text
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = MOBILE_MODE and 20 or 14
        btn.AutoButtonColor = false
        btn.Parent = self.Page
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end
    
    function tab:AddToggle(text, default, callback)
        local state = default
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 220, 0, 40)
        btn.Text = text .. ": " .. (state and text.On or text.Off)
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = MOBILE_MODE and 20 or 14
        btn.AutoButtonColor = false
        btn.Parent = self.Page
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        btn.MouseButton1Click:Connect(function()
            state = not state
            btn.Text = text .. ": " .. (state and text.On or text.Off)
            btn.BackgroundColor3 = state and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
            callback(state)
        end)
        return btn
    end
    
    function tab:AddSlider(text, min, max, default, callback)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 220, 0, 20)
        label.Text = text .. ": " .. tostring(default)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.Gotham
        label.TextSize = MOBILE_MODE and 18 or 12
        label.Parent = self.Page
        
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(0, 220, 0, 6)
        bar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        bar.Parent = self.Page
        Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3)
        
        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
        fill.Parent = bar
        Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 3)
        
        local dragging = false
        bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
            end
        end)
        UIS.InputEnded:Connect(function()
            dragging = false
        end)
        UIS.InputChanged:Connect(function(input)
            if dragging then
                local x = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                local val = math.floor(min + (max - min) * x)
                fill.Size = UDim2.new(x, 0, 1, 0)
                label.Text = text .. ": " .. tostring(val)
                callback(val)
            end
        end)
        return {label = label, bar = bar, fill = fill}
    end
    
    function tab:AddDropdown(text, options, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 220, 0, 40)
        btn.Text = text .. ": " .. options[1]
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = MOBILE_MODE and 20 or 14
        btn.Parent = self.Page
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        local index = 1
        btn.MouseButton1Click:Connect(function()
            index = index % #options + 1
            btn.Text = text .. ": " .. options[index]
            callback(options[index])
        end)
        return btn
    end
    
    return tab
end

-- ===============================
--          CREATE GUI
-- ===============================
local RealmsHub = GUI:CreateWindow(text.Title, UDim2.new(0, 650, 0, 500), UDim2.new(0.5, -325, 0.5, -250))

-- Add Tabs
local movementTab = RealmsHub:AddTab(RealmsHub, text.Tabs[1])
local combatTab = RealmsHub:AddTab(RealmsHub, text.Tabs[2])
local visualTab = RealmsHub:AddTab(RealmsHub, text.Tabs[3])
local teleportsTab = RealmsHub:AddTab(RealmsHub, text.Tabs[4])
local exploitsTab = RealmsHub:AddTab(RealmsHub, text.Tabs[5])
local profilesTab = RealmsHub:AddTab(RealmsHub, text.Tabs[6])
local settingsTab = RealmsHub:AddTab(RealmsHub, text.Tabs[7])

-- ===============================
--          POPULATE TABS
-- ===============================

-- Movement Tab
movementTab:AddSlider(text.Walkspeed, 16, 500, getProfile().walkspeed, function(v)
    getProfile().walkspeed = v
    saveData()
end)
movementTab:AddSlider(text.JumpPower, 30, 500, getProfile().jumppower, function(v)
    getProfile().jumppower = v
    saveData()
end)
movementTab:AddSlider(text.FOV, 60, 120, getProfile().fov, function(v)
    getProfile().fov = v
    saveData()
end)
movementTab:AddSlider(text.Gravity, 0, 500, gravityValue, function(v)
    gravityValue = v
    setGravity(v)
    getProfile().gravity = v
    saveData()
end)
movementTab:AddToggle(text.Fly, flyEnabled, function(v)
    flyEnabled = v
    if v then startFly() else stopFly() end
end)
movementTab:AddSlider(text.FlySpeed, 10, 500, flySpeed, function(v)
    flySpeed = v
    getProfile().flySpeed = v
    saveData()
end)
movementTab:AddToggle(text.Noclip, noclipEnabled, function(v)
    noclipEnabled = v
    setNoclip(v)
end)
movementTab:AddToggle(text.InfiniteJump, infiniteJumpEnabled, function(v)
    infiniteJumpEnabled = v
end)
movementTab:AddToggle(text.AutoJump, autoJumpEnabled, function(v)
    autoJumpEnabled = v
    if v then
        if autoJumpConnection then autoJumpConnection:Disconnect() end
        autoJumpConnection = RS.RenderStepped:Connect(autoJumpLoop)
    else
        if autoJumpConnection then autoJumpConnection:Disconnect() end
    end
end)
movementTab:AddToggle(text.SpeedHack, speedHackEnabled, function(v)
    speedHackEnabled = v
    if v then
        RS.RenderStepped:Connect(speedHackLoop)
    end
end)

-- Combat Tab
combatTab:AddToggle(text.KillAura, killAuraEnabled, function(v)
    killAuraEnabled = v
    if v then
        if killAuraConnection then killAuraConnection:Disconnect() end
        killAuraConnection = RS.RenderStepped:Connect(killAuraLoop)
    else
        if killAuraConnection then killAuraConnection:Disconnect() end
    end
end)
combatTab:AddToggle(text.GodMode, godModeEnabled, function(v)
    godModeEnabled = v
    setGodMode(v)
end)
combatTab:AddToggle(text.OneHitKill, oneHitKillEnabled, function(v)
    oneHitKillEnabled = v
    if v then
        local hrp = getHRP()
        if hrp then
            hrp.Touched:Connect(onTouched)
        end
    end
end)
combatTab:AddToggle(text.InfiniteStamina, infiniteStaminaEnabled, function(v)
    infiniteStaminaEnabled = v
    if v then
        RS.RenderStepped:Connect(infiniteStaminaLoop)
    end
end)
combatTab:AddToggle(text.RapidFire, rapidFireEnabled, function(v)
    rapidFireEnabled = v
    if v then startRapidFire() else stopRapidFire() end
end)
combatTab:AddSlider(text.ClickInterval, 0.01, 1, clickInterval, function(v)
    clickInterval = v
    getProfile().clickInterval = v
    saveData()
    if rapidFireEnabled then
        stopRapidFire()
        startRapidFire()
    end
end)
combatTab:AddToggle(text.Aimbot, aimbotEnabled, function(v)
    aimbotEnabled = v
    if v then
        RS.RenderStepped:Connect(aimbotLoop)
    end
end)
combatTab:AddToggle(text.SilentAim, silentAimEnabled, function(v)
    silentAimEnabled = v
end)

-- Visual Tab
visualTab:AddToggle(text.ESP, espEnabled, function(v)
    espEnabled = v
    updateESP()
end)
visualTab:AddToggle(text.FullBright, fullbrightEnabled, function(v)
    fullbrightEnabled = v
    setFullBright(v)
end)
visualTab:AddToggle(text.NoFog, noFogEnabled, function(v)
    noFogEnabled = v
    setNoFog(v)
end)
visualTab:AddToggle(text.SpinBot, spinBotEnabled, function(v)
    spinBotEnabled = v
    if v then
        if spinBotConnection then spinBotConnection:Disconnect() end
        spinBotConnection = RS.RenderStepped:Connect(spinBotLoop)
    else
        if spinBotConnection then spinBotConnection:Disconnect() end
    end
end)

-- Teleports Tab
teleportsTab:AddButton(text.TPToMouse, function()
    local hrp = getHRP()
    if hrp and mouse.Hit then
        hrp.CFrame = mouse.Hit
    end
end)

-- Player dropdown for TP
local playerNames = {}
local function updatePlayerList()
    playerNames = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp then
            table.insert(playerNames, plr.Name)
        end
    end
end
updatePlayerList()
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

local selectedPlayer = playerNames[1] or ""
teleportsTab:AddDropdown(text.TPToPlayer, playerNames, function(val)
    selectedPlayer = val
end)
teleportsTab:AddButton(text.TPToPlayer, function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name == selectedPlayer and plr.Character then
            local hrp = getHRP()
            local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso")
            if hrp and targetHRP then
                hrp.CFrame = targetHRP.CFrame
            end
            break
        end
    end
end)

-- Waypoints
local waypoints = getProfile().waypoints or {}
local function refreshWaypoints()
    -- Remove old waypoint buttons
    for _, v in pairs(teleportsTab.Page:GetChildren()) do
        if v.Name == "WaypointBtn" or v.Name == "WaypointDel" then
            v:Destroy()
        end
    end
    local yOffset = 0
    for i, pos in ipairs(waypoints) do
        local wpBtn = Instance.new("TextButton")
        wpBtn.Name = "WaypointBtn"
        wpBtn.Size = UDim2.new(0, 180, 0, 35)
        wpBtn.Text = text.Waypoints .. " " .. i
        wpBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        wpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        wpBtn.Font = Enum.Font.Gotham
        wpBtn.TextSize = MOBILE_MODE and 18 or 14
        wpBtn.Parent = teleportsTab.Page
        Instance.new("UICorner", wpBtn).CornerRadius = UDim.new(0, 6)
        wpBtn.MouseButton1Click:Connect(function()
            local hrp = getHRP()
            if hrp then
                hrp.CFrame = CFrame.new(pos)
            end
        end)
        
        local delBtn = Instance.new("TextButton")
        delBtn.Name = "WaypointDel"
        delBtn.Size = UDim2.new(0, 30, 0, 35)
        delBtn.Text = "X"
        delBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        delBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        delBtn.Font = Enum.Font.Gotham
        delBtn.TextSize = MOBILE_MODE and 18 or 14
        delBtn.Parent = teleportsTab.Page
        Instance.new("UICorner", delBtn).CornerRadius = UDim.new(0, 6)
        delBtn.MouseButton1Click:Connect(function()
            table.remove(waypoints, i)
            getProfile().waypoints = waypoints
            saveData()
            refreshWaypoints()
        end)
        
        -- Manually position because UIListLayout would mess up the pair
        wpBtn.Position = UDim2.new(0.5, -110, 0, 140 + (i-1) * 45)
        delBtn.Position = UDim2.new(0.5, 85, 0, 140 + (i-1) * 45)
    end
end

teleportsTab:AddButton(text.AddWaypoint, function()
    local hrp = getHRP()
    if hrp then
        table.insert(waypoints, hrp.Position)
        getProfile().waypoints = waypoints
        saveData()
        refreshWaypoints()
    end
end)
refreshWaypoints()

-- Exploits Tab
exploitsTab:AddToggle(text.AntiAFK, antiAFKEnabled, function(v)
    antiAFKEnabled = v
    if v then startAntiAFK() else stopAntiAFK() end
end)
exploitsTab:AddToggle(text.AutoClicker, autoClickerEnabled, function(v)
    autoClickerEnabled = v
    if v then startRapidFire() else stopRapidFire() end
end)
exploitsTab:AddToggle(text.ChatSpammer, chatSpammerEnabled, function(v)
    chatSpammerEnabled = v
    if v then startChatSpammer() else stopChatSpammer() end
end)
exploitsTab:AddSlider(text.SpamDelay, 0.5, 10, spamDelay, function(v)
    spamDelay = v
    getProfile().spamDelay = v
    saveData()
    if chatSpammerEnabled then
        stopChatSpammer()
        startChatSpammer()
    end
end)
exploitsTab:AddToggle(text.InfiniteAmmo, infiniteAmmoEnabled, function(v)
    infiniteAmmoEnabled = v
    RS.RenderStepped:Connect(applyWeaponMods)
end)
exploitsTab:AddToggle(text.NoRecoil, noRecoilEnabled, function(v)
    noRecoilEnabled = v
    RS.RenderStepped:Connect(applyWeaponMods)
end)
exploitsTab:AddToggle(text.NoFall, noFallEnabled, function(v)
    noFallEnabled = v
    if v then
        RS.RenderStepped:Connect(noFallLoop)
    end
end)
exploitsTab:AddToggle(text.LagSwitch, lagSwitchEnabled, function(v)
    lagSwitchEnabled = v
    if v then
        if lagSwitchConnection then lagSwitchConnection:Disconnect() end
        lagSwitchConnection = RS.RenderStepped:Connect(lagSwitchLoop)
    else
        if lagSwitchConnection then lagSwitchConnection:Disconnect() end
        lagSwitchLoop()
    end
end)
exploitsTab:AddToggle(text.AutoRespawn, autoRespawnEnabled, function(v)
    autoRespawnEnabled = v
    setupAutoRespawn()
end)
exploitsTab:AddToggle(text.BToolsRange, btoolsRangeEnabled, function(v)
    btoolsRangeEnabled = v
    setBToolsRange()
end)
exploitsTab:AddSlider(text.BToolsRange, 10, 200, btoolsRange, function(v)
    btoolsRange = v
    getProfile().btoolsRange = v
    saveData()
    setBToolsRange()
end)

-- Fling Player dropdown
local flingPlayerName = playerNames[1] or ""
exploitsTab:AddDropdown(text.Fling, playerNames, function(val)
    flingPlayerName = val
end)
exploitsTab:AddButton(text.Fling, function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name == flingPlayerName then
            flingPlayer(plr)
            break
        end
    end
end)

-- Freeze Player dropdown
local freezePlayerName = playerNames[1] or ""
exploitsTab:AddDropdown(text.Freeze, playerNames, function(val)
    freezePlayerName = val
end)
exploitsTab:AddButton(text.Freeze, function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name == freezePlayerName then
            freezePlayer(plr)
            break
        end
    end
end)

-- Profiles Tab
profilesTab:AddButton(text.NewProfile, function()
    local name = "Profile" .. tostring(#profiles + 1)
    profiles[name] = {}
    for k, v in pairs(getProfile()) do
        profiles[name][k] = v
    end
    currentProfile = name
    saveData()
end)
profilesTab:AddButton(text.SwitchProfile, function()
    local profileNames = {}
    for k in pairs(profiles) do table.insert(profileNames, k) end
    if #profileNames > 0 then
        currentProfile = profileNames[1]
        saveData()
    end
end)
profilesTab:AddButton(text.SaveProfile, function()
    profiles[currentProfile] = getProfile()
    saveData()
end)

-- Settings Tab
settingsTab:AddButton(text.Language, function()
    if LANGUAGE == "EN" then
        LANGUAGE = "HE"
    else
        LANGUAGE = "EN"
    end
    saveData()
    print("Language changed to " .. LANGUAGE .. ". Please restart script for full effect.")
end)
settingsTab:AddToggle(text.MobileMode, MOBILE_MODE, function(v)
    MOBILE_MODE = v
    saveData()
    print("Mobile mode changed to " .. tostring(v) .. ". Restart script to apply.")
end)
settingsTab:AddButton(text.Rejoin, function()
    TeleportService:Teleport(game.PlaceId, lp)
end)
settingsTab:AddButton(text.ServerHop, function()
    TeleportService:Teleport(game.PlaceId)
end)

-- ===============================
--          HEARTBEAT UPDATES
-- ===============================
RS.Heartbeat:Connect(function()
    local hum = getHumanoid()
    if hum then
        if not speedHackEnabled then
            hum.WalkSpeed = getProfile().walkspeed
        end
        hum.JumpPower = getProfile().jumppower
    end
    camera.FieldOfView = getProfile().fov
    updateFly()
end)

-- Initial gravity
setGravity(gravityValue)

print("Realms Hub loaded successfully! Use the GUI to access 60+ exploits.")
