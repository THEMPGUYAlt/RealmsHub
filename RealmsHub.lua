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
	end end
	return "en"
end

local lang = detectLang()

local L = {
	en={hub="Realmshub",movement="Movement",player="Player",world="World",misc="Misc",on="ON",off="OFF"},
	es={hub="Realmshub",movement="Movimiento",player="Jugador",world="Mundo",misc="Extra",on="ON",off="OFF"},
	he={hub="Realmshub",movement="תנועה",player="שחקן",world="עולם",misc="נוסף",on="פועל",off="כבוי"},
	fr={hub="Realmshub",movement="Mouvement",player="Joueur",world="Monde",misc="Divers",on="ON",off="OFF"}
}

local gui=Instance.new("ScreenGui",game.CoreGui)

local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,380,0,280)
main.Position=UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3=Color3.fromRGB(18,18,18)
Instance.new("UICorner",main)

local title=Instance.new("TextLabel",main)
title.Size=UDim2.new(1,0,0,30)
title.BackgroundTransparency=1
title.TextColor3=Color3.new(1,1,1)
title.Font=Enum.Font.GothamBold

local tabBar=Instance.new("Frame",main)
tabBar.Size=UDim2.new(1,0,0,30)
tabBar.Position=UDim2.new(0,0,0,30)
tabBar.BackgroundTransparency=1

local pages=Instance.new("Frame",main)
pages.Size=UDim2.new(1,0,1,-60)
pages.Position=UDim2.new(0,0,0,60)
pages.BackgroundTransparency=1

local function newPage()
	local f=Instance.new("Frame",pages)
	f.Size=UDim2.new(1,0,1,0)
	f.BackgroundTransparency=1
	f.Visible=false
	return f
end

local movementPage=newPage()
local playerPage=newPage()
local worldPage=newPage()
local miscPage=newPage()
movementPage.Visible=true

local function switchPage(p)
	for _,v in pairs(pages:GetChildren()) do v.Visible=false end
	p.Visible=true
	p.BackgroundTransparency=1
	TweenService:Create(p,TweenInfo.new(0.2),{BackgroundTransparency=0}):Play()
end

local function tab(x,name,page)
	local b=Instance.new("TextButton",tabBar)
	b.Size=UDim2.new(0.25,0,1,0)
	b.Position=UDim2.new(x,0,0,0)
	b.BackgroundColor3=Color3.fromRGB(25,25,25)
	b.TextColor3=Color3.new(1,1,1)
	Instance.new("UICorner",b)
	b.MouseButton1Click:Connect(function() switchPage(page) end)
	return b,name
end

local tabs={}
table.insert(tabs,{tab(0,"movement",movementPage)})
table.insert(tabs,{tab(0.25,"player",playerPage)})
table.insert(tabs,{tab(0.5,"world",worldPage)})
table.insert(tabs,{tab(0.75,"misc",miscPage)})

local toggles={}

local function toggle(parent,y,label,callback)
	local b=Instance.new("TextButton",parent)
	b.Size=UDim2.new(1,-20,0,35)
	b.Position=UDim2.new(0,10,0,y)
	b.BackgroundColor3=Color3.fromRGB(28,28,28)
	b.TextColor3=Color3.new(1,1,1)
	Instance.new("UICorner",b)

	local state=false
	local t={
		btn=b,label=label,
		set=function()
			local txt=L[lang]
			b.Text=label..": "..(state and txt.on or txt.off)
		end
	}

	b.MouseButton1Click:Connect(function()
		state=not state
		callback(state)
		TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(40,40,40)}):Play()
		task.delay(0.1,function()
			TweenService:Create(b,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(28,28,28)}):Play()
		end)
		t.set()
	end)

	table.insert(toggles,t)
	t.set()
	return t,function() return state end
end

local function slider(parent,y,min,max,val,callback)
	local bar=Instance.new("Frame",parent)
	bar.Size=UDim2.new(1,-20,0,6)
	bar.Position=UDim2.new(0,10,0,y)
	bar.BackgroundColor3=Color3.fromRGB(50,50,50)

	local fill=Instance.new("Frame",bar)
	fill.Size=UDim2.new(0.5,0,1,0)
	fill.BackgroundColor3=Color3.fromRGB(0,170,255)
	Instance.new("UICorner",bar)
	Instance.new("UICorner",fill)

	local function set(x)
		local p=math.clamp((x-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
		fill.Size=UDim2.new(p,0,1,0)
		callback(min+(max-min)*p)
	end

	bar.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			set(i.Position.X)
		end
	end)
end

local originalSpeed=16
local speedVal=16
local speedEnabled=false

toggle(movementPage,10,"Speed",function(v)
	speedEnabled=v
	if not v then
		local h=getHum()
		if h then h.WalkSpeed=originalSpeed end
	end
end)

slider(movementPage,50,16,200,16,function(v)
	speedVal=v
end)

local fly=false
local flySpeed=60

toggle(movementPage,90,"Fly",function(v) fly=v end)
slider(movementPage,130,10,200,60,function(v) flySpeed=v end)

local noclip=false
toggle(movementPage,170,"Noclip",function(v) noclip=v end)

local infJump=false
toggle(playerPage,10,"InfJump",function(v) infJump=v end)

local gravity=workspace.Gravity
slider(worldPage,10,0,196,gravity,function(v) workspace.Gravity=v end)

local fov=70
slider(worldPage,50,60,120,fov,function(v) workspace.CurrentCamera.FieldOfView=v end)

local wf=false
local wfPower=12000
toggle(miscPage,10,"WalkFling",function(v) wf=v end)
slider(miscPage,50,2000,50000,wfPower,function(v) wfPower=v end)

UIS.InputBegan:Connect(function(i,g)
	if g then return end
	if infJump and i.KeyCode==Enum.KeyCode.Space then
		local h=getHum()
		if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
	end
end)

RunService.Heartbeat:Connect(function()
	local h=getHum()
	local root=getRoot()
	if not h or not root then return end

	if not originalSpeed or originalSpeed==0 then
		originalSpeed=h.WalkSpeed
	end

	if speedEnabled then
		h.WalkSpeed=speedVal
	end

	if fly then
		root.Velocity=workspace.CurrentCamera.CFrame.LookVector*flySpeed
	end

	if noclip then
		for _,v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") then v.CanCollide=false end
		end
	end

	if wf then
		local vel=root.Velocity
		root.Velocity=vel*(wfPower/1000)+Vector3.new(0,wfPower/2000,0)
	end
end)

local function updateText()
	title.Text=L[lang].hub
	for _,t in pairs(toggles) do t.set() end
end

updateText()
