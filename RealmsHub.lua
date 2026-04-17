--[[
    ██████╗ ███████╗ █████╗ ██╗     ███╗   ███╗███████╗
    ██╔══██╗██╔════╝██╔══██╗██║     ████╗ ████║██╔════╝
    ██████╔╝█████╗  ███████║██║     ██╔████╔██║███████╗
    ██╔══██╗██╔══╝  ██████║██║     ██║╚██╔╝██║╚════██║
    ██║  ██║███████╗██║  ██║███████╗██║ ╚═╝ ██║███████║
    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
    
                         REALMS HUB
              Ultimate Exploit Hub | 60+ Exploits
                   Mobile Support | EN/HE
]]

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Http = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local ContextActionService = game:GetService("ContextActionService")

local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = lp:GetMouse()

-- ========== CONFIGURATION ==========
local FILE = "realmshub_config.json"
local LANG = "EN" -- "EN" or "HE"
local uiScale = 1
local mobileMode = false

-- ========== TRANSLATIONS ==========
local translations = {
    EN = {
        title = "Realms Hub",
        tab_movement = "Movement",
        tab_combat = "Combat",
        tab_visual = "Visual",
        tab_teleports = "Teleports",
        tab_exploits = "Exploits",
        tab_profiles = "Profiles",
        tab_settings = "Settings",
        walkspeed = "Walk Speed",
        jumppower = "Jump Power",
        fov = "FOV",
        fly = "Fly",
        noclip = "Noclip",
        infinitejump = "Infinite Jump",
        esp = "ESP",
        killaura = "Kill Aura",
        godmode = "God Mode",
        autokick = "Anti-AFK",
        autoclicker = "Auto Clicker",
        chatspammer = "Chat Spammer",
        infiniteammo = "Infinite Ammo",
        norecoil = "No Recoil",
        tp_mouse = "TP to Mouse",
        tp_player = "TP to Player",
        tp_waypoint = "Waypoints",
        add_waypoint = "Add Waypoint",
        fly_speed = "Fly Speed",
        click_interval = "Click Interval",
        spam_message = "Spam Message",
        spam_delay = "Spam Delay",
        profile_new = "New Profile",
        profile_switch = "Switch Profile",
        profile_save = "Save Profile",
        language = "Language",
        ui_scale = "UI Scale",
        mobile_mode = "Mobile Mode",
        enable = "Enable",
        disable = "Disable",
        fling = "Fling Player",
        noclip_other = "Noclip Other",
        fullbright = "FullBright",
        nofog = "No Fog",
        nofall = "No Fall Damage",
        spinbot = "Spin Bot",
        freezeplayer = "Freeze Player",
        rapidfire = "Rapid Fire",
        meleespeed = "Melee Speed",
        autojump = "Auto Jump",
        infinite_stamina = "Infinite Stamina",
        onehitkill = "One Hit Kill",
        lagswitch = "Lag Switch",
        rejoin = "Rejoin",
        serverhop = "Server Hop",
        btools = "BTools Range",
        autorespawn = "Auto Respawn",
        push_power = "Push Power",
        tp_tool = "TP Tool",
        aimbot = "Aimbot",
        silentaim = "Silent Aim",
        field_of_view = "Aimbot FOV",
        speedhack = "Speed Hack",
        gravity = "Gravity",
        walkspeed_slider = "WalkSpeed",
        jumppower_slider = "JumpPower",
    },
    HE = {
        title = "ריאלמס האב",
        tab_movement = "תנועה",
        tab_combat = "קרב",
        tab_visual = "חזותי",
        tab_teleports = "טלפורטים",
        tab_exploits = "אקספלוייטים",
        tab_profiles = "פרופילים",
        tab_settings = "הגדרות",
        walkspeed = "מהירות הליכה",
        jumppower = "עוצמת קפיצה",
        fov = "שדה ראייה",
        fly = "טיסה",
        noclip = "ללא התנגשות",
        infinitejump = "קפיצה אינסופית",
        esp = "ESP",
        killaura = "הילת הרג",
        godmode = "מצב אלוהים",
        autokick = "Anti-AFK",
        autoclicker = "לחיצה אוטומטית",
        chatspammer = "ספאמר צ'אט",
        infiniteammo = "תחמושת אינסופית",
        norecoil = "ללא רתע",
        tp_mouse = "טלפורט לעכבר",
        tp_player = "טלפורט לשחקן",
        tp_waypoint = "נקודות ציון",
        add_waypoint = "הוסף נקודת ציון",
        fly_speed = "מהירות טיסה",
        click_interval = "מרווח לחיצה",
        spam_message = "הודעה לספאם",
        spam_delay = "עיכוב ספאם",
        profile_new = "פרופיל חדש",
        profile_switch = "החלף פרופיל",
        profile_save = "שמור פרופיל",
        language = "שפה",
        ui_scale = "קנה מידה",
        mobile_mode = "מצב נייד",
        enable = "הפעל",
        disable = "כבה",
        fling = "העף שחקן",
        noclip_other = "ללא התנגשות לאחר",
        fullbright = "בהירות מלאה",
        nofog = "ללא ערפל",
        nofall = "ללא נזק נפילה",
        spinbot = "ספין בוט",
        freezeplayer = "הקפא שחקן",
        rapidfire = "ירי מהיר",
        meleespeed = "מהירות תגרה",
        autojump = "קפיצה אוטומטית",
        infinite_stamina = "סיבולת אינסופית",
        onehitkill = "מכה אחת הורגת",
        lagswitch = "לאג סוויץ'",
        rejoin = "הצטרף מחדש",
        serverhop = "קפיצת שרת",
        btools = "טווח כלי בנייה",
        autorespawn = "ספון אוטומטי",
        push_power = "עוצמת דחיפה",
        tp_tool = "כלי טלפורט",
        aimbot = "אייבוט",
        silentaim = "סיילנט איים",
        field_of_view = "שדה ראייה לאייבוט",
        speedhack = "ספיד האק",
        gravity = "כוח משיכה",
        walkspeed_slider = "מהירות הליכה",
        jumppower_slider = "עוצמת קפיצה",
    }
}

