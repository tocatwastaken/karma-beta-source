local karmacrashlist = {"zer0thew01f", "c00l*"}

rconsoleclear()

if table.find(karmacrashlist, game.Players.LocalPlayer.Name) then
	rconsoleprint("YOU ARE BLACKLISTED FROM KARMA!")
	game:shutdown()
end

rconsoleprint("Welcome To KARMA\n Starting....")




local currentver = "2.2b" --DO NOT TOUCH THIS UNLESS YOU WANT TO USE AN OLDER VERSION! IF THIS DIFFERS FROM THE LATEST THE LOADER WILL CHECK FOR UPDATES!
rconsoletitle("KARMA Client V"..currentver.." By tornvrc")
rconsoleclear()
rconsoleprint[[
				 __    __   ______   _______   __       __   ______  
				|  \  /  \ /      \ |       \ |  \     /  \ /      \ 
				| $$ /  $$|  $$$$$$\| $$$$$$$\| $$\   /  $$|  $$$$$$\
				| $$/  $$ | $$__| $$| $$__| $$| $$$\ /  $$$| $$__| $$
				| $$  $$  | $$    $$| $$    $$| $$$$\  $$$$| $$    $$
				| $$$$$\  | $$$$$$$$| $$$$$$$\| $$\$$ $$ $$| $$$$$$$$
				| $$ \$$\ | $$  | $$| $$  | $$| $$ \$$$| $$| $$  | $$
				| $$  \$$\| $$  | $$| $$  | $$| $$  \$ | $$| $$  | $$
				 \$$   \$$ \$$   \$$ \$$   \$$ \$$      \$$ \$$   \$$

]]
rconsoleprint("						KARMA " .. currentver .. " By tornvrc\n")
rconsoleprint("\n=======================================================================================================================")

--KARMA rewrite V1
_G["KarmaBotConfig"] = {}

function GetDate() --stolen from domainx because i'm bad at doing this shit lmaoooo
	local date = {}
	local months = {
		{"January", 31};
		{"February", 28};
		{"March", 31};
		{"April", 30};
		{"May", 31};
		{"June", 30};
		{"July", 31};
		{"August", 31};
		{"September", 30};
		{"October", 31};
		{"November", 30};
		{"December", 31};
	}
	local t = tick()
	date.total = t
	date.seconds = math.floor(t % 60)
	date.minutes = math.floor((t / 60) % 60)
	date.hours = math.floor((t / 60 / 60) % 24)
	date.year = (1970 + math.floor(t / 60 / 60 / 24 / 365.25))
	date.yearShort = tostring(date.year):sub(-2)
	date.isLeapYear = ((date.year % 4) == 0)
	date.isAm = (date.hours < 12)
	date.hoursPm = (date.isAm and date.hours or (date.hours == 12 and 12 or (date.hours - 12)))
	if (date.hoursPm == 0) then date.hoursPm = 12 end
	if (date.isLeapYear) then
		months[2][2] = 29
	end
	do
		date.dayOfYear = math.floor((t / 60 / 60 / 24) % 365.25)
		local dayCount = 0
		for i,month in pairs(months) do
			dayCount = (dayCount + month[2])
			if (dayCount > date.dayOfYear) then
				date.monthWord = month[1]
				date.month = i
				date.day = (date.dayOfYear - (dayCount - month[2]) + 1)
				break
			end
		end
	end
	function date:format(str)
		str = str
		:gsub("#s", ("%.2i"):format(self.seconds))
		:gsub("#m", ("%.2i"):format(self.minutes))
		:gsub("#h", tostring(self.hours))
		:gsub("#H", tostring(self.hoursPm))
		:gsub("#Y", tostring(self.year))
		:gsub("#y", tostring(self.yearShort))
		:gsub("#a", (self.isAm and "AM" or "PM"))
		return str
	end
	return date
end
PlaceId, JobId = game.PlaceId, game.JobId
TeleportService = game:GetService("TeleportService")

clientbranch = ""
if clientbranch == "stable" then
	upbranch = "Live"
	latestver = loadstring(game:HttpGet("https://raw.githubusercontent.com/bakersrule2020/karma-files/main/version"))()
else
	upbranch = "Canary"
	latestver = loadstring(game:HttpGet("https://raw.githubusercontent.com/bakersrule2020/karma-beta-source/main/version"))()
end


local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

game.Players.LocalPlayer.OsPlatform = "KC"
local executor = identifyexecutor()

