--KARMA rewrite V1
currentver = "1.0b"
latestver = loadstring(game:HttpGet("https://raw.githubusercontent.com/bakersrule2020/karma-files/main/version"))()
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

game.Players.LocalPlayer.OsPlatform = "KC"

Notification:Notify(
	    {Title = "Welcome", Description = "Welcome to karma client version " .. currentver .. "!"},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})

local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()
local selectedtarget = "None"
local player = game.Players
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local LocalPlayer = player.LocalPlayer
local Humanoid = LocalPlayer.Character.Humanoid
local karmapath = "/KARMA/"
local musparent = game.CoreGui
local GuiService = game:GetService("GuiService")
local deppath = karmapath .. "/Dependencies/"
local muspath = karmapath .. "/MenuBG/"
for i,v in ipairs(musparent:GetChildren()) do
	if v:IsA("Sound") then
		v:Destroy()
	end
end
makefolder(karmapath)
makefolder(deppath)
makefolder(muspath)
function getrequest(url)
	response = httprequest({
		Url = url,
		Method = 'GET'

	})
	return response.Body
end
function checkstatus(plrinst)
	if plrinst.OsPlatform == "KC" then
		return "Karma User"
	elseif plrinst.OsPlatform == "KO" then
		return "Karma Owner"
	else
		return "Regular Player"
	end
end

