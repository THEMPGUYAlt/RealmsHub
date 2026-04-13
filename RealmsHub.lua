local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer

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
		end
	end
	return "en"
end

local lang = detectLang()

local L = {
	en={hub="Realmshub",movement="Movement",player="Player",misc="Misc",on="ON",off="OFF",speed="Speed",jump="Jump"},
	es={hub="Realmshub",movement="Movimiento",player="Jugador",misc="Extra",on="ON",off="OFF",speed="Velocidad",jump="Salto"},
	he={hub="Realmshub",movement="תנועה",player="שחקן",misc="נוסף",on="פועל",off="כבוי",speed="מהירות",jump="קפיצה"},
	fr={hub="Realmshub",movement="Mouvement",player="Joueur",misc="Divers",on="ON",off="OFF",speed="Vitesse",jump="Saut"},
	de={hub="Realmshub",movement="Bewegung",player="Spieler",misc="Extra",on="AN",off="AUS",speed="Geschwindigkeit",jump="Sprung"}
}

local function getHum()
	local c=player.Character
	return c and c:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
	local c=player.Character
	return c and c:FindFirstChild("HumanoidRootPart")
end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name="Realmshub"

local main = Instance.new("Frame", gui)
main.Size=UDim2.new(0,340,0,300)
main.Position=UDim2.new(0,120,0,160)
main.BackgroundColor3=Color3.fromRGB(18,18,18)
Instance.new("UICorner",main).CornerRadius=UDim.new(0,12)
Instance.new("UIStroke",main).Color=Color3.fromRGB(50,50,50)

local dragging,dragStart,startPos
main.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
		dragging=true
		dragStart=i.Position
		startPos=main.Position
		i.Changed:Connect(function()
			if i.UserInputState==Enum.UserInputState.End then dragging=false end
		end)
	end
end)

UIS.InputChanged:Connect(function(i)
	if dragging then
		local d=i.Position-dragStart
		main.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
	end
end)

local title=Instance.new("TextLabel",main)
title.Size=UDim2.new(1,0,0,30)
title.BackgroundTransparency=1
title.TextColor3=Color3.fromRGB(230,230,230)
title.Font=Enum.Font.GothamBold
title.TextSize=16

local container=Instance.new("ScrollingFrame",main)
container.Size=UDim2.new(1,0,1,-40)
container.Position=UDim2.new(0,0,0,40)
container.CanvasSize=UDim2.new(0,0,0,600)
container.BackgroundTransparency=1
container.ScrollBarThickness=4

local function section(name,y)
	local lbl=Instance.new("TextLabel",container)
	lbl.Position=UDim2.new(0,10,0,y)
	lbl.Size=UDim2.new(1,-20,0,20)
	lbl.BackgroundTransparency=1
	lbl.TextColor3=Color3.fromRGB(180,180,180)
	lbl.Font=Enum.Font.GothamBold
	lbl.TextSize=13
	lbl.TextXAlignment=Enum.TextXAlignment.Left
	return lbl
end

local function toggle(y,callback)
	local b=Instance.new("TextButton",container)
	b.Position=UDim2.new(0,10,0,y)
	b.Size=UDim2.new(1,-20,0,35)
	b.BackgroundColor3=Color3.fromRGB(28,28,28)
	b.TextColor3=Color3.fromRGB(220,220,220)
	b.Font=Enum.Font.GothamBold
	b.TextSize=14
	Instance.new("UICorner",b)

	local state=false
	b.MouseButton1Click:Connect(function()
		state=not state
		callback(state)
	end)

	return b,function(on,off) b.Text=state and on or off end
end

local function slider(y,min,max,default,callback)
	local bar=Instance.new("Frame",container)
	bar.Position=UDim2.new(0,10,0,y)
	bar.Size=UDim2.new(1,-20,0,8)
	bar.BackgroundColor3=Color3.fromRGB(40,40,40)

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
			dragging=true set(i.Position.X)
		end
	end)

	UIS.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
			set(i.Position.X)
		end
	end)

	UIS.InputEnded:Connect(function(i)
		if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
			dragging=false
		end
	end)
end

local y=0

local moveLabel=section("",y) y+=20

local speedVal=16
local speedToggle,speedTxt=toggle(y,function(v)
	local h=getHum()
	if h then h.WalkSpeed=v and speedVal or 16 end
end) y+=40
slider(y,16,200,speedVal,function(v)
	speedVal=v
	local h=getHum()
	if h then h.WalkSpeed=v end
end) y+=30

local jumpVal=50
local jumpToggle,jumpTxt=toggle(y,function(v)
	local h=getHum()
	if h then h.JumpPower=v and jumpVal or 50 end
end) y+=40
slider(y,50,200,jumpVal,function(v)
	jumpVal=v
	local h=getHum()
	if h then h.JumpPower=v end
end) y+=40

local infJump=false
local infBtn,infTxt=toggle(y,function(v) infJump=v end) y+=40

local fly=false
local flySpeed=60
local flyBtn,flyTxt=toggle(y,function(v) fly=v end) y+=40
slider(y,10,200,flySpeed,function(v) flySpeed=v end) y+=40

local noclip=false
local ncBtn,ncTxt=toggle(y,function(v) noclip=v end) y+=40

local wf=false
local wfPower=12000
local wfBtn,wfTxt=toggle(y,function(v) wf=v end) y+=40
slider(y,2000,50000,wfPower,function(v) wfPower=v end)

local flyDir=Vector3.zero

UIS.InputBegan:Connect(function(i,g)
	if g then return end
	if i.KeyCode==Enum.KeyCode.W then flyDir+=Vector3.new(0,0,-1) end
	if i.KeyCode==Enum.KeyCode.S then flyDir+=Vector3.new(0,0,1) end
	if i.KeyCode==Enum.KeyCode.A then flyDir+=Vector3.new(-1,0,0) end
	if i.KeyCode==Enum.KeyCode.D then flyDir+=Vector3.new(1,0,0) end
	if infJump and i.KeyCode==Enum.KeyCode.Space then
		local h=getHum()
		if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
	end
end)

UIS.InputEnded:Connect(function(i)
	if i.KeyCode==Enum.KeyCode.W then flyDir-=Vector3.new(0,0,-1) end
	if i.KeyCode==Enum.KeyCode.S then flyDir-=Vector3.new(0,0,1) end
	if i.KeyCode==Enum.KeyCode.A then flyDir-=Vector3.new(-1,0,0) end
	if i.KeyCode==Enum.KeyCode.D then flyDir-=Vector3.new(1,0,0) end
end)

RunService.Heartbeat:Connect(function()
	local root=getRoot()
	local hum=getHum()
	if not root or not hum then return end

	if fly then
		local cam=workspace.CurrentCamera
		root.Velocity=cam.CFrame:VectorToWorldSpace(flyDir)*flySpeed
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

local function applyLang()
	local t=L[lang]
	title.Text=t.hub
	moveLabel.Text=t.movement
	speedTxt(t.on.." "..t.speed,t.off.." "..t.speed)
	jumpTxt(t.on.." "..t.jump,t.off.." "..t.jump)
	infTxt(t.on.." InfJump",t.off.." InfJump")
	flyTxt(t.on.." Fly",t.off.." Fly")
	ncTxt(t.on.." Noclip",t.off.." Noclip")
	wfTxt(t.on.." WalkFling",t.off.." WalkFling")
end

applyLang()
