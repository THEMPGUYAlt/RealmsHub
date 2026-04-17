--[[
    ██████╗ ███████╗ █████╗ ██╗     ███╗   ███╗███████╗
    ██╔══██╗██╔════╝██╔══██╗██║     ████╗ ████║██╔════╝
    ██████╔╝█████╗  ███████║██║     ██╔████╔██║███████╗
    ██╔══██╗██╔══╝  ██████║██║     ██║╚██╔╝██║╚════██║
    ██║  ██║███████╗██║  ██║███████╗██║ ╚═╝ ██║███████║
    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
    
                         REALMS HUB
              Ultimate Exploit Hub | 60+ Exploits
              Mobile Support | Multiple Languages Support
]]

-- ===============================
--          LOAD LIBRARIES
-- ===============================
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- ===============================
--          LANGUAGE SYSTEM
-- ===============================
local Languages = {
    EN = {
        WindowTitle = "Realms Hub",
        Tabs = {"Movement", "Combat", "Visual", "Teleports", "Exploits", "Settings"},
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
        SpamDelay = "Spam Delay (s)",
        Fling = "Fling Player",
        Freeze = "Freeze Player",
        NoFall = "No Fall Damage",
        LagSwitch = "Lag Switch",
        BToolsRange = "BTools Range",
        AutoRespawn = "Auto Respawn",
        Rejoin = "Rejoin",
        ServerHop = "Server Hop",
        Language = "Language (EN/HE)",
        Enable = "Enable",
        Disable = "Disable",
        On = "On",
        Off = "Off",
    },
    HE = {
        WindowTitle = "ריאלמס האב",
        Tabs = {"תנועה", "קרב", "חזותי", "טלפורטים", "אקספלוייטים", "הגדרות"},
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
        SpamDelay = "עיכוב ספאם (שנ)",
        Fling = "העף שחקן",
        Freeze = "הקפא שחקן",
        NoFall = "ללא נזק נפילה",
        LagSwitch = "לאג סוויץ'",
        BToolsRange = "טווח כלי בנייה",
        AutoRespawn = "ספון אוטומטי",
        Rejoin = "הצטרף מחדש",
        ServerHop = "קפיצת שרת",
        Language = "שפה (EN/HE)",
        Enable = "הפעל",
        Disable = "כבה",
        On = "פועל",
        Off = "כבוי",
    }
}

local currentLang = "EN"
local function t(key) return Languages[currentLang][key] or key end

-- ===============================
--          SERVICES
-- ===============================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local Debris = game:GetService("Debris")

local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = lp:GetMouse()

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
local autoRespawnEnabled = false
local btoolsRangeEnabled = false

local flySpeed = 50
local clickInterval = 0.1
local spamDelay = 2
local gravityValue = 196.2
local btoolsRange = 50
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
local waypoints = {}

-- ===============================
--          UTILITY FUNCTIONS
-- ===============================
local function getCharacter() return lp.Character end
local function getHumanoid() local c = getCharacter(); return c and c:FindFirstChild("Humanoid") end
local function getHRP() local c = getCharacter(); return c and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")) end

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
        if hum then hum.WalkSpeed = Fluent.Options.Walkspeed and Fluent.Options.Walkspeed.Value or 16 end
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
                if hum and hum.Health > 0 then hum.Health = 0 end
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
                if hum.Health < originalHealth then hum.Health = originalHealth end
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

-- Rapid Fire / Auto Clicker
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
        if hrp then camera.CFrame = CFrame.new(camera.CFrame.Position, hrp.Position) end
    end
end

-- Silent Aim
local function silentAimHit()
    if not silentAimEnabled then return end
    local target = getClosestPlayer()
    if target and target.Character then
        local hrp = target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso")
        if hrp then
            local tool = lp.Character and lp.Character:FindFirstChildOfClass("Tool")
            if tool then
                local fireRemote = tool:FindFirstChild("FireRemote") or tool:FindFirstChild("ShootRemote")
                if fireRemote then fireRemote:FireServer(hrp.Position) end
            end
        end
    end
end

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then silentAimHit() end
end)

-- ESP
local function updateESP()
    if not espEnabled then
        for _, hl in pairs(espHighlights) do if hl then hl:Destroy() end end
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
        Lighting.Brightness = 2
        Lighting.ClockTime = 12
    else
        Lighting.Brightness = 0
        Lighting.ClockTime = 0
    end