function vercheck()
	Notification:Notify(
	    {Title = "Update Checker", Description = "Checking for updates, hold on a sec..."},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
	if currentver == latestver then
		Notification:Notify(
	    {Title = "Update Checker", Description = "Karma is up to date, starting..."},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
	else
		Notification:Notify(
	    {Title = "Outdated", Description = "Karma appears to be outdated. Reloading!"},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
		 loadstring(getrequest("https://raw.githubusercontent.com/bakersrule2020/karma-files/main/loader.lua"))
	end
end
vercheck()
function downloadfile(filename, url)
	
	Notification:Notify(
	    {Title = "Downloading File...", Description = "Downloading " .. filename .. " From " .. url},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
writefile(filename, game:HttpGet(url))
end
if isfile(karmapath .. "ranalready.txt") then
	Notification:Notify(
	    {Title = "KARMA", Description = "Dependencies already downloaded, skipping downloads..."},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end}
	)
else
downloadfile("KARMA/Dependencies/squid.lua", "https://raw.githubusercontent.com/bakersrule2020/karma-files/main/squidhaxongod.lua")
downloadfile("KARMA/Dependencies/flymodule.lua", "https://raw.githubusercontent.com/bakersrule2020/karma-files/main/flymodule.lua")
downloadfile(muspath .. "karmabg.ogg", "https://raw.githubusercontent.com/bakersrule2020/karma-files/main/karmabg.ogg")
end
dofile("KARMA/Dependencies/flymodule.lua")

local menubg = Instance.new("Sound", musparent)
menubg.SoundId = getcustomasset(muspath .. "karmabg.ogg")
menubg.Looped = true
menubg:Play()
function musrefresh()
	Notification:Notify(
	    {Title = "Refresh In Progress", Description = "Please wait while we refresh the background music for you..."},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end}
	)
	menubg.Looped = false
	menubg:Stop()
	menubg.SoundId = getcustomasset(muspath .. "karmabg.ogg")
	menubg.Looped = true
	menubg:Play()
end
local window1 = engine.new({
    text = "Karma Client",
    size = Vector2.new(600, 600),
})
window1.open()
local exectab = window1.new({
	text = "General Hacks"
})
local movefold = exectab.new("folder", {
	text = "Movement Hacks"
})
local walkslider = movefold.new("slider", {
    text = "Walkspeed",
    color = Color3.new(0.8, 0.5, 0),
    min = 16,
    max = 1000,
    value = 16,
    rounding = 1,
})
local jumpslider = movefold.new("slider", {
    text = "Jumppower",
    color = Color3.new(0.8, 0.5, 0),
    min = 50,
    max = 1000,
    value = 16,
    rounding = 1,
})
walkslider.event:Connect(function(val)
	Humanoid.WalkSpeed = val
end)
jumpslider.event:Connect(function(val)
	Humanoid.JumpPower = val
end)
local fly = movefold.new("switch", {
	text = "Flyhack",
})
fly.event:Connect(function(bool)
	if bool then
		_G.FlyOn()
	else
		_G.FlyOff()
	end
end)
local squidhaxfold = exectab.new("folder", {
	text = "Squid hacks",
})
local popfuckfold = exectab.new("folder", {
	text = "Project Popfuck"
})
local popfucktog_gore = popfuckfold.new("switch", {
	text = "Dental Gore Spammer"
})
popfucktog_gore.event:Connect(function(bool)
	while bool do
		wait(0)
		local args = {
		    [1] = "Hey guys",
		    [2] = {
		        [1] = "12559762026"
		    }
		}
		game:GetService("ReplicatedStorage"):WaitForChild("BloxbizRemotes"):WaitForChild("PopfeedOnPostContent"):InvokeServer(unpack(args))
	end

end)
local popfucktog_lemon = popfuckfold.new("switch", {
	text = "Lemon Party Link Spammer"
})
popfucktog_lemon.event:Connect(function(bool)
	while bool do
		wait(0)
		local args = {
		    [1] = "adoptmesextape ",
		    [2] = {
		        [1] = "47088015"
		    }
		}
		
		game:GetService("ReplicatedStorage"):WaitForChild("BloxbizRemotes"):WaitForChild("PopfeedOnPostContent"):InvokeServer(unpack(args))
	end
end)

local rembtn = squidhaxfold.new("button", {
	text = "Remove All Breakable Glass"
})
rembtn.event:Connect(function()
	dofile(deppath .. "squid.lua")
end)
local tab1 = window1.new({
    text = "Target",
})
local fold1 = tab1.new("folder", {
	text = "Players"
})
local fold2 = tab1.new("folder", {
	text = "Functions"
})
for i,v in ipairs(game.Players:GetChildren()) do
	dock = fold1.new("dock")
	platreturn = checkstatus(v)
	dock.new("label", {
		
		text = v.DisplayName .. " | " .. platreturn
	})
	sel = dock.new("button", {text = "Select"})
	sel.event:Connect(function()
		selectedtarget = v.Name
		fold1.close()
	end)
	player.PlayerRemoving:Connect(function(plr)
		dock.self:Destroy()
		if selectedtarget == plr.Name then
			selectedtarget = "None"
		end
	end)
end
player.PlayerConnecting:Connect(function(plr)
	platreturn = checkstatus(v)
		dock = fold1.new("dock")
	dock.new("label", {
		
		text = v.DisplayName .. " | " .. platreturn
	})
	sel = dock.new("button", {text = "Select"})
	sel.event:Connect(function()
		selectedtarget = v.Name
		fold1.close()
	end)
	player.PlayerRemoving:Connect(function(plr)
		dock.self:Destroy()
		if selectedtarget == plr.Name then
			selectedtarget = "None"
		end
	end)
	end)
local tpbtn = fold2.new("button", {text = "Teleport To Target"})
tpbtn.event:Connect(function()
	if selectedtarget == "None" then
		warnlabel = fold2.new("label", {text = "Select someone first!"})
		wait(3)
		warnlabel.Destroy()
	else
		for i,v in ipairs(player:GetPlayers()) do
		if v.Name == selectedtarget then
			local targetplayer = v
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetplayer.Character.HumanoidRootPart.Position.X, targetplayer.Character.HumanoidRootPart.Position.Y, targetplayer.Character.HumanoidRootPart.Position.Z)
		end
	end end
end)
local specbtn = fold2.new("switch", {text = "Spectate Target"})
specbtn.event:Connect(function(bool)
	if bool then
			if selectedtarget == "None" then
				warnlabel = fold2.new("label", {text = "Select someone first!"})
				wait(3)
				warnlabel.Destroy()
			else
				for i,v in ipairs(player:GetPlayers()) do
					if v.Name == selectedtarget then
						targetplayer = v
					end
				end
				game.Workspace.Camera.CameraSubject = targetplayer.Character
			end
		else
			game.Workspace.Camera.CameraSubject = LocalPlayer.Character
	end
end)
local inspectbtn = fold2.new("button", {
	text = "Inspect Target's Avatar"
})
inspectbtn.event:Connect(function()
				for i,v in ipairs(player:GetPlayers()) do
					if v.Name == selectedtarget then
						targetplayer = v
					end
				end
	GuiService:CloseInspectMenu()
	GuiService:InspectPlayerFromUserId(targetplayer.UserId)
end)
local contab = window1.new({
	text = "Settings",
})
local musrefreshbtn = contab.new("button",{text = "Refresh Music"})
musrefreshbtn.event:Connect(musrefresh)
local muscontrolbtn = contab.new("switch", {text = "Play/Pause BG Music"})
muscontrolbtn.on = true
muscontrolbtn.event:Connect(function(bool)
	menubg.Playing = bool 
end)
local miscfold = exectab.new("folder", {
	text = "Misc. Functions"
})
local altcontbtn = miscfold.new("button", {
	text = "KARMA Application Bots"

})

writefile(karmapath .. "ranalready.txt", "This file lets karma know you've ran it before, so you don't need to download assets.")
function windowanim()
	window1.text = "K"
	wait(0.2)
	window1.text = "KA"
	wait(0.2)
	window1.text = "KAR"
	wait(0.2)
	window1.text = "KARM"
	wait(0.2)
	window1.text = "KARMA"
	wait(0.2)
	window1.text = "KARM"
	wait(0.2)
	window1.text = "KAR"
	wait(0.2)
	window1.text = "KA"
	wait(0.2)
	window1.text = "K"
	windowanim()
end
windowanim()