local function t(key)
    return translations[LANG][key] or key
end

-- ========== SAVE SYSTEM ==========
local profiles = {}
local currentProfile = "default"

local function saveProfiles()
    if writefile then
        writefile(FILE, Http:JSONEncode({
            profiles = profiles,
            current = currentProfile,
            settings = {
                lang = LANG,
                uiScale = uiScale,
                mobileMode = mobileMode
            }
        }))
    end
end

local function loadProfiles()
    if readfile and isfile and isfile(FILE) then
        local success, data = pcall(function()
            return Http:JSONDecode(readfile(FILE))
        end)
        if success and data then
            profiles = data.profiles or {}
            currentProfile = data.current or "default"
            if data.settings then
                LANG = data.settings.lang or "EN"
                uiScale = data.settings.uiScale or 1
                mobileMode = data.settings.mobileMode or false
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
            pushPower = 50,
            gravity = 196.2
        }
    end
end

loadProfiles()

local function getProfile()
    return profiles[currentProfile]
end

-- ========== EXPLOIT TOGGLES & VARIABLES ==========
local flyEnabled = false
local noclipEnabled = false
local infiniteJumpEnabled = false
local espEnabled = false
local killAuraEnabled = false
local godModeEnabled = false
local antiAFKEnabled = false
local autoClickerEnabled = false
local chatSpammerEnabled = false
local infiniteAmmoEnabled = false
local noRecoilEnabled = false
local fullbrightEnabled = false
local noFogEnabled = false
local noFallDamageEnabled = false
local spinBotEnabled = false
local autoJumpEnabled = false
local infiniteStaminaEnabled = false
local oneHitKillEnabled = false
local lagSwitchEnabled = false
local autoRespawnEnabled = false
local aimbotEnabled = false
local silentAimEnabled = false
local speedHackEnabled = false
local btoolsRangeEnabled = false
local tpToolEnabled = false

-- Variables
local flySpeed = getProfile().flySpeed
local clickInterval = getProfile().clickInterval
local spamMessage = getProfile().spamMessage
local spamDelay = getProfile().spamDelay
local pushPower = getProfile().pushPower
local gravity = getProfile().gravity
local aimbotFOV = 100
local btoolsRange = 50
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
local originalFog = nil
local originalBrightness = nil
local originalGravity = nil
local originalStamina = nil
local originalHealth = nil
local espHighlights = {}
local selectedPlayer = nil
local selectedWaypoint = nil
local frozenPlayers = {}
local flingVelocities = {}

-- ========== UTILITY FUNCTIONS ==========
local function getCharacter(plr)
    if plr and plr.Character and plr.Character.Parent then
        return plr.Character
    end
    return nil
end

local function getHumanoid(plr)
    local char = getCharacter(plr)
    if char then
        return char:FindFirstChild("Humanoid")
    end
    return nil
end

local function getHRP(plr)
    local char = getCharacter(plr)
    if char then
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    end
    return nil
end

-- ========== EXPLOIT FUNCTIONS ==========

-- Noclip
local function setNoclip(state)
    local char = lp.Character
    if not char then return end
    for _, part in pairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end

-- Infinite Jump
local function onJump()
    if infiniteJumpEnabled and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        local hum = lp.Character.Humanoid
        if hum.Jump then
            hum.Jump = true
        end
    end
end

-- God Mode
local function setGodMode(state)
    local char = lp.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return end
    if state then
        originalHealth = hum.Health
        hum:GetPropertyChangedSignal("Health"):Connect(function()
            if hum.Health < originalHealth then
                hum.Health = originalHealth
            end
        end)
    end
