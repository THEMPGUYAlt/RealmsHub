local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer

local function getHum()
	local c=player.Character
	return c and c:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
	local c=player.Character
	return c and c:FindFirstChild("HumanoidRootPart")
end

local function detectLang()
	local ok,res=pcall(function()
		return LocalizationService.RobloxLocaleId
	end)
	if ok and res then
		res=res:lower()
		if res:find("es") then return "es"
		elseif res:find("he") then return "he"
		elseif res:find("fr") then return "fr"
		elseif res:find("de") then return "de"
	end end
	return "en"
end

local lang=detectLang()

local L={
	en={hub="Realmshub",on="ON",off="OFF",speed="Speed",jump="Jump",lang="Lang"},
	es={hub="Realmshub",on="ON",off="OFF",speed="Velocidad",jump="Salto",lang="Idioma"},
	he={hub="Realmshub",on="פועל",off="כבוי",speed="מהירות",jump="קפיצה",lang="שפה"},
	fr={hub="Realmshub",on="ON",off="OFF",speed="Vitesse",jump="Saut",lang="Langue"},
	de={hub="Realmshub",on="AN",off="AUS",speed="Geschwindigkeit",jump="Sprung",lang="Sprache"}
}

local gui=Instance.new("ScreenGui",game.CoreGui)

local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,340,0,260)
main.Position=UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3=Color3.fromRGB(20,20,20)
Instance.new("UICorner",main).CornerRadius=UDim.new(0,10)

local top=Instance.new("Frame",main)
top.Size=UDim2.new(1,0,0,30)
top.BackgroundTransparency=1

local title=Instance.new("TextLabel",top)
title.Size=UDim2.new(1,-80,1,0)
title.Position=UDim2.new(0,10,0,0)
title.BackgroundTransparency=1
title.TextColor3=Color3.new(1,1,1)
title.Font=Enum.Font.GothamBold
title.TextSize=14

local minimize=Instance.new("TextButton",top)
minimize.Size=UDim2.new(0,30,1,0)
minimize.Position=UDim2.new(1,-60,0,0)
minimize.Text="-"

local restore=Instance.new("TextButton",top)
restore.Size=UDim2.new(0,30,1,0)
restore.Position=UDim2.new(1,-30,0,0)
restore.Text="□"

local content=Instance.new("Frame",main)
content.Size=UDim2.new(1,0,1,-30)
content.Position=UDim2.new(0,0,0,30)
content.BackgroundTransparency=1

local minimized=false
minimize.MouseButton1Click:Connect(function()
	content.Visible=false
	main.Size=UDim2.new(0,340,0,30)
	minimized=true
end)

restore.MouseButton1Click:Connect(function()
	content.Visible=true
	main.Size=UDim2.new(0,340,0,260)
	minimized=false
end)

local dragging=false
local dragStart,startPos

top.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
		dragging=true
		dragStart=i.Position
		startPos=main.Position
	end
end)

UIS.InputChanged:Connect(function(i)
	if dragging then
		local d=i.Position-dragStart
		local newX=startPos.X.Offset+d.X
		local newY=startPos.Y.Offset+d.Y
		newX=math.clamp(newX,0,workspace.CurrentCamera.ViewportSize.X-340)
		newY=math.clamp(newY,0,workspace.CurrentCamera.ViewportSize.Y-30)
		main.Position=UDim2.new(0,newX,0,newY)
	end
end)

UIS.InputEnded:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
		dragging=false
	end
end)

local function makeToggle(y,callback)
	local b=Instance.new("TextButton",content)
	b.Size=UDim2.new(1,-20,0,30)
	b.Position=UDim2.new(0,10,0,y)
	b.BackgroundColor3=Color3.fromRGB(30,30,30)
	b.TextColor3=Color3.new(1,1,1)
	Instance.new("UICorner",b)

	local state=false
	local function update()
		local t=L[lang]
		b.Text=(state and t.on or t.off)
	end

	b.MouseButton1Click:Connect(function()
		state=not state
		callback(state)
		update()
	end)

	update()
	return function(on,off)
		local t=L[lang]
		b.Text=(state and on or off)
	end
end

local function slider(y,min,max,val,callback)
	local bar=Instance.new("Frame",content)
	bar.Size=UDim2.new(1,-20,0,6)
	bar.Position=UDim2.new(0,10,0,y)
	bar.BackgroundColor3=Color3.fromRGB(50,50,50)

	local fill=Instance.new("Frame",bar)
	fill.Size=UDim2.new(0.5,0,1,0)
	fill.BackgroundColor3=Color3.fromRGB(0,170,255)
	Instance.new("UICorner",bar)
	Instance.new("UICorner",fill)

	local dragging=false

	local function set(x)
		local p=math.clamp((x-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
		fill.Size=UDim2.new(p,0,1,0)
		callback(min+(max-min)*p)
	end

	bar.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			dragging=true
			set(i.Position.X)
		end
	end)

	UIS.InputChanged:Connect(function(i)
		if dragging then set(i.Position.X) end
	end)

	UIS.InputEnded:Connect(function()
		dragging=false
	end)
end

local speed=16
local speedEnabled=false
makeToggle(10,function(v)
	speedEnabled=v
end)

slider(50,16,200,speed,function(v)
	speed=v
end)

local fly=false
local flySpeed=60
makeToggle(90,function(v)
	fly=v
end)

slider(130,10,200,flySpeed,function(v)
	flySpeed=v
end)

local noclip=false
makeToggle(170,function(v)
	noclip=v
end)

local langs={"en","es","he","fr","de"}
local idx=table.find(langs,lang) or 1

local langBtn=Instance.new("TextButton",content)
langBtn.Size=UDim2.new(0,120,0,25)
langBtn.Position=UDim2.new(0,10,1,-30)

langBtn.MouseButton1Click:Connect(function()
	idx=idx%#langs+1
	lang=langs[idx]
end)

local flyDir=Vector3.zero

local mobileUp=Instance.new("TextButton",gui)
mobileUp.Size=UDim2.new(0,60,0,60)
mobileUp.Position=UDim2.new(1,-70,1,-70)
mobileUp.Text="↑"
mobileUp.Visible=UIS.TouchEnabled

mobileUp.TouchTap:Connect(function()
	flyDir=Vector3.new(0,1,0)
	task.wait(0.2)
	flyDir=Vector3.zero
end)

RunService.Heartbeat:Connect(function()
	local hum=getHum()
	local root=getRoot()
	if not hum or not root then return end

	if speedEnabled then
		hum.WalkSpeed=speed
	end

	if fly then
		root.Velocity=workspace.CurrentCamera.CFrame.LookVector*flySpeed
	end

	if noclip then
		for _,v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") then v.CanCollide=false end
		end
	end
end)

RunService.RenderStepped:Connect(function()
	title.Text=L[lang].hub
	langBtn.Text=L[lang].lang..": "..lang:upper()
end)