end

-- No Fog
local function setNoFog(state)
    if state then
        Lighting.FogEnd = 100000
    else
        Lighting.FogEnd = 10000
    end
end

-- Spin Bot
local function spinBotLoop()
    if not spinBotEnabled then return end
    local hrp = getHRP()
    if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(10), 0) end
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

-- Chat Spammer (Updated to use TextChatService with fallback)
local function startChatSpammer()
    if spamConnection then spamConnection:Disconnect() end
    
    -- Try to use the modern TextChatService first
    local textChatService = game:GetService("TextChatService")
    local chatInputBar = textChatService:FindFirstChild("ChatInputBarConfiguration")
    local targetChannel = chatInputBar and chatInputBar:FindFirstChild("TargetTextChannel")
    
    if targetChannel then
        -- Using TextChatService (new system)
        spamConnection = RS.RenderStepped:Connect(function()
            targetChannel:SendAsync(spamMessage)
            task.wait(spamDelay)
        end)
    else
        -- Fallback to legacy chat system
        spamConnection = RS.RenderStepped:Connect(function()
            lp.Chat:Chat(spamMessage)
            task.wait(spamDelay)
        end)
    end
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

-- Lag Switch
local function lagSwitchLoop()
    if lagSwitchEnabled then
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v ~= lp.Character then v.Anchored = true end
        end
    else
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Anchored and v ~= lp.Character then v.Anchored = false end
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
        if handle then handle.Size = Vector3.new(btoolsRange, btoolsRange, btoolsRange) end
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
--          CREATE FLUENT UI
-- ===============================
local Window = Fluent:CreateWindow({
    Title = t("WindowTitle"),
    SubTitle = "by Realms",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Movement = Window:AddTab({ Title = t("Tabs")[1], Icon = "gauge" }),
    Combat = Window:AddTab({ Title = t("Tabs")[2], Icon = "swords" }),
    Visual = Window:AddTab({ Title = t("Tabs")[3], Icon = "eye" }),
    Teleports = Window:AddTab({ Title = t("Tabs")[4], Icon = "map-pin" }),
    Exploits = Window:AddTab({ Title = t("Tabs")[5], Icon = "zap" }),
    Settings = Window:AddTab({ Title = t("Tabs")[6], Icon = "settings" })
}

-- ===============================
--          MOVEMENT TAB
-- ===============================
local MovementSection = Tabs.Movement:AddSection(t("Walkspeed"))

local WalkspeedSlider = MovementSection:AddSlider("Walkspeed", {
    Title = t("Walkspeed"),
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 1,
    Callback = function(v)
        local hum = getHumanoid()
        if hum and not speedHackEnabled then hum.WalkSpeed = v end
    end
})

local JumpPowerSlider = MovementSection:AddSlider("JumpPower", {
    Title = t("JumpPower"),
    Default = 50,
    Min = 30,
    Max = 500,
    Rounding = 1,
    Callback = function(v)
        local hum = getHumanoid()
        if hum then hum.JumpPower = v end
    end
})

local FOVSlider = MovementSection:AddSlider("FOV", {
    Title = t("FOV"),
    Default = 70,
    Min = 60,
    Max = 120,
    Rounding = 1,
    Callback = function(v)
        camera.FieldOfView = v
    end
})

local GravitySlider = MovementSection:AddSlider("Gravity", {
    Title = t("Gravity"),
    Default = 196.2,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Callback = function(v)
        gravityValue = v
        setGravity(v)
    end
})

local FlyToggle = MovementSection:AddToggle("FlyToggle", {
    Title = t("Fly"),
    Default = false,
    Callback = function(state)
        flyEnabled = state
        if state then startFly() else stopFly() end
    end
})

local FlySpeedSlider = MovementSection:AddSlider("FlySpeed", {
    Title = t("FlySpeed"),
    Default = 50,
    Min = 10,
    Max = 500,
    Rounding = 1,
    Callback = function(v) flySpeed = v end
})

local NoclipToggle = MovementSection:AddToggle("NoclipToggle", {
    Title = t("Noclip"),
    Default = false,
    Callback = function(state)
        noclipEnabled = state
        setNoclip(state)
    end
})

local InfiniteJumpToggle = MovementSection:AddToggle("InfiniteJumpToggle", {
    Title = t("InfiniteJump"),
    Default = false,
    Callback = function(state) infiniteJumpEnabled = state end
})

local AutoJumpToggle = MovementSection:AddToggle("AutoJumpToggle", {
    Title = t("AutoJump"),
    Default = false,
    Callback = function(state)
        autoJumpEnabled = state
        if state then
            if autoJumpConnection then autoJumpConnection:Disconnect() end
            autoJumpConnection = RS.RenderStepped:Connect(autoJumpLoop)
        else
            if autoJumpConnection then autoJumpConnection:Disconnect() end
        end
    end
})

local SpeedHackToggle = MovementSection:AddToggle("SpeedHackToggle", {
    Title = t("SpeedHack"),
    Default = false,
    Callback = function(state)
        speedHackEnabled = state
        if state then
            RS.RenderStepped:Connect(speedHackLoop)
        end
    end
})

-- ===============================
--          COMBAT TAB
-- ===============================
local CombatSection = Tabs.Combat:AddSection(t("KillAura"))

local KillAuraToggle = CombatSection:AddToggle("KillAuraToggle", {
    Title = t("KillAura"),
    Default = false,
    Callback = function(state)
        killAuraEnabled = state
        if state then
            if killAuraConnection then killAuraConnection:Disconnect() end
            killAuraConnection = RS.RenderStepped:Connect(killAuraLoop)
        else
            if killAuraConnection then killAuraConnection:Disconnect() end
        end
    end
})

local GodModeToggle = CombatSection:AddToggle("GodModeToggle", {
    Title = t("GodMode"),
    Default = false,
    Callback = function(state)
        godModeEnabled = state
        setGodMode(state)
    end
})

local OneHitKillToggle = CombatSection:AddToggle("OneHitKillToggle", {
    Title = t("OneHitKill"),
    Default = false,
    Callback = function(state)
        oneHitKillEnabled = state
        if state then
            local hrp = getHRP()
            if hrp then hrp.Touched:Connect(onTouched) end
        end
    end
})

local InfiniteStaminaToggle = CombatSection:AddToggle("InfiniteStaminaToggle", {
    Title = t("InfiniteStamina"),
    Default = false,
    Callback = function(state)
        infiniteStaminaEnabled = state
        if state then
            RS.RenderStepped:Connect(infiniteStaminaLoop)
        end
    end
})

local RapidFireToggle = CombatSection:AddToggle("RapidFireToggle", {
    Title = t("RapidFire"),
    Default = false,
    Callback = function(state)
        rapidFireEnabled = state
        if state then startRapidFire() else stopRapidFire() end
    end
})

local ClickIntervalSlider = CombatSection:AddSlider("ClickInterval", {
    Title = t("ClickInterval"),
    Default = 0.1,
    Min = 0.01,
    Max = 1,
    Rounding = 2,
    Callback = function(v)
        clickInterval = v
        if rapidFireEnabled then
            stopRapidFire()
            startRapidFire()
        end
    end
})

local AimbotToggle = CombatSection:AddToggle("AimbotToggle", {
    Title = t("Aimbot"),
    Default = false,
    Callback = function(state)
        aimbotEnabled = state
        if state then
            RS.RenderStepped:Connect(aimbotLoop)
        end
    end
})

local SilentAimToggle = CombatSection:AddToggle("SilentAimToggle", {
    Title = t("SilentAim"),
    Default = false,
    Callback = function(state) silentAimEnabled = state end
})

-- ===============================
--          VISUAL TAB
-- ===============================
local VisualSection = Tabs.Visual:AddSection(t("ESP"))

local ESPToggle = VisualSection:AddToggle("ESPToggle", {
    Title = t("ESP"),
    Default = false,
    Callback = function(state)
        espEnabled = state
        updateESP()
    end
})

local FullBrightToggle = VisualSection:AddToggle("FullBrightToggle", {
    Title = t("FullBright"),
    Default = false,
    Callback = function(state) setFullBright(state) end
})

local NoFogToggle = VisualSection:AddToggle("NoFogToggle", {
    Title = t("NoFog"),
    Default = false,
    Callback = function(state) setNoFog(state) end
})

local SpinBotToggle = VisualSection:AddToggle("SpinBotToggle", {
    Title = t("SpinBot"),
    Default = false,
    Callback = function(state)
        spinBotEnabled = state
        if state then
            if spinBotConnection then spinBotConnection:Disconnect() end
            spinBotConnection = RS.RenderStepped:Connect(spinBotLoop)
        else
            if spinBotConnection then spinBotConnection:Disconnect() end
        end
    end
})

-- ===============================
--          TELEPORTS TAB
-- ===============================
local TeleportsSection = Tabs.Teleports:AddSection(t("TPToMouse"))

TeleportsSection:AddButton({
    Title = t("TPToMouse"),
    Callback = function()
        local hrp = getHRP()
        if hrp and mouse.Hit then hrp.CFrame = mouse.Hit end
    end
})

-- Player dropdown for TP
local playerNames = {}
local function updatePlayerList()
    playerNames = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp then table.insert(playerNames, plr.Name) end
    end
end
updatePlayerList()
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

local PlayerDropdown = TeleportsSection:AddDropdown("PlayerDropdown", {
    Title = t("TPToPlayer"),
    Values = playerNames,
    Default = 1,
    Multi = false
})

TeleportsSection:AddButton({
    Title = t("TPToPlayer"),
    Callback = function()
        local selected = PlayerDropdown.Value
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Name == selected and plr.Character then
                local hrp = getHRP()
                local targetHRP = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso")
                if hrp and targetHRP then hrp.CFrame = targetHRP.CFrame end
                break
            end
        end
    end
})

-- Waypoints
local function refreshWaypoints()
    -- Remove existing waypoint UI elements (this is simplified; for full implementation you'd need to store references)
    -- For brevity, we'll just add a button to add waypoints and show them in a paragraph.
end

TeleportsSection:AddButton({
    Title = t("AddWaypoint"),
    Callback = function()
        local hrp = getHRP()
        if hrp then
            table.insert(waypoints, hrp.Position)
            Fluent:Notify({ Title = "Waypoint", Content = "Waypoint added! Total: " .. #waypoints, Duration = 2 })
        end
    end
})

-- Show waypoints list (simple paragraph updated on add)
local WaypointParagraph = TeleportsSection:AddParagraph({
    Title = t("Waypoints"),
    Content = "No waypoints yet."
})

local function updateWaypointDisplay()
    if #waypoints == 0 then
        WaypointParagraph:SetContent("No waypoints yet.")
    else
        local content = ""
        for i, pos in ipairs(waypoints) do
            content = content .. i .. ": " .. math.floor(pos.X) .. ", " .. math.floor(pos.Y) .. ", " .. math.floor(pos.Z) .. "\n"
        end
        WaypointParagraph:SetContent(content)
    end
end

-- Override AddWaypoint to update display
local addBtn = TeleportsSection:AddButton({ Title = t("AddWaypoint"), Callback = function() end })
addBtn.Callback = function()
    local hrp = getHRP()
    if hrp then
        table.insert(waypoints, hrp.Position)
        updateWaypointDisplay()
        Fluent:Notify({ Title = "Waypoint", Content = "Waypoint added! Total: " .. #waypoints, Duration = 2 })
    end
end
updateWaypointDisplay()

-- ===============================
--          EXPLOITS TAB
-- ===============================
local ExploitsSection = Tabs.Exploits:AddSection(t("AntiAFK"))

local AntiAFKToggle = ExploitsSection:AddToggle("AntiAFKToggle", {
    Title = t("AntiAFK"),
    Default = false,
    Callback = function(state)
        antiAFKEnabled = state
        if state then startAntiAFK() else stopAntiAFK() end
    end
})

local AutoClickerToggle = ExploitsSection:AddToggle("AutoClickerToggle", {
    Title = t("AutoClicker"),
    Default = false,
    Callback = function(state)
        autoClickerEnabled = state
        if state then startRapidFire() else stopRapidFire() end
    end
})

local ChatSpammerToggle = ExploitsSection:AddToggle("ChatSpammerToggle", {
    Title = t("ChatSpammer"),
    Default = false,
    Callback = function(state)
        chatSpammerEnabled = state
        if state then startChatSpammer() else stopChatSpammer() end
    end
})

local SpamDelaySlider = ExploitsSection:AddSlider("SpamDelay", {
    Title = t("SpamDelay"),
    Default = 2,
    Min = 0.5,
    Max = 10,
    Rounding = 1,
    Callback = function(v)
        spamDelay = v
        if chatSpammerEnabled then
            stopChatSpammer()
            startChatSpammer()
        end
    end
})

local NoFallToggle = ExploitsSection:AddToggle("NoFallToggle", {
    Title = t("NoFall"),
    Default = false,
    Callback = function(state)
        noFallEnabled = state
        if state then
            RS.RenderStepped:Connect(noFallLoop)
        end
    end
})

local LagSwitchToggle = ExploitsSection:AddToggle("LagSwitchToggle", {
    Title = t("LagSwitch"),
    Default = false,
    Callback = function(state)
        lagSwitchEnabled = state
        if state then
            if lagSwitchConnection then lagSwitchConnection:Disconnect() end
            lagSwitchConnection = RS.RenderStepped:Connect(lagSwitchLoop)
        else
            if lagSwitchConnection then lagSwitchConnection:Disconnect() end
            lagSwitchLoop()
        end
    end
})

local AutoRespawnToggle = ExploitsSection:AddToggle("AutoRespawnToggle", {
    Title = t("AutoRespawn"),
    Default = false,
    Callback = function(state)
        autoRespawnEnabled = state
        setupAutoRespawn()
    end
})

local BToolsRangeToggle = ExploitsSection:AddToggle("BToolsRangeToggle", {
    Title = t("BToolsRange"),
    Default = false,
    Callback = function(state)
        btoolsRangeEnabled = state
        setBToolsRange()
    end
})

local BToolsRangeSlider = ExploitsSection:AddSlider("BToolsRange", {
    Title = t("BToolsRange"),
    Default = 50,
    Min = 10,
    Max = 200,
    Rounding = 1,
    Callback = function(v)
        btoolsRange = v
        setBToolsRange()
    end
})

-- Fling & Freeze dropdowns
local FlingDropdown = ExploitsSection:AddDropdown("FlingDropdown", {
    Title = t("Fling"),
    Values = playerNames,
    Default = 1,
    Multi = false
})
ExploitsSection:AddButton({
    Title = t("Fling"),
    Callback = function()
        local selected = FlingDropdown.Value
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Name == selected then
                flingPlayer(plr)
                break
            end
        end
    end
})

local FreezeDropdown = ExploitsSection:AddDropdown("FreezeDropdown", {
    Title = t("Freeze"),
    Values = playerNames,
    Default = 1,
    Multi = false
})
ExploitsSection:AddButton({
    Title = t("Freeze"),
    Callback = function()
        local selected = FreezeDropdown.Value
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Name == selected then
                freezePlayer(plr)
                break
            end
        end
    end
})

-- Rejoin / Server Hop
ExploitsSection:AddButton({
    Title = t("Rejoin"),
    Callback = function()
        TeleportService:Teleport(game.PlaceId, lp)
    end
})
ExploitsSection:AddButton({
    Title = t("ServerHop"),
    Callback = function()
        TeleportService:Teleport(game.PlaceId)
    end
})

-- ===============================
--          SETTINGS TAB
-- ===============================
local SettingsSection = Tabs.Settings:AddSection(t("Language"))

SettingsSection:AddButton({
    Title = t("Language"),
    Callback = function()
        if currentLang == "EN" then
            currentLang = "HE"
        else
            currentLang = "EN"
        end
        -- Update window title and tab titles dynamically
        Window:SetTitle(t("WindowTitle"))
        for i, tab in ipairs(Tabs) do
            tab:SetTitle(t("Tabs")[i])
        end
        Fluent:Notify({ Title = "Language", Content = "Switched to " .. currentLang, Duration = 2 })
    end
})

-- ===============================
--          ADDONS (SaveManager & InterfaceManager)
-- ===============================
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("RealmsHub")
SaveManager:SetFolder("RealmsHub/configs")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Realms Hub",
    Content = "Loaded successfully!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

-- ===============================
--          HEARTBEAT LOOP
-- ===============================
RS.Heartbeat:Connect(updateFly)

-- Initial gravity
setGravity(gravityValue)