end

-- One Hit Kill
local function onDamage(other)
    if oneHitKillEnabled and other and other.Parent and other.Parent:FindFirstChild("Humanoid") then
        other.Parent.Humanoid.Health = 0
    end
end

-- Anti-AFK
local function startAntiAFK()
    if antiAFKConnection then antiAFKConnection:Disconnect() end
    antiAFKConnection = RunService.RenderStepped:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

local function stopAntiAFK()
    if antiAFKConnection then antiAFKConnection:Disconnect() end
end

-- Auto Clicker
local function startAutoClicker()
    if clickConnection then clickConnection:Disconnect() end
    clickConnection = RunService.RenderStepped:Connect(function()
        mouse1click()
        task.wait(clickInterval)
    end)
end

local function stopAutoClicker()
    if clickConnection then clickConnection:Disconnect() end
end

-- Chat Spammer
local function startChatSpammer()
    if spamConnection then spamConnection:Disconnect() end
    spamConnection = RunService.RenderStepped:Connect(function()
        lp.Chat:Chat(spamMessage)
        task.wait(spamDelay)
    end)
end

local function stopChatSpammer()
    if spamConnection then spamConnection:Disconnect() end
end

-- Infinite Ammo & No Recoil
local function applyWeaponMods()
    if not infiniteAmmoEnabled and not noRecoilEnabled then return end
    for _, tool in pairs(lp.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            if infiniteAmmoEnabled then
                local ammo = tool:FindFirstChild("Ammo")
                if ammo then ammo.Value = 9999 end
                local magazine = tool:FindFirstChild("Magazine")
                if magazine then magazine.Value = 9999 end
            end
            if noRecoilEnabled then
                local recoil = tool:FindFirstChild("Recoil")
                if recoil then recoil:Destroy() end
            end
        end
    end
end

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

Players.PlayerRemoving:Connect(function(plr)
    if espHighlights[plr] then
        espHighlights[plr]:Destroy()
        espHighlights[plr] = nil
    end
end)

-- Kill Aura
local function killAuraLoop()
    if not killAuraEnabled or not lp.Character then return end
    local hrp = getHRP(lp)
    if not hrp then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp then
            local targetHrp = getHRP(plr)
            if targetHrp and (hrp.Position - targetHrp.Position).Magnitude <= 15 then
                local hum = getHumanoid(plr)
                if hum and hum.Health > 0 then
                    hum.Health = 0
                end
            end
        end
    end
end

-- Fling Player
local function flingPlayer(target)
    local targetHrp = getHRP(target)
    if not targetHrp then return end
    local flingVelocity = Instance.new("BodyVelocity")
    flingVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    flingVelocity.Velocity = Vector3.new(1e5, 1e5, 1e5)
    flingVelocity.Parent = targetHrp
    Debris:AddItem(flingVelocity, 1)
    local randomDir = (targetHrp.Position - camera.CFrame.Position).Unit * 500 + Vector3.new(0, 200, 0)
    targetHrp.AssemblyLinearVelocity = randomDir
end

-- Freeze Player
local function freezePlayer(target)
    local targetHrp = getHRP(target)
    if not targetHrp then return end
    if frozenPlayers[target] then
        if frozenPlayers[target].bodyVelocity then frozenPlayers[target].bodyVelocity:Destroy() end
        frozenPlayers[target] = nil
    else
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bv.Velocity = Vector3.zero
        bv.Parent = targetHrp
        frozenPlayers[target] = {bodyVelocity = bv}
    end
end

-- Spin Bot
local function spinBotLoop()
    if not spinBotEnabled or not lp.Character then return end
    local hrp = getHRP(lp)
    if hrp then
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(10), 0)
    end
end

-- FullBright
local function setFullBright(state)
    if state then
        originalBrightness = Lighting.Brightness
        Lighting.Brightness = 2
        Lighting.ClockTime = 12
        Lighting.FogEnd = 100000
    else
        if originalBrightness then Lighting.Brightness = originalBrightness end
        Lighting.ClockTime = 0
    end
end

-- No Fog
local function setNoFog(state)
    if state then
        originalFog = Lighting.FogEnd
        Lighting.FogEnd = 100000
    else
        if originalFog then Lighting.FogEnd = originalFog end
    end
end

-- No Fall Damage
local function noFallDamageLoop()
    if noFallDamageEnabled and lp.Character then
        local hum = lp.Character:FindFirstChild("Humanoid")
        if hum and hum.Health > 0 and hum.FloorMaterial ~= Enum.Material.Air then
            -- Prevent fall damage by resetting velocity on landing
            local hrp = getHRP(lp)
            if hrp and hrp.AssemblyLinearVelocity.Y < -30 then
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
            end
        end
    end
end

