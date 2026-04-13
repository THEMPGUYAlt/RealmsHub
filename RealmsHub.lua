--// SERVICES
local S = {
	P = game:GetService("Players"),
	UIS = game:GetService("UserInputService"),
	RS = game:GetService("RunService"),
	HS = game:GetService("HttpService"),
	TS = game:GetService("TweenService")
}

local LP = S.P.LocalPlayer

--// CHAR
local function C() return LP.Character end
local function H() return C() and C():FindFirstChildOfClass("Humanoid") end
local function R() return C() and C():FindFirstChild("HumanoidRootPart") end

--// SAVE
local FILE="realmshub_full.json"
local CFG={}
pcall(function()
	if readfile and isfile and isfile(FILE) then
		CFG=S.HS:JSONDecode(readfile(FILE))
	end
end)
local function save()
	if writefile then writefile(FILE,S.HS:JSONEncode(CFG)) end
end

--// STATE
local T={target=nil,flags={},vals={speed=16,fly=60,gravity=workspace.Gravity}}

--// GUI
local G=Instance.new("ScreenGui",game.CoreGui)
local M=Instance.new("Frame",G)
M.Size=UDim2.new(0,520,0,380)
M.Position=UDim2.new(0.3,0,0.2,0)
M.BackgroundColor3=Color3.fromRGB(18,18,18)

-- DRAG
do
	local d,ds,sp
	M.InputBegan:Connect(function(i)
		if i.UserInputType==1 then d=true ds=i.Position sp=M.Position end
	end)
	S.UIS.InputChanged:Connect(function(i)
		if d and i.UserInputType==0 then
			local delta=i.Position-ds
			M.Position=sp+UDim2.new(0,delta.X,0,delta.Y)
		end
	end)
	S.UIS.InputEnded:Connect(function(i) if i.UserInputType==1 then d=false end end)
end

-- TABS
local tabs={"Combat","Movement","Player","World","Misc"}
local pages={}
local current

local tabBar=Instance.new("Frame",M)
tabBar.Size=UDim2.new(1,0,0,30)

