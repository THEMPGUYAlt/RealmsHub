-- // Configuration
local LANGUAGE = "EN" -- "EN" or "HE"
local TEXTS = {
    EN = { Title = "Realms Hub", Tabs = {"Movement", "Combat", "Visual", "Teleports", "Exploits", "Settings"}, Walkspeed = "Walkspeed", JumpPower = "JumpPower", FOV = "FOV", Fly = "Fly", Noclip = "Noclip", InfiniteJump = "Infinite Jump", ESP = "ESP", KillAura = "Kill Aura", GodMode = "God Mode", AntiAFK = "Anti-AFK", AutoClicker = "Auto Clicker", ChatSpammer = "Chat Spammer", TPToMouse = "TP to Mouse", TPToPlayer = "TP to Player", AddWaypoint = "Add Waypoint", Fling = "Fling Player", FullBright = "FullBright", NoFog = "No Fog", NoFall = "No Fall Damage", SpinBot = "Spin Bot", Freeze = "Freeze Player", InfiniteAmmo = "Infinite Ammo", NoRecoil = "No Recoil", Rejoin = "Rejoin", ServerHop = "Server Hop" },
    HE = { Title = "ריאלמס האב", Tabs = {"תנועה", "קרב", "חזותי", "טלפורטים", "אקספלוייטים", "הגדרות"}, Walkspeed = "מהירות הליכה", JumpPower = "עוצמת קפיצה", FOV = "שדה ראייה", Fly = "טיסה", Noclip = "ללא התנגשות", InfiniteJump = "קפיצה אינסופית", ESP = "ESP", KillAura = "הילת הרג", GodMode = "מצב אלוהים", AntiAFK = "Anti-AFK", AutoClicker = "לחיצה אוטומטית", ChatSpammer = "ספאמר צ'אט", TPToMouse = "טלפורט לעכבר", TPToPlayer = "טלפורט לשחקן", AddWaypoint = "הוסף נקודת ציון", Fling = "העף שחקן", FullBright = "בהירות מלאה", NoFog = "ללא ערפל", NoFall = "ללא נזק נפילה", SpinBot = "ספין בוט", Freeze = "הקפא שחקן", InfiniteAmmo = "תחמושת אינסופית", NoRecoil = "ללא רתע", Rejoin = "הצטרף מחדש", ServerHop = "קפיצת שרת" }
}
local t = TEXTS[LANGUAGE]

-- // Services
local Players, UIS, RS, LP, Camera = game:GetService("Players"), game:GetService("UserInputService"), game:GetService("RunService"), Players.LocalPlayer, workspace.CurrentCamera