-- Auto Jump
local function autoJumpLoop()
    if autoJumpEnabled and lp.Character then
        local hum = lp.Character:FindFirstChild("Humanoid")
        if hum and hum.FloorMaterial ~= Enum.Material.Air then
            hum.Jump = true
        end
    end
end

-- Infinite Stamina
local function infiniteStaminaLoop()
    if infiniteStaminaEnabled and lp.Character then
        local hum = lp.Character:FindFirstChild("Humanoid")
        if hum then
            -- For games with stamina system
            local stamina = hum:FindFirstChild("Stamina")
            if stamina then stamina.Value = 100 end
            local energy = hum:FindFirstChild("Energy")
            if energy then energy.Value = 100 end
        end
    end
end

-- Speed Hack (override walkspeed)
local function speedHackLoop()
    if speedHackEnabled and lp.Character then
        local hum = lp.Character:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = getProfile().walkspeed
        end
    end
end

-- Lag Switch (visual only - freezes all animations locally)
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

-- Auto Respawn
local function autoRespawn()
    if autoRespawnEnabled then
        lp.CharacterAdded:Connect(function()
            task.wait(0.5)
            -- Re-apply godmode, fly, etc.
            if godModeEnabled then setGodMode(true) end
            if flyEnabled then startFly() end
        end)
    end
end

-- Aimbot & Silent Aim
local function getClosestPlayer()
    local closest = nil
    local closestDist = aimbotFOV
    local mousePos = UIS:GetMouseLocation()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            local hrp = getHRP(plr)
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
    if aimbotEnabled then
        local target = getClosestPlayer()
        if target and target.Character then
            local hrp = getHRP(target)
            if hrp then
                camera.CFrame = CFrame.new(camera.CFrame.Position, hrp.Position)
            end
        end
    end
end

local function silentAimHit()
    if silentAimEnabled then
        local target = getClosestPlayer()
        if target and target.Character then
            local hrp = getHRP(target)
            if hrp then
                -- Simulate hit on target (weapon dependent)
                -- This is a generic implementation; actual silent aim requires remote events
                local tool = lp.Character:FindFirstChildOfClass("Tool")
                if tool then
                    local fireRemote = tool:FindFirstChild("FireRemote") or tool:FindFirstChild("ShootRemote")
                    if fireRemote then
                        fireRemote:FireServer(hrp.Position)
                    end
                end
            end
        end
    end
end

-- BTools Range
local function setBToolsRange()
    if btoolsRangeEnabled then
        local tool = lp.Backpack:FindFirstChildWhichIsA("Tool") or (lp.Character and lp.Character:FindFirstChildWhichIsA("Tool"))
        if tool then
            local handle = tool:FindFirstChild("Handle")
            if handle then
                handle.Size = Vector3.new(btoolsRange, btoolsRange, btoolsRange)
            end
        end
    end
end

-- Teleport Tool
local function enableTPTool()
    if tpToolEnabled then
        mouse.Button1Down:Connect(function()
            local target = mouse.Target
            if target and lp.Character then
                local hrp = getHRP(lp)
                if hrp then
                    hrp.CFrame = CFrame.new(target.Position + Vector3.new(0, 3, 0))
                end
            end
        end)
    end
end

-- Gravity
local function setGravity(value)
    Workspace.Gravity = value
end

-- Fly System
local function startFly()
    local char = lp.Character
    if not char then return end
    local hrp = getHRP(lp)
    if not hrp then return end
    local hum = char:FindFirstChild("Humanoid")
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
    local char = lp.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then hum.PlatformStand = false end
    end
end

local function updateFly()
    if not flyEnabled or not lp.Character then return end
    local hrp = getHRP(lp)
    if not hrp then return end
    local vel = Vector3.zero
    local direction = hrp.CFrame
    if flyKeys.W then vel = vel + direction.LookVector end
    if flyKeys.S then vel = vel - direction.LookVector end
    if flyKeys.D then vel = vel + direction.RightVector end
    if flyKeys.A then vel = vel - direction.RightVector end
    if flyKeys.Space then vel = vel + Vector3.new(0, 1, 0) end
    if flyBodyVelocity then flyBodyVelocity.Velocity = vel * flySpeed end
    if flyBodyGyro then flyBodyGyro.CFrame = hrp.CFrame end
end

-- Input handling for fly
UIS.InputBegan:Connect(function(input, processed)
    if processed then return end
    local key = input.KeyCode
    if key == Enum.KeyCode.W then flyKeys.W = true end
    if key == Enum.KeyCode.A then flyKeys.A = true end
    if key == Enum.KeyCode.S then flyKeys.S = true end
    if key == Enum.KeyCode.D then flyKeys.D = true end
    if key == Enum.KeyCode.Space then flyKeys.Space = true end
end)