for i,name in pairs(tabs) do
	local b=Instance.new("TextButton",tabBar)
	b.Size=UDim2.new(1/#tabs,0,1,0)
	b.Position=UDim2.new((i-1)/#tabs,0,0,0)
	b.Text=name

	local p=Instance.new("ScrollingFrame",M)
	p.Size=UDim2.new(1,0,1,-30)
	p.Position=UDim2.new(0,0,0,30)
	p.Visible=false
	p.CanvasSize=UDim2.new(0,0,5,0)
	pages[name]=p

	b.MouseButton1Click:Connect(function()
		for _,v in pairs(pages) do v.Visible=false end
		p.Visible=true
	end)

	if not current then current=p p.Visible=true end
end

-- UI BUILDER
local function make(page)
	local y=10
	return function(name,typ,cb,min,max)
		local o=Instance.new("TextButton",page)
		o.Size=UDim2.new(1,-20,0,30)
		o.Position=UDim2.new(0,10,0,y)

		if typ=="toggle" then
			local v=CFG[name] or false
			local function upd() o.Text=name..": "..(v and "ON" or "OFF") end
			o.MouseButton1Click:Connect(function()
				v=not v CFG[name]=v save() cb(v)
				S.TS:Create(o,TweenInfo.new(0.2),{BackgroundColor3=v and Color3.fromRGB(0,170,255) or Color3.fromRGB(30,30,30)}):Play()
				upd()
			end)
			upd()
			return function() return v end

		elseif typ=="slider" then
			o.Text=name
			local fill=Instance.new("Frame",o)
			fill.BackgroundColor3=Color3.fromRGB(0,170,255)

			o.InputBegan:Connect(function(i)
				if i.UserInputType==1 then
					local p=(i.Position.X-o.AbsolutePosition.X)/o.AbsoluteSize.X
					local val=min+(max-min)*math.clamp(p,0,1)
					fill.Size=UDim2.new(p,0,1,0)
					CFG[name]=val save() cb(val)
				end
			end)

		elseif typ=="button" then
			o.Text=name
			o.MouseButton1Click:Connect(cb)
		end

		y+=35
	end
end

local UI={}
for k,v in pairs(pages) do UI[k]=make(v) end

-- PLAYER LIST + TARGET
local function nearest()
	local root=R()
	local dist=math.huge
	local best=nil
	for _,p in pairs(S.P:GetPlayers()) do
		if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local d=(p.Character.HumanoidRootPart.Position-root.Position).Magnitude
			if d<dist then dist=d best=p end
		end
	end
	return best
end

-- FEATURES

-- MOVEMENT
local speed=UI.Movement("Speed","toggle",function()end)
UI.Movement("SpeedPower","slider",function(v)T.vals.speed=v end,16,200)

local fly=UI.Movement("Fly","toggle",function(v)
	local r=R()
	if r then
		if v then
			T.bv=Instance.new("BodyVelocity",r)
			T.bv.MaxForce=Vector3.new(1e9,1e9,1e9)
		else if T.bv then T.bv:Destroy() end end
	end
end)
UI.Movement("FlySpeed","slider",function(v)T.vals.fly=v end,10,200)

UI.Movement("Noclip","toggle",function(v)T.flags.noclip=v end)
UI.Movement("InfJump","toggle",function(v)T.flags.infjump=v end)
UI.Movement("Bhop","toggle",function(v)T.flags.bhop=v end)
UI.Movement("HighJump","toggle",function(v)T.flags.high=v end)

-- COMBAT
UI.Combat("Aimbot","toggle",function(v)T.flags.aim=v end)
UI.Combat("SilentAim","toggle",function(v)T.flags.silent=v end)
UI.Combat("Aura","toggle",function(v)T.flags.aura=v end)
UI.Combat("Fling","toggle",function(v)T.flags.fling=v end)

UI.Combat("AutoTarget","toggle",function(v)T.flags.auto=v end)

-- PLAYER
UI.Player("Spinbot","toggle",function(v)T.flags.spin=v end)

-- WORLD
UI.World("Gravity","slider",function(v)workspace.Gravity=v end,0,196)
UI.World("FOV","slider",function(v)workspace.CurrentCamera.FieldOfView=v end,60,120)

-- MISC
UI.Misc("Fullbright","toggle",function(v)
	if v then
		game.Lighting.Brightness=3
		game.Lighting.ClockTime=14
	end
end)

UI.Misc("Script Loader","button",function()
	local url=game:GetService("StarterGui"):PromptTextInput("Enter Script URL")
	if url then loadstring(game:HttpGet(url))() end
end)

-- KEYBINDS
local binds={}
UIS.InputBegan:Connect(function(i,g)
	if g then return end
	for k,v in pairs(binds) do
		if i.KeyCode==v then
			T.flags[k]=not T.flags[k]
		end
	end
end)

-- SILENT AIM (HOOK)
local mt=getrawmetatable(game)
setreadonly(mt,false)
local old=mt.__namecall

mt.__namecall=function(self,...)
	local args={...}
	if tostring(getnamecallmethod())=="Raycast" and T.flags.silent and T.target and T.target.Character then
		local part=T.target.Character:FindFirstChild("Head")
		if part then
			args[2]=(part.Position - args[1]).Unit*1000
			return old(self,unpack(args))
		end
	end
	return old(self,...)
end

-- LOOP
S.RS.Heartbeat:Connect(function()
	local h,r=H(),R()
	if not h or not r then return end

	if T.flags.auto then T.target=nearest() end

	if speed() then h.WalkSpeed=T.vals.speed end

	if fly() and T.bv then
		T.bv.Velocity=workspace.CurrentCamera.CFrame.LookVector*T.vals.fly
	end

	if T.flags.noclip then
		for _,v in pairs(C():GetDescendants()) do
			if v:IsA("BasePart") then v.CanCollide=false end
		end
	end

	if T.flags.infjump then
		h:ChangeState(Enum.HumanoidStateType.Jumping)
	end

	if T.flags.bhop and h.FloorMaterial~=Enum.Material.Air then
		h:ChangeState(Enum.HumanoidStateType.Jumping)
	end

	if T.flags.high then
		r.Velocity=Vector3.new(r.Velocity.X,80,r.Velocity.Z)
	end

	if T.flags.spin then
		r.RotVelocity=Vector3.new(0,50,0)
	end

	if T.flags.fling then
		r.RotVelocity=Vector3.new(0,9999,0)
	end

	if T.flags.aim and T.target and T.target.Character then
		workspace.CurrentCamera.CFrame=
			CFrame.new(workspace.CurrentCamera.CFrame.Position,
			T.target.Character.HumanoidRootPart.Position)
	end

	if T.flags.aura then
		for _,p in pairs(S.P:GetPlayers()) do
			if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				if (p.Character.HumanoidRootPart.Position-r.Position).Magnitude<10 then
					p.Character.Humanoid:TakeDamage(5)
				end
			end
		end
	end
end)