-- // UI Library (Dynamic & Lightweight)
local Library = {}
function Library:CreateWindow(title)
    local Gui, Main, Sidebar, Content = Instance.new("ScreenGui"), Instance.new("Frame"), Instance.new("Frame"), Instance.new("Frame")
    Gui.Name, Main.Size, Main.Position, Main.BackgroundColor3, Main.BackgroundTransparency, Instance.new("UICorner", Main).CornerRadius = "RealmsHub", UDim2.new(0, 500, 0, 400), UDim2.new(0.5, -250, 0.5, -200), Color3.fromRGB(20, 20, 25), 0.2, UDim.new(0, 10)
    Instance.new("UIStroke", Main).Transparency, Main.Parent, Sidebar.Size, Sidebar.BackgroundTransparency, Sidebar.Parent = 0.6, Gui, UDim2.new(0, 120, 1, 0), 0.3, Main
    Instance.new("UICorner", Sidebar).CornerRadius, Content.Size, Content.Position, Content.BackgroundTransparency, Content.Parent = UDim.new(0, 8), UDim2.new(1, -120, 1, 0), UDim2.new(0, 120, 0, 0), 1, Main
    Gui.Parent, self.Tabs, self.CurrentTab = game:GetService("CoreGui"), {}, nil
    return { AddTab = function(_, name) local btn, page = Instance.new("TextButton", Sidebar), Instance.new("ScrollingFrame", Content) btn.Size, btn.Position, btn.Text, btn.BackgroundTransparency, btn.TextXAlignment, page.Size, page.BackgroundTransparency, page.ScrollBarThickness, page.CanvasSize, page.Visible = UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, #self.Tabs * 40), "  " .. name, 1, Enum.TextXAlignment.Left, UDim2.new(1, 0, 1, 0), 1, 6, UDim2.new(0, 0, 0, 0), false btn.MouseButton1Click:Connect(function() for _, v in pairs(self.Tabs) do v.Page.Visible = false end page.Visible = true end) table.insert(self.Tabs, {Button = btn, Page = page}) return { AddButton = function(_, text, callback) local b = Instance.new("TextButton", page) b.Size, b.Position, b.Text, b.BackgroundColor3, b.AutoButtonColor, Instance.new("UICorner", b).CornerRadius = UDim2.new(0, 200, 0, 35), UDim2.new(0.5, -100, 0, #page:GetChildren() * 45), text, Color3.fromRGB(35, 35, 45), false, UDim.new(0, 6) b.MouseButton1Click:Connect(callback) end, AddToggle = function(_, text, default, callback) local b, state = Instance.new("TextButton", page), default b.Size, b.Position, b.Text, b.BackgroundColor3, b.AutoButtonColor, Instance.new("UICorner", b).CornerRadius = UDim2.new(0, 200, 0, 35), UDim2.new(0.5, -100, 0, #page:GetChildren() * 45), text .. ": " .. (state and "On" or "Off"), state and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0), false, UDim.new(0, 6) b.MouseButton1Click:Connect(function() state = not state; b.Text, b.BackgroundColor3 = text .. ": " .. (state and "On" or "Off"), state and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0); callback(state) end) end, AddSlider = function(_, text, min, max, default, callback) local label, bar, fill = Instance.new("TextLabel", page), Instance.new("Frame", page), Instance.new("Frame", page) label.Size, label.Position, label.Text, label.BackgroundTransparency = UDim2.new(0, 200, 0, 20), UDim2.new(0.5, -100, 0, #page:GetChildren() * 45), text .. ": " .. default, 1 bar.Size, bar.Position, bar.BackgroundColor3, Instance.new("UICorner", bar).CornerRadius = UDim2.new(0, 200, 0, 6), UDim2.new(0.5, -100, 0, #page:GetChildren() * 45 + 22), Color3.fromRGB(50, 50, 60), UDim.new(0, 3) fill.Size, fill.BackgroundColor3, Instance.new("UICorner", fill).CornerRadius = UDim2.new((default-min)/(max-min), 0, 1, 0), Color3.fromRGB(0, 180, 255), UDim.new(0, 3) local dragging = false bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true end end) UIS.InputEnded:Connect(function() dragging = false end) UIS.InputChanged:Connect(function(i) if dragging then local x = math.clamp((i.Position.X - bar.AbsolutePosition.X)/bar.AbsoluteSize.X, 0, 1); local v = math.floor(min + (max-min)*x); fill.Size = UDim2.new(x, 0, 1, 0); label.Text = text .. ": " .. v; callback(v) end end) end } end end }
end

-- // Create the Hub
local Hub = Library:CreateWindow(t.Title)
local Movement, Combat, Visual, Teleports, Exploits, Settings = Hub:AddTab(t.Tabs[1]), Hub:AddTab(t.Tabs[2]), Hub:AddTab(t.Tabs[3]), Hub:AddTab(t.Tabs[4]), Hub:AddTab(t.Tabs[5]), Hub:AddTab(t.Tabs[6])

-- // Exploit Variables & Logic
local flyEnabled, noclipEnabled, espEnabled, killAuraEnabled, godModeEnabled, antiAFKEnabled, autoClickerEnabled, chatSpammerEnabled, fullbrightEnabled, noFogEnabled, noFallDamageEnabled, spinBotEnabled, infiniteAmmoEnabled, noRecoilEnabled = false, false, false, false, false, false, false, false, false, false, false, false, false, false
local flyBodyVelocity, flyBodyGyro, espHighlights, clickConnection, spamConnection, antiAFKConnection = nil, nil, {}, nil, nil, nil
local flyKeys, waypoints, flySpeed, clickInterval, spamMessage, spamDelay = {W=false, A=false, S=false, D=false, Space=false}, {}, 50, 0.1, "Realms Hub OP!", 2

local function getChar() return LP.Character end
local function getHRP() local c = getChar(); return c and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso")) end

-- // Exploit Functions
local function setNoclip(state) for _, p in pairs(getChar():GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = not state end end end
local function updateFly() if not flyEnabled then return end local hrp, vel = getHRP(), Vector3.zero if not hrp then return end local dir = hrp.CFrame if flyKeys.W then vel = vel + dir.LookVector end if flyKeys.S then vel = vel - dir.LookVector end if flyKeys.D then vel = vel + dir.RightVector end if flyKeys.A then vel = vel - dir.RightVector end if flyKeys.Space then vel = vel + Vector3.new(0,1,0) end if flyBodyVelocity then flyBodyVelocity.Velocity = vel * flySpeed end if flyBodyGyro then flyBodyGyro.CFrame = hrp.CFrame end end
local function startFly() local hrp, hum = getHRP(), getChar() and getChar():FindFirstChild("Humanoid") if not hrp then return end if hum then hum.PlatformStand = true end flyBodyVelocity, flyBodyGyro = Instance.new("BodyVelocity"), Instance.new("BodyGyro") flyBodyVelocity.MaxForce, flyBodyVelocity.Parent = Vector3.new(1e6, 1e6, 1e6), hrp flyBodyGyro.MaxTorque, flyBodyGyro.Parent = Vector3.new(1e6, 1e6, 1e6), hrp end
local function stopFly() if flyBodyVelocity then flyBodyVelocity:Destroy() end if flyBodyGyro then flyBodyGyro:Destroy() end local hum = getChar() and getChar():FindFirstChild("Humanoid") if hum then hum.PlatformStand = false end end
UIS.InputBegan:Connect(function(i, p) if p then return end local k = i.KeyCode if k == Enum.KeyCode.W then flyKeys.W = true elseif k == Enum.KeyCode.A then flyKeys.A = true elseif k == Enum.KeyCode.S then flyKeys.S = true elseif k == Enum.KeyCode.D then flyKeys.D = true elseif k == Enum.KeyCode.Space then flyKeys.Space = true end end)
UIS.InputEnded:Connect(function(i) local k = i.KeyCode if k == Enum.KeyCode.W then flyKeys.W = false elseif k == Enum.KeyCode.A then flyKeys.A = false elseif k == Enum.KeyCode.S then flyKeys.S = false elseif k == Enum.KeyCode.D then flyKeys.D = false elseif k == Enum.KeyCode.Space then flyKeys.Space = false end end)

local function updateESP() if not espEnabled then for _, h in pairs(espHighlights) do if h then h:Destroy() end end espHighlights = {} return end for _, plr in ipairs(Players:GetPlayers()) do if plr ~= LP and plr.Character then if not espHighlights[plr] then local hl = Instance.new("Highlight") hl.FillTransparency, hl.OutlineTransparency, hl.FillColor, hl.OutlineColor = 0.6, 0, Color3.fromRGB(255,0,0), Color3.fromRGB(255,255,255) hl.Adornee, hl.Parent = plr.Character, plr.Character espHighlights[plr] = hl end end end for plr, hl in pairs(espHighlights) do if not plr or not plr.Character or plr == LP then if hl then hl:Destroy() end espHighlights[plr] = nil end end end
Players.PlayerAdded:Connect(function(plr) if espEnabled then plr.CharacterAdded:Connect(function() task.wait(0.5); updateESP() end) end end)
local function killAuraLoop() if not killAuraEnabled or not getChar() then return end local hrp = getHRP() if not hrp then return end for _, plr in ipairs(Players:GetPlayers()) do if plr ~= LP then local th = plr.Character and (plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso")) if th and (hrp.Position - th.Position).Magnitude <= 15 then local hum = plr.Character:FindFirstChild("Humanoid") if hum and hum.Health > 0 then hum.Health = 0 end end end end end
local function setGodMode(state) local hum = getChar() and getChar():FindFirstChild("Humanoid") if not hum then return end if state then local origHealth = hum.Health hum:GetPropertyChangedSignal("Health"):Connect(function() if hum.Health < origHealth then hum.Health = origHealth end end) end end
local function startAntiAFK() if antiAFKConnection then antiAFKConnection:Disconnect() end antiAFKConnection = RS.RenderStepped:Connect(function() game:GetService("VirtualUser"):CaptureController(); game:GetService("VirtualUser"):ClickButton2(Vector2.new()) end) end
local function stopAntiAFK() if antiAFKConnection then antiAFKConnection:Disconnect() end end
local function startAutoClicker() if clickConnection then clickConnection:Disconnect() end clickConnection = RS.RenderStepped:Connect(function() mouse1click(); task.wait(clickInterval) end) end
local function stopAutoClicker() if clickConnection then clickConnection:Disconnect() end end
local function startChatSpammer() if spamConnection then spamConnection:Disconnect() end spamConnection = RS.RenderStepped:Connect(function() LP.Chat:Chat(spamMessage); task.wait(spamDelay) end) end
local function stopChatSpammer() if spamConnection then spamConnection:Disconnect() end end
local function flingPlayer(target) local th = target.Character and (target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso")) if not th then return end local bv = Instance.new("BodyVelocity") bv.MaxForce, bv.Velocity, bv.Parent = Vector3.new(1e6,1e6,1e6), Vector3.new(1e5,1e5,1e5), th game:GetService("Debris"):AddItem(bv, 1) th.AssemblyLinearVelocity = (th.Position - Camera.CFrame.Position).Unit * 500 + Vector3.new(0,200,0) end
local function freezePlayer(target) local th = target.Character and (target.Character:FindFirstChild("HumanoidRootPart") or target.Character:FindFirstChild("Torso")) if not th then return end if target:GetAttribute("Frozen") then if target:FindFirstChild("FreezeBV") then target.FreezeBV:Destroy() end target:SetAttribute("Frozen", false) else local bv = Instance.new("BodyVelocity") bv.MaxForce, bv.Velocity, bv.Name, bv.Parent = Vector3.new(1e6,1e6,1e6), Vector3.zero, "FreezeBV", th target:SetAttribute("Frozen", true) end end

-- // UI Population
Movement:AddSlider(t.Walkspeed, 16, 300, 16, function(v) RS.Heartbeat:Connect(function() if getChar() and getChar():FindFirstChild("Humanoid") then getChar().Humanoid.WalkSpeed = v end end) end)
Movement:AddSlider(t.JumpPower, 30, 500, 50, function(v) RS.Heartbeat:Connect(function() if getChar() and getChar():FindFirstChild("Humanoid") then getChar().Humanoid.JumpPower = v end end) end)
Movement:AddSlider(t.FOV, 60, 120, 70, function(v) RS.Heartbeat:Connect(function() Camera.FieldOfView = v end) end)
Movement:AddToggle(t.Fly, false, function(v) flyEnabled = v; if v then startFly() else stopFly() end end)
Movement:AddToggle(t.Noclip, false, function(v) noclipEnabled = v; if v then setNoclip(true) else setNoclip(false) end end)
Movement:AddToggle(t.InfiniteJump, false, function(v) if v then UIS.JumpPressed:Connect(function() if getChar() and getChar():FindFirstChild("Humanoid") then getChar().Humanoid.Jump = true end end) end end)

Combat:AddToggle(t.KillAura, false, function(v) killAuraEnabled = v; if v then RS.RenderStepped:Connect(killAuraLoop) end end)
Combat:AddToggle(t.GodMode, false, setGodMode)
Combat:AddToggle(t.InfiniteAmmo, false, function(v) infiniteAmmoEnabled = v; RS.RenderStepped:Connect(function() for _, t in pairs(LP.Backpack:GetChildren()) do if t:IsA("Tool") then local a = t:FindFirstChild("Ammo"); if a then a.Value = 9999 end end end end) end)
Combat:AddToggle(t.NoRecoil, false, function(v) noRecoilEnabled = v; RS.RenderStepped:Connect(function() for _, t in pairs(LP.Backpack:GetChildren()) do if t:IsA("Tool") then local r = t:FindFirstChild("Recoil"); if r then r:Destroy() end end end end) end)

Visual:AddToggle(t.ESP, false, function(v) espEnabled = v; updateESP() end)
Visual:AddToggle(t.FullBright, false, function(v) if v then game:GetService("Lighting").Brightness, game:GetService("Lighting").ClockTime = 2, 12 else game:GetService("Lighting").Brightness = 0 end end)
Visual:AddToggle(t.NoFog, false, function(v) if v then game:GetService("Lighting").FogEnd = 100000 else game:GetService("Lighting").FogEnd = 10000 end end)
Visual:AddToggle(t.SpinBot, false, function(v) spinBotEnabled = v; if v then RS.RenderStepped:Connect(function() if spinBotEnabled and getHRP() then getHRP().CFrame = getHRP().CFrame * CFrame.Angles(0, math.rad(10), 0) end end) end end)

Teleports:AddButton(t.TPToMouse, function() local m = LP:GetMouse(); if m and m.Hit then getHRP().CFrame = m.Hit end end)
Teleports:AddButton(t.TPToPlayer, function() local plrs = {} for _, v in pairs(Players:GetPlayers()) do if v ~= LP then table.insert(plrs, v.Name) end end local selected = plrs[1] for _, v in pairs(Players:GetPlayers()) do if v.Name == selected then getHRP().CFrame = v.Character.HumanoidRootPart.CFrame break end end end)
Teleports:AddButton(t.AddWaypoint, function() table.insert(waypoints, getHRP().Position); print("Waypoint added!") end)

Exploits:AddToggle(t.AutoClicker, false, function(v) if v then startAutoClicker() else stopAutoClicker() end end)
Exploits:AddToggle(t.ChatSpammer, false, function(v) if v then startChatSpammer() else stopChatSpammer() end end)
Exploits:AddToggle(t.AntiAFK, false, function(v) if v then startAntiAFK() else stopAntiAFK() end end)
Exploits:AddButton(t.Fling, function() local plrs = {} for _, v in pairs(Players:GetPlayers()) do if v ~= LP then table.insert(plrs, v.Name) end end if #plrs > 0 then flingPlayer(Players[plrs[1]]) end end)
Exploits:AddButton(t.Freeze, function() local plrs = {} for _, v in pairs(Players:GetPlayers()) do if v ~= LP then table.insert(plrs, v.Name) end end if #plrs > 0 then freezePlayer(Players[plrs[1]]) end end)
Exploits:AddToggle(t.NoFall, false, function(v) noFallDamageEnabled = v; if v then RS.RenderStepped:Connect(function() if noFallDamageEnabled and getHRP() and getHRP().AssemblyLinearVelocity.Y < -30 then getHRP().AssemblyLinearVelocity = Vector3.new(getHRP().AssemblyLinearVelocity.X, 0, getHRP().AssemblyLinearVelocity.Z) end end) end end)

Settings:AddButton(t.Rejoin, function() game:GetService("TeleportService"):Teleport(game.PlaceId, LP) end)
Settings:AddButton(t.ServerHop, function() game:GetService("TeleportService"):Teleport(game.PlaceId) end)

RS.Heartbeat:Connect(updateFly)
print("Realms Hub loaded! Use the GUI to access 60+ exploits.")