UIS.InputEnded:Connect(function(input)
    local key = input.KeyCode
    if key == Enum.KeyCode.W then flyKeys.W = false end
    if key == Enum.KeyCode.A then flyKeys.A = false end
    if key == Enum.KeyCode.S then flyKeys.S = false end
    if key == Enum.KeyCode.D then flyKeys.D = false end
    if key == Enum.KeyCode.Space then flyKeys.Space = false end
end)

-- ========== GUI CREATION ==========
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 18

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "RealmsHub"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 650 * uiScale, 0, 450 * uiScale)
main.Position = UDim2.new(0.5, -325 * uiScale, 0.5, -225 * uiScale)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BackgroundTransparency = 0.2
main.Active = true
main.Draggable = false

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)
local stroke = Instance.new("UIStroke", main)
stroke.Transparency = 0.6

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 140 * uiScale, 1, 0)
sidebar.BackgroundTransparency = 0.3
Instance.new("UICorner", sidebar)

local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -140 * uiScale, 1, 0)
content.Position = UDim2.new(0, 140 * uiScale, 0, 0)
content.BackgroundTransparency = 1

-- Drag and Resize (mobile friendly)
local dragging, dragVel = false, Vector2.zero
local dragStart, startPos

local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        dragVel = Vector2.zero
    end
end

local function onInputChanged(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        dragVel = delta
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

local function onInputEnded(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end

main.InputBegan:Connect(onInputBegan)
UIS.InputChanged:Connect(onInputChanged)
UIS.InputEnded:Connect(onInputEnded)

RS.Heartbeat:Connect(function()
    if not dragging then
        main.Position = main.Position + UDim2.new(0, dragVel.X * 0.02, 0, dragVel.Y * 0.02)
        dragVel *= 0.9
    end
end)

local resize = Instance.new("Frame", main)
resize.Size = UDim2.new(0, 16 * uiScale, 0, 16 * uiScale)
resize.Position = UDim2.new(1, -16 * uiScale, 1, -16 * uiScale)
resize.BackgroundColor3 = Color3.fromRGB(80, 80, 90)
Instance.new("UICorner", resize).CornerRadius = UDim.new(0, 4)

local resizing = false
resize.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        resizing = true
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        resizing = false
    end
end)
UIS.InputChanged:Connect(function(i)
    if resizing then
        local newX = math.max(400, main.Size.X.Offset + i.Delta.X)
        local newY = math.max(300, main.Size.Y.Offset + i.Delta.Y)
        main.Size = UDim2.new(0, newX, 0, newY)
    end
end)

-- Tabs
local pages = {}
local function switchPage(page)
    for _, v in pairs(pages) do v.Visible = false end
    page.Visible = true
end

local function createTab(name, order)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, 0, 0, 50 * uiScale)
    btn.Position = UDim2.new(0, 0, 0, (order - 1) * 50 * uiScale)
    btn.Text = "  " .. t(name)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BackgroundTransparency = 1
    btn.TextScaled = mobileMode
    btn.Font = Enum.Font.GothomBold
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.7}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    end)
    
    local page = Instance.new("ScrollingFrame", content)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollBarThickness = 6
    
    btn.MouseButton1Click:Connect(function()
        switchPage(page)
    end)
    
    pages[#pages + 1] = page
    return page
end

-- UI Helper Functions
local function createButton(parent, text, y, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 200 * uiScale, 0, 40 * uiScale)
    btn.Position = UDim2.new(0, 20 * uiScale, 0, y * uiScale)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = mobileMode
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function createToggle(parent, text, y, default, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 200 * uiScale, 0, 40 * uiScale)
    btn.Position = UDim2.new(0, 20 * uiScale, 0, y * uiScale)
    btn.Text = text .. ": " .. (default and t("enable") or t("disable"))
    btn.BackgroundColor3 = default and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = mobileMode
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. ": " .. (state and t("enable") or t("disable"))
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
        callback(state)
    end)
    return btn
end

local function createSlider(parent, text, min, max, default, y, callback)
    local label = Instance.new("TextLabel", parent)
    label.Size = UDim2.new(0, 200 * uiScale, 0, 20 * uiScale)
    label.Position = UDim2.new(0, 20 * uiScale, 0, y * uiScale)
    label.Text = text .. ": " .. tostring(default)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = mobileMode
    
    local bar = Instance.new("Frame", parent)
    bar.Size = UDim2.new(0, 200 * uiScale, 0, 6 * uiScale)
    bar.Position = UDim2.new(0, 20 * uiScale, 0, (y + 22) * uiScale)
    bar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3)
    
    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 3)
    
    local dragging = false
    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)
    UIS.InputEnded:Connect(function() dragging = false end)
    UIS.InputChanged:Connect(function(i)
        if dragging then
            local x = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + (max - min) * x)
            fill.Size = UDim2.new(x, 0, 1, 0)
            label.Text = text .. ": " .. tostring(val)
            callback(val)
        end
    end)
end

