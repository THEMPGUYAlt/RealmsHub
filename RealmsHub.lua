local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer

local function detectLang()
	local ok, res = pcall(function()
		return LocalizationService.RobloxLocaleId
	end)
	if ok and res then
		res = string.lower(res)
		if res:find("es") then return "es"
		elseif res:find("he") then return "he" end
	end
	return "en"
end

local lang = detectLang()

local L = {
	en = {hub="Realmshub",walk="WalkFling",fly="Fly",noclip="Noclip",on="ON",off="OFF",power="Power",speed="Speed"},
	es = {hub="Realmshub",walk="WalkFling",fly="Volar",noclip="Noclip",on="ON",off="OFF",power="Potencia",speed="Velocidad"},
	he = {hub="Realmshub",walk="ווקפלינג",fly="תעופה",noclip="נוקליפ",on="פועל",off="כבוי",power="עוצמה",speed="מהירות"}
}

local function getRoot(c) return c and c:FindFirstChild("HumanoidRootPart") end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "Realmshub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 220)
frame.Position = UDim2.new(0, 120, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", frame).Color = Color3.fromRGB(40,40,40)

local dragging, dragStart, startPos
frame.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dragging=true
		dragStart=i.Position
		startPos=frame.Position
		i.Changed:Connect(function()
			if i.UserInputState==Enum.UserInputState.End then dragging=false end
		end)
	end
end)
UIS.InputChanged:Connect(function(i)
	if dragging then
		local d=i.Position-dragStart
		frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
	end
end)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(220,220,220)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local tabs = Instance.new("Frame", frame)
tabs.Size = UDim2.new(1,0,0,30)
tabs.Position = UDim2.new(0,0,0,30)
tabs.BackgroundTransparency = 1

local pages = Instance.new("Frame", frame)
pages.Size = UDim2.new(1,0,1,-60)
pages.Position = UDim2.new(0,0,0,60)
pages.BackgroundTransparency = 1

local function newPage()
	local p = Instance.new("Frame", pages)
	p.Size = UDim2.new(1,0,1,0)
	p.BackgroundTransparency = 1
	p.Visible = false
	return p
end

local walkPage = newPage()
local flyPage = newPage()
local noclipPage = newPage()

local function makeTab(text, pos, page)
	local b = Instance.new("TextButton", tabs)
	b.Size = UDim2.new(0.33,0,1,0)
	b.Position = pos
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	b.TextColor3 = Color3.fromRGB(200,200,200)
	b.Font = Enum.Font.Gotham
	b.TextSize = 12
	Instance.new("UICorner", b)

	b.MouseButton1Click:Connect(function()
		for _,v in pairs(pages:GetChildren()) do v.Visible=false end
		page.Visible=true
	end)

	return b
end

local walkTab = makeTab("",UDim2.new(0,0,0,0),walkPage)
local flyTab = makeTab("",UDim2.new(0.33,0,0,0),flyPage)
local noclipTab = makeTab("",UDim2.new(0.66,0,0,0),noclipPage)

walkPage.Visible = true

local function createToggle(parent,y,callback)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(1,-20,0,35)
	b.Position = UDim2.new(0,10,0,y)
	b.BackgroundColor3 = Color3.fromRGB(25,25,25)
	b.TextColor3 = Color3.fromRGB(200,200,200)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 14
	Instance.new("UICorner", b)

	local state=false
	b.MouseButton1Click:Connect(function()
		state=not state
		callback(state)
	end)

	return b,function(txtOn,txtOff)
		b.Text = state and txtOn or txtOff
	end
end

local function createSlider(parent,y,min,max,default,callback)
	local bar = Instance.new("Frame", parent)
	bar.Size = UDim2.new(1,-20,0,8)
	bar.Position = UDim2.new(0,10,0,y)
	bar.BackgroundColor3 = Color3.fromRGB(30,30,30)

	local fill = Instance.new("Frame", bar)
	fill.Size = UDim2.new(0.5,0,1,0)
	fill.BackgroundColor3 = Color3.fromRGB(0,170,255)

	Instance.new("UICorner", bar)
	Instance.new("UICorner", fill)

	local dragging=false

	local function set(x)
		local p = math.clamp((x-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
		fill.Size = UDim2.new(p,0,1,0)
		callback(min+(max-min)*p)
	end

	bar.InputBegan:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			dragging=true set(i.Position.X)
		end
	end)

	UIS.InputChanged:Connect(function(i)
		if dragging then
			if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then
				set(i.Position.X)
			end
		end
	end)

	UIS.InputEnded:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			dragging=false
		end
	end)
end

local wf=false
local wfPower=12000

local wfToggle, wfText = createToggle(walkPage,10,function(v) wf=v end)
createSlider(walkPage,60,2000,50000,wfPower,function(v) wfPower=v end)

local fly=false
local flySpeed=50

local flyToggle, flyText = createToggle(flyPage,10,function(v) fly=v end)
createSlider(flyPage,60,10,200,flySpeed,function(v) flySpeed=v end)

local noclip=false
local ncToggle, ncText = createToggle(noclipPage,10,function(v) noclip=v end)

local function applyLang()
	local t=L[lang]
	title.Text=t.hub
	walkTab.Text=t.walk
	flyTab.Text=t.fly
	noclipTab.Text=t.noclip
	wfText(t.on,t.off)
	flyText(t.on,t.off)
	ncText(t.on,t.off)
end

local function stabilize(root)
	local ray=Ray.new(root.Position,Vector3.new(0,-6,0))
	local hit=workspace:FindPartOnRay(ray,player.Character)
	if hit then
		root.Velocity=Vector3.new(root.Velocity.X,math.max(root.Velocity.Y,5),root.Velocity.Z)
	else
		root.Velocity=root.Velocity+Vector3.new(0,15,0)
	end
end

RunService.Heartbeat:Connect(function()
	local char=player.Character
	local root=getRoot(char)
	if not root then return end

	if wf then
		local vel=root.Velocity
		root.Velocity=vel*(wfPower/1000)+Vector3.new(0,wfPower/2000,0)
		RunService.RenderStepped:Wait()
		root.Velocity=vel
		stabilize(root)
	end

	if fly then
		local dir=Vector3.zero
		if UIS:IsKeyDown(Enum.KeyCode.W) then dir=dir+workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then dir=dir-workspace.CurrentCamera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then dir=dir-workspace.CurrentCamera.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then dir=dir+workspace.CurrentCamera.CFrame.RightVector end
		root.Velocity=dir*flySpeed
	end

	if noclip then
		for _,v in pairs(char:GetDescendants()) do
			if v:IsA("BasePart") then v.CanCollide=false end
		end
	end
end)

applyLang()