Notification:Notify(
	    {Title = "Welcome", Description = "Welcome to karma client version " .. currentver .. "!"},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
		 if executor == "Delta UWP" or "Delta" then
			Notification:Notify({Title = "Known Issue", Description = "Sometimes the UI padding will break. When this happens just re-execute karma,"},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
		 end

local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()
local selectedtarget = "None"
local player = game.Players
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local LocalPlayer = player.LocalPlayer
local Humanoid = LocalPlayer.Character.Humanoid
local karmapath = "/KARMA/"
local musparent = game.CoreGui
local GuiService = game:GetService("GuiService")
local deppath = karmapath .. "Dependencies/"
local musplrpath = karmapath .. "Music Player (OGG files only)/"
local logpath = karmapath .. "Logs/"
local muspath = karmapath .. "MenuBG/"
local respath = karmapath .. "Resources/"
for i,v in ipairs(musparent:GetChildren()) do
	if v:IsA("Sound") then
		v:Destroy()
	end
end
_G["KarmaBotConfig"].Host = LocalPlayer.Name
makefolder(karmapath)
makefolder(logpath)
makefolder(respath)
makefolder(deppath)
makefolder(muspath)
makefolder(musplrpath)
local logname = logpath .. "latest.log"
writefile(logname, "KARMA log file \n")
writefile(musplrpath .. "Instructions.txt", "To use this, drop ogg (Vorbis) files into the folder and then hit refresh files in the music player!")
function log(text)
	rconsoleprint("\n[" .. GetDate():format("#h:#m") .. "]: " .. text .. "\n")
	appendfile(logname, "[" .. GetDate():format("#h:#m") .. "]: " .. text .. "\n")
end
log("Executed with " .. identifyexecutor())
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
	log("Begin update check...")
	if upbranch == "Live" then
		log("Update branch: Live")
		Notification:Notify(
			{Title = "Update Checker", Description = "Checking for updates, hold on a sec..."},
			{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
		if currentver == latestver then
			log("Karma is latest version, no need to update.")
			Notification:Notify(
			{Title = "Update Checker", Description = "Karma is up to date, starting..."},
			{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
		else
			log("Karma is out of date!")
			Notification:Notify(
			{Title = "Outdated", Description = "Karma appears to be outdated. Reloading!"},
			{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
			deletefile(karmapath .. "ranalready.txt")
			loadstring(getrequest("https://raw.githubusercontent.com/bakersrule2020/karma-files/main/loader.lua"))
		end
	else
		log("Update branch: Canary")
		Notification:Notify(
			{Title = "Update Checker", Description = "Checking for updates, hold on a sec..."},
			{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
		if currentver == latestver then
			log("Karma is latest version, no need to update.")
			Notification:Notify(
			{Title = "Update Checker", Description = "Karma is up to date, starting..."},
			{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
		else
			log("Karma is out of date!")
			Notification:Notify(
			{Title = "Outdated", Description = "Karma appears to be outdated. Reloading!"},
			{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
			{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
			deletefile(karmapath .. "ranalready.txt")
			loadstring(getrequest("https://raw.githubusercontent.com/bakersrule2020/karma-beta-source/main/loader.lua"))
		end
	end
end
vercheck()
function downloadfile(filename, url)
	log("Downloading file: " .. filename .. " From URL: " .. url)
	Notification:Notify(
	    {Title = "Downloading File...", Description = "Downloading " .. filename .. " From " .. url},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end})
	writefile(filename, game:HttpGet(url))
	log("Downloaded file: " .. filename)
end
if isfile(karmapath .. "ranalready.txt") then
	Notification:Notify(
	    {Title = "KARMA", Description = "Dependencies already downloaded, skipping downloads..."},
	    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
		 {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) end}
	)
else
downloadfile(respath .. "karmaicon.png", "https://raw.githubusercontent.com/bakersrule2020/karma-beta-source/main/13690184122_512.png")
downloadfile("KARMA/Dependencies/squid.lua", "https://raw.githubusercontent.com/bakersrule2020/karma-files/main/squidhaxongod.lua")
downloadfile("KARMA/Dependencies/flymodule.lua", "https://raw.githubusercontent.com/bakersrule2020/karma-files/main/flymodule.lua")
downloadfile(muspath .. "karmabg.ogg", "https://github.com/bakersrule2020/karma-beta-source/raw/main/karmabg.ogg")
end
dofile("KARMA/Dependencies/flymodule.lua")

local menubg = Instance.new("Sound", musparent)
menubg.SoundId = getcustomasset(muspath .. "karmabg.ogg")
menubg.Looped = true
menubg:Play()
function setmenuaudio(string)
	return getcustomasset(string)
end
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
    text = "Karma Client (Version " .. currentver .. ")",
    size = Vector2.new(600, 600),
})
window1.open()
--general hacks tab
local exectab = window1.new({
	text = "General Hacks"
})
local movefold = exectab.new("folder", {
	text = "Movement Hacks"
})
local walkslider = movefold.new("slider", {
    text = "Walkspeed",
 
    min = 16,
    max = 1000,
    value = 16,
})
local jumpslider = movefold.new("slider", {
    text = "Jumppower",
    min = 50,
    max = 1000,
    value = 16,
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
--target tab
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
--settings
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
local customuibtn = contab.new("button",{text = "Load Custom UI (Pause Menu)"})
customuibtn.event:Connect(function()
	log("Init custom UI...")
	local menu = game.CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer
	menu.BackgroundColor3 = Color3.new(85, 0, 0)
	local karmapagebtn = menu["1"]
	local pageview = menu.PageViewClipper.PageView.PageViewInnerFrame
	karmapagebtn.ImageButton.ImageColor3 = Color3.new(85, 0, 0)
	karmapagebtn.ImageButton.Frame.TextLabel.Text = "KARMA Menu"
	karmapagebtn.Visible = true
	for i,v in ipairs(pageview:GetChildren()) do
		if v.Name == "Page" then
			log("Found settings page!")
			for i,v in ipairs(v:GetChildren()) do
				if v:IsA("ImageLabel") or v:IsA("ImageButton") then
					v.BackgroundColor3 = Color3.new(79, 0, 0)
				end
			end
		elseif v.Name == "Players" then
			log("Found players page!")
		else
			log("Found an unknown page named " .. v.Name .. ", likely not usable.")
	end
	end
end)
--misc functions
local miscfold = exectab.new("folder", {
	text = "Misc. Functions"
})
local musplrcont = miscfold.new("folder", {
	text = "Music Player"
})
local musdrop = musplrcont.new("dropdown", {
	text = "Select A File..."
})
selectedsong = "None"
function refreshsongs()
	for i,v in ipairs(listfiles(musplrpath)) do
		log("Found file: " .. v .. ". Checking if it is an OGG...")
		if string.find(v,".ogg") then
			log("File " .. v .. " Is an OGG, adding to list...")
			songlisting = musdrop.new(v)
		end
	end
end
refreshsongs()
function remallchoices()
end
local selectedsong
musdrop.event:Connect(function(choise)
	selectedsong = choise
end)
local ref_files = musplrcont.new("button", {
	text = "Refresh files"
})
ref_files.event:Connect(refreshsongs)
local play_file = musplrcont.new("switch", {
	text = "Play selected .ogg file"
})
play_file.event:Connect(function(bool)
	if bool then
		menubg:Stop()
		menubg.SoundId = getcustomasset(selectedsong)
		menubg:Play()
	else
		menubg:Stop()
		menubg.SoundId = getcustomasset(muspath .. "karmabg.ogg")
		menubg:Play()
	end
end)
local vol_slider = musplrcont.new("slider", {
	text = "Music Volume",
	rounding = false,
	min = 0,
	max = 100,
})
vol_slider.event:Connect(function(val)
	menubg.Volume = val / 100
end)
local altcontbtn = miscfold.new("button", {
	text = "Rejoin"

})
local isaltcontrolpub = true
if isaltcontrolpub then
	local newslabel = miscfold.new("folder", {
		text = "(WIP) Alt control"
	})
	local scanbtn = newslabel.new("button", {
		text = "Scan for bots"
	})
	local selectedbot = "None"
	local selfold = newslabel.new("folder", {
		text = "Select bot"
	})


	scanbtn.event:Connect(function()
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("identbot")
		game:GetService("TextChatService").TextChannels.RBXGeneral.MessageReceived:Connect(function(message)
			if message.Text == "identifnetworkforkarma" then
				seldock = selfold.new("dock")
				sellabel = seldock.new("label", {text = message.TextSource.Name})
				botselbtn = seldock.new("button", {text = "Select bot"})
				botselbtn.event:Connect(function()
					selectedbot = message.TextSource.Name
				end)
			end
		end)
	end)

	local funcfold = newslabel.new("folder", {
		text = "Bot Functions"
	})
	local mkbotrj = funcfold.new("button", {text = "Make bot rejoin (You'll need to re-execute the bot script!)"})
	local mkbotfollow = funcfold.new("switch", {text = "Make bot follow you"})
	local sayfold = funcfold.new("folder", {text = "Bot say"})
	local inputtextbox = Instance.new("TextBox",sayfold.self)
	inputtextbox.BackgroundColor3 = Color3.new(0, 0, 0)

	inputtextbox.PlaceholderText = "What you want the bot to say."
	Instance.new("UICorner", inputtextbox)

end

altcontbtn.event:Connect(function()
	TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
end)


if game:GetService("TextChatService").TextChannels.RBXGeneral then
	game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("[KARMA Client]: Thanks for using KARMA!")
else
end
writefile(karmapath .. "ranalready.txt", "This file lets karma know you've ran it before, so you don't need to download assets.")