local function createDropdown(parent, text, y, options, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 200 * uiScale, 0, 40 * uiScale)
    btn.Position = UDim2.new(0, 20 * uiScale, 0, y * uiScale)
    btn.Text = text .. ": " .. options[1]
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.TextScaled = mobileMode
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local index = 1
    btn.MouseButton1Click:Connect(function()
        index = index % #options + 1
        btn.Text = text .. ": " .. options[index]
        callback(options[index])
    end)
end

-- Create tabs
local movementTab = createTab("tab_movement", 1)
local combatTab = createTab("tab_combat", 2)
local visualTab = createTab("tab_visual", 3)
local teleportsTab = createTab("tab_teleports", 4)
local exploitsTab = createTab("tab_exploits", 5)
local profilesTab = createTab("tab_profiles", 6)
local settingsTab = createTab("tab_settings", 7)

-- ========== POPULATE TABS ==========
local yOffset = 10
local function resetY() yOffset = 10 end
local function nextY(inc) yOffset = yOffset + inc return yOffset end

-- Movement Tab
resetY()
createSlider(movementTab, t("walkspeed_slider"), 16, 500, getProfile().walkspeed, nextY(0), function(v)
    getProfile().walkspeed = v
    saveProfiles()
end)
createSlider(movementTab, t("jumppower_slider"), 30, 500, getProfile().jumppower, nextY(45), function(v)
    getProfile().jumppower = v
    saveProfiles()
end)
createSlider(movementTab, t("gravity"), 0, 500, gravity, nextY(45), function(v)
    gravity = v
    setGravity(v)
    getProfile().gravity = v
    saveProfiles()
end)
createToggle(movementTab, t("fly"), nextY(60), flyEnabled, function(v)
    flyEnabled = v
    if v then startFly() else stopFly() end
end)
createSlider(movementTab, t("fly_speed"), 10, 500, flySpeed, nextY(45), function(v)
    flySpeed = v
    getProfile().flySpeed = v
    saveProfiles()
end)
createToggle(movementTab, t("noclip"), nextY(45), noclipEnabled, function(v)
    noclipEnabled = v
    setNoclip(v)
end)
createToggle(movementTab, t("infinitejump"), nextY(45), infiniteJumpEnabled, function(v)
    infiniteJumpEnabled = v
    if v then
        UIS.JumpPressed:Connect(onJump)
    end
end)
createToggle(movementTab, t("autojump"), nextY(45), autoJumpEnabled, function(v)
    autoJumpEnabled = v
    if v then
        if autoJumpConnection then autoJumpConnection:Disconnect() end
        autoJumpConnection = RS.RenderStepped:Connect(autoJumpLoop)
    else
        if autoJumpConnection then autoJumpConnection:Disconnect() end
    end
end)
createToggle(movementTab, t("speedhack"), nextY(45), speedHackEnabled, function(v)
    speedHackEnabled = v
    if v then
        RS.RenderStepped:Connect(speedHackLoop)
    end
end)

-- Combat Tab
resetY()
createToggle(combatTab, t("killaura"), nextY(0), killAuraEnabled, function(v)
    killAuraEnabled = v
    if v then
        if killAuraConnection then killAuraConnection:Disconnect() end
        killAuraConnection = RS.RenderStepped:Connect(killAuraLoop)
    else
        if killAuraConnection then killAuraConnection:Disconnect() end
    end
end)
createToggle(combatTab, t("godmode"), nextY(45), godModeEnabled, function(v)
    godModeEnabled = v
    setGodMode(v)
end)
createToggle(combatTab, t("onehitkill"), nextY(45), oneHitKillEnabled, function(v)
    oneHitKillEnabled = v
    if v then
        game:GetService("RunService").Stepped:Connect(function()
            local char = lp.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Touched:Connect(onDamage)
                end
            end
        end)
    end
end)
createToggle(combatTab, t("infinite_stamina"), nextY(45), infiniteStaminaEnabled, function(v)
    infiniteStaminaEnabled = v
    if v then
        RS.RenderStepped:Connect(infiniteStaminaLoop)
    end
end)
createToggle(combatTab, t("rapidfire"), nextY(45), false, function(v)
    if v then
        startAutoClicker()
    else
        stopAutoClicker()
    end
end)
createSlider(combatTab, t("click_interval"), 0.01, 1, clickInterval, nextY(45), function(v)
    clickInterval = v
    getProfile().clickInterval = v
    saveProfiles()
    if autoClickerEnabled then
        stopAutoClicker()
        startAutoClicker()
    end
end)
createToggle(combatTab, t("aimbot"), nextY(45), aimbotEnabled, function(v)
    aimbotEnabled = v
    if v then
        RS.RenderStepped:Connect(aimbotLoop)
    end
end)
createToggle(combatTab, t("silentaim"), nextY(45), silentAimEnabled, function(v)
    silentAimEnabled = v
    if v then
        UIS.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                silentAimHit()
            end
        end)
    end
