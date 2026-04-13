local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer

local function getHum()
	return player.Character and player.Character:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
	return player.Character and player.Character:FindFirstChild("HumanoidRootPart")
end

local function detectLang()
	local ok,res = pcall(function()
		return LocalizationService.RobloxLocaleId
	end)
	if ok and res then
		res = res:lower()
		if res:find("es") then return "es"
		elseif res:find("he") then return "he"
		elseif res:find("fr") then return "fr"
		elseif res:find("de") then return "de"
	end end
	return "en"
end

local lang = detectLang()

local L = {
	en = {hub="Realmshub",movement="Movement",player="Player",misc="Misc",on="ON",off="OFF",speed="Speed",fly="Fly",noclip="Noclip",lang="Language"},
	es = {hub="Realmshub",movement="Movimiento",player="Jugador",misc="Extra",on="ON",off="OFF",speed="Velocidad",fly="Volar",noclip="Noclip",lang="Idioma"},
	he = {hub="Realmshub",movement="תנועה",player="שחקן",misc="נוסף",on="פועל",off="כבוי",speed="מהירות",fly="תעופה",noclip="נוקליפ",lang="שפה"},
	fr = {hub="Realmshub",movement="Mouvement",player="Joueur",misc="Divers",on="ON",off="OFF",speed="Vitesse",fly="Voler",noclip="Noclip",lang="Langue"},
	de = {hub="Realmshub",movement="Bewegung",player="Spieler",misc="Extra",on="AN",off="AUS",speed="Geschwindigkeit",fly="Fliegen",noclip="Noclip",lang="Sprache"}
}

local gui = Instance.new("ScreenGui", game.CoreGui)

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,360,0,260)
main.Position = UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)
Instance.new("UICorner", main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local tabBar = Instance.new("Frame", main)
tabBar.Size = UDim2.new(1,0,0,30)
tabBar.Position = UDim2.new(0,0,0,30)
tabBar.BackgroundTransparency = 1

local pages = Instance.new("Frame", main)
pages.Size = UDim2.new(1,0,1,-60)
pages.Position = UDim2.new(0,0,0,60)
pages.BackgroundTransparency = 1

local function newPage()
	local f = Instance.new("Frame", pages)
	f.Size = UDim2.new(1,0,1,0)
	f.BackgroundTransparency = 1
	f.Visible = false
	return f
end

local movementPage = newPage()
local playerPage = newPage()
local miscPage = newPage()

movementPage.Visible = true

local function switchPage(p)
	for _,v in pairs(pages:GetChildren()) do
		v.Visible = false
	end
	p.Visible = true
	p.BackgroundTransparency = 1
	TweenService:Create(p, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
end

local function makeTab(x, key, page)
	local b = Instance.new("TextButton", tabBar)
	b.Size = UDim2.new(0.33,0,1,0)
	b.Position = UDim2.new(x,0,0,0)
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	b.TextColor3 = Color3.new(1,1,1)
	b.Font = Enum.Font.Gotham
	b.TextSize = 13
	Instance.new("UICorner", b)

	b.MouseButton1Click:Connect(function()
		switchPage(page)
	end)

	return b, key
end

local tabButtons = {}

local t1,k1 = makeTab(0,"movement",movementPage)
local t2,k2 = makeTab(0.33,"player",playerPage)
local t3,k3 = makeTab(0.66,"misc",miscPage)

table.insert(tabButtons,{btn=t1,key=k1})
table.insert(tabButtons,{btn=t2,key=k2})
table.insert(tabButtons,{btn=t3,key=k3})

local toggles = {}

local function createToggle(parent,y,key,callback)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(1,-20,0,35)
	b.Position = UDim2.new(0,10,0,y)
	b.BackgroundColor3 = Color3.fromRGB(28,28,28)
	b.TextColor3 = Color3.new(1,1,1)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	Instance.new("UICorner", b)

	local state = false

	local data = {
		button = b,
		key = key,
		set = function()
			local t = L[lang]
			b.Text = t[key] .. ": " .. (state and t.on or t.off)
		end
	}

	b.MouseButton1Click:Connect(function()
		state = not state
		callback(state)

		TweenService:Create(b, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
		task.delay(0.1,function()
			TweenService:Create(b, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(28,28,28)}):Play()
		end)

		data.set()
	end)

	table.insert(toggles,data)
	data.set()
	return data
end

local speedEnabled = false
createToggle(movementPage,10,"speed",function(v)
	speedEnabled = v
end)

local fly = false
createToggle(movementPage,60,"fly",function(v)
	fly = v
end)

local noclip = false
createToggle(movementPage,110,"noclip",function(v)
	noclip = v
end)

local langBtn = Instance.new("TextButton", miscPage)
langBtn.Size = UDim2.new(1,-20,0,35)
langBtn.Position = UDim2.new(0,10,0,10)
langBtn.BackgroundColor3 = Color3.fromRGB(28,28,28)
langBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", langBtn)

local langs = {"en","es","he","fr","de"}
local idx = table.find(langs, lang) or 1

langBtn.MouseButton1Click:Connect(function()
	idx = idx % #langs + 1
	lang = langs[idx]
	updateText()
end)

function updateText()
	local t = L[lang]
	title.Text = t.hub
	langBtn.Text = t.lang .. ": " .. lang:upper()

	for _,tab in pairs(tabButtons) do
		tab.btn.Text = t[tab.key]
	end

	for _,tg in pairs(toggles) do
		tg.set()
	end
end

RunService.Heartbeat:Connect(function()
	local hum = getHum()
	local root = getRoot()
	if not hum or not root then return end

	if speedEnabled then
		hum.WalkSpeed = 60
	end

	if fly then
		root.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
	end

	if noclip then
		for _,v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

updateText()