end)
createSlider(combatTab, t("field_of_view"), 30, 300, aimbotFOV, nextY(45), function(v)
    aimbotFOV = v
end)

-- Visual Tab
resetY()
createToggle(visualTab, t("esp"), nextY(0), espEnabled, function(v)
    espEnabled = v
    updateESP()
end)
createToggle(visualTab, t("fullbright"), nextY(45), fullbrightEnabled, function(v)
    fullbrightEnabled = v
    setFullBright(v)
end)
createToggle(visualTab, t("nofog"), nextY(45), noFogEnabled, function(v)
    noFogEnabled = v
    setNoFog(v)
end)
createToggle(visualTab, t("spinbot"), nextY(45), spinBotEnabled, function(v)
    spinBotEnabled = v
    if v then
        if spinBotConnection then spinBotConnection:Disconnect() end
        spinBotConnection = RS.RenderStepped:Connect(spinBotLoop)
    else
        if spinBotConnection then spinBotConnection:Disconnect() end
    end
end)

-- Teleports Tab
resetY()
createButton(teleportsTab, t("tp_mouse"), nextY(0), function()
    local mousePos = mouse.Hit.Position
    if lp.Character then
        local hrp = getHRP(lp)
        if hrp then hrp.CFrame = CFrame.new(mousePos) end
    end
end)

-- Player dropdown for teleport
local playerList = {}
local function updatePlayerList()
    playerList = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp then
            table.insert(playerList, plr.Name)
        end
    end
end
updatePlayerList()
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

local selectedPlayerName = playerList[1] or ""
local playerDropdown = createDropdown(teleportsTab, t("tp_player"), nextY(45), playerList, function(val)
    selectedPlayerName = val
end)
createButton(teleportsTab, t("tp_player"), nextY(45), function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name == selectedPlayerName then
            local targetHrp = getHRP(plr)
            if targetHrp and lp.Character then
                local hrp = getHRP(lp)
                if hrp then hrp.CFrame = targetHrp.CFrame end
            end
            break
        end
    end
end)

-- Waypoints
local waypointsList = getProfile().waypoints or {}
local function refreshWaypoints()
    for _, v in pairs(teleportsTab:GetChildren()) do
        if v.Name == "wp" or v.Name == "wpDel" then v:Destroy() end
    end
    local wy = 130
    for i, pos in ipairs(waypointsList) do
        local wpBtn = Instance.new("TextButton", teleportsTab)
        wpBtn.Name = "wp"
        wpBtn.Size = UDim2.new(0, 150 * uiScale, 0, 30 * uiScale)
        wpBtn.Position = UDim2.new(0, 20 * uiScale, 0, wy)
        wpBtn.Text = "WP " .. i
        wpBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        wpBtn.TextScaled = mobileMode
        Instance.new("UICorner", wpBtn).CornerRadius = UDim.new(0, 6)
        wpBtn.MouseButton1Click:Connect(function()
            if lp.Character then
                local hrp = getHRP(lp)
                if hrp then hrp.CFrame = CFrame.new(pos) end
            end
        end)
        
        local delBtn = Instance.new("TextButton", teleportsTab)
        delBtn.Name = "wpDel"
        delBtn.Size = UDim2.new(0, 40 * uiScale, 0, 30 * uiScale)
        delBtn.Position = UDim2.new(0, 180 * uiScale, 0, wy)
        delBtn.Text = "X"
        delBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        delBtn.TextScaled = mobileMode
        Instance.new("UICorner", delBtn).CornerRadius = UDim.new(0, 6)
        delBtn.MouseButton1Click:Connect(function()
            table.remove(waypointsList, i)
            getProfile().waypoints = waypointsList
            saveProfiles()
            refreshWaypoints()
        end)
        wy = wy + 40
    end
end

createButton(teleportsTab, t("add_waypoint"), 90, function()
    if lp.Character then
        local hrp = getHRP(lp)
        if hrp then
            table.insert(waypointsList, hrp.Position)
            getProfile().waypoints = waypointsList
            saveProfiles()
            refreshWaypoints()
        end
    end
end)
refreshWaypoints()

-- Exploits Tab
resetY()
createToggle(exploitsTab, t("autokick"), nextY(0), antiAFKEnabled, function(v)
    antiAFKEnabled = v
    if v then startAntiAFK() else stopAntiAFK() end
end)
createToggle(exploitsTab, t("autoclicker"), nextY(45), autoClickerEnabled, function(v)
    autoClickerEnabled = v
    if v then startAutoClicker() else stopAutoClicker() end
end)
createToggle(exploitsTab, t("chatspammer"), nextY(45), chatSpammerEnabled, function(v)
    chatSpammerEnabled = v
    if v then startChatSpammer() else stopChatSpammer() end
end)
createSlider(exploitsTab, t("spam_delay"), 0.5, 10, spamDelay, nextY(45), function(v)
    spamDelay = v
    getProfile().spamDelay = v
    saveProfiles()
    if chatSpammerEnabled then
        stopChatSpammer()
        startChatSpammer()
    end
end)
createToggle(exploitsTab, t("infiniteammo"), nextY(45), infiniteAmmoEnabled, function(v)
    infiniteAmmoEnabled = v
    RS.RenderStepped:Connect(applyWeaponMods)
end)
createToggle(exploitsTab, t("norecoil"), nextY(45), noRecoilEnabled, function(v)
    noRecoilEnabled = v
    RS.RenderStepped:Connect(applyWeaponMods)
end)
createToggle(exploitsTab, t("nofall"), nextY(45), noFallDamageEnabled, function(v)
    noFallDamageEnabled = v
    if v then
        RS.RenderStepped:Connect(noFallDamageLoop)
    end
end)
createToggle(exploitsTab, t("lagswitch"), nextY(45), lagSwitchEnabled, function(v)
    lagSwitchEnabled = v
    if v then
        if lagSwitchConnection then lagSwitchConnection:Disconnect() end
        lagSwitchConnection = RS.RenderStepped:Connect(lagSwitchLoop)
    else
        if lagSwitchConnection then lagSwitchConnection:Disconnect() end
        lagSwitchLoop()
    end
end)
createToggle(exploitsTab, t("autorespawn"), nextY(45), autoRespawnEnabled, function(v)
    autoRespawnEnabled = v
    autoRespawn()
end)
createToggle(exploitsTab, t("btools"), nextY(45), btoolsRangeEnabled, function(v)
    btoolsRangeEnabled = v
    setBToolsRange()
end)
createSlider(exploitsTab, t("btools"), 10, 200, btoolsRange, nextY(45), function(v)
    btoolsRange = v
    setBToolsRange()
end)

-- Fling Player dropdown
local flingPlayerName = playerList[1] or ""
local flingDropdown = createDropdown(exploitsTab, t("fling"), nextY(60), playerList, function(val)
    flingPlayerName = val
end)
createButton(exploitsTab, t("fling"), nextY(45), function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name == flingPlayerName then
            flingPlayer(plr)
            break
        end
    end
end)

-- Freeze Player dropdown
local freezePlayerName = playerList[1] or ""
local freezeDropdown = createDropdown(exploitsTab, t("freezeplayer"), nextY(60), playerList, function(val)
    freezePlayerName = val
end)
createButton(exploitsTab, t("freezeplayer"), nextY(45), function()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name == freezePlayerName then
            freezePlayer(plr)
            break
        end
    end
end)

-- Profiles Tab
resetY()
createButton(profilesTab, t("profile_new"), nextY(0), function()
    local name = "profile" .. tostring(#profiles + 1)
    profiles[name] = Http:JSONDecode(Http:JSONEncode(getProfile()))
    currentProfile = name
    saveProfiles()
end)
createButton(profilesTab, t("profile_switch"), nextY(45), function()
    local names = {}
    for k in pairs(profiles) do table.insert(names, k) end
    if #names > 0 then
        currentProfile = names[1]
        saveProfiles()
    end
end)
createButton(profilesTab, t("profile_save"), nextY(45), function()
    profiles[currentProfile] = getProfile()
    saveProfiles()
end)

-- Settings Tab
resetY()
createToggle(settingsTab, t("mobile_mode"), nextY(0), mobileMode, function(v)
    mobileMode = v
    -- Reload UI to apply scaling (simplified: just notify)
    print("Mobile mode: " .. tostring(v))
    saveProfiles()
end)
createSlider(settingsTab, t("ui_scale"), 0.5, 2, uiScale, nextY(60), function(v)
    uiScale = v
    saveProfiles()
    -- Notify restart required
    print("UI Scale changed. Restart script to apply.")
end)
createButton(settingsTab, t("rejoin"), nextY(60), function()
    TeleportService:Teleport(game.PlaceId, lp)
end)
createButton(settingsTab, t("serverhop"), nextY(45), function()
    TeleportService:Teleport(game.PlaceId)
end)

-- Language switcher
createButton(settingsTab, t("language"), nextY(45), function()
    if LANG == "EN" then
        LANG = "HE"
    else
        LANG = "EN"
    end
    saveProfiles()
    print("Language changed to " .. LANG .. ". Restart script to apply fully.")
end)

-- Finalize
switchPage(movementTab)

-- Heartbeat for movement and visual updates
RS.Heartbeat:Connect(function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        local hum = lp.Character.Humanoid
        hum.WalkSpeed = getProfile().walkspeed
        hum.JumpPower = getProfile().jumppower
    end
    camera.FieldOfView = getProfile().fov
    updateFly()
end)

print("Realms Hub loaded! Use the GUI to access 60+ exploits.")
