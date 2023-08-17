--RobloxBots by Team DOOMBLOX
--Credits: Casualdev (Main source)
--oc9x97 (Expansion)
--tornvrc/bakersrule2020 (Hey, that's me!) (Patches and recent additions)
--You (For using this script <3)
getgenv().host = "nowggtesterfortaylor"
getgenv().allowallcontrol = true --Allows the entire server to control the bot. Recommended to keep false for testing.
getgenv().defaultfps = 60
getgenv().prefix = "!"
local shadowing = false
local event
getgenv().shouldbotrender = true -- To show bot's screen or not to reduce lag
local player = game:GetService("Players")
local LocalPlayer = game.Players.LocalPlayer
RunService = game:GetService("RunService")
TeleportService = game:GetService("TeleportService") -- Remove this and Rejoin if you are using Delta
PlaceId, JobId = game.PlaceId, game.JobId
local apiws

local function apierr(str)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Failed to connect to the API! (Error: " .. str .. ")")
end

local function errorabsorb()

end

local function sendApiMessage(message)
    xpcall(game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message), errorabsorb)
end

local function networksend(text)
    apiws.Send(text)
end


if game.Players.LocalPlayer.Name ~= host then
    setfpscap(getgenv().defaultfps)
    print("loading")
else
    warn("not loading for host")
    if not getgenv().shouldbotrender then
        RunService:Set3dRenderingEnabled(false)
    end
    return
end

threadlive = true
if allowallcontrol then
sendApiMessage("Everyone in this server can now control me! Say !cmds for a list of commands.")
for i,plr in ipairs(game.Players:GetChildren()) do
	event = plr.Chatted:Connect(function(message)
	if threadlive then
	if plr.Name == game.Players[host].Name then
		print("avoiding conflict")
	else
	function checkbl()
		
		local lowerMessage = string.lower(message)
		if not string.find(lowerMessage, getgenv().prefix) then
			return false
		end
		local blacklistedwords = {"fu", "naz", "dee", "dey", "di", "dix", "sheet","niga", "negar", "sex", "ass", "nigga", "nigger", "ihate" ,  "transsue", "cottonpicker","dick","cock","tits", "@", "TheKlan","klan", "kkk", "monkey", "#", "dick", "ick"}
		for i,v in ipairs(blacklistedwords) do
			if string.find(lowerMessage, v) then
				sendApiMessage(plr.Name .. " Attempted to use a restricted word!")
				return true
			end
		end
	end
	if checkbl() then
		return
	
    elseif threadlive then
        local lowerMessage = string.lower(message)
        if lowerMessage == getgenv().prefix.."follow" then
            following = true
            if following then
                while following do
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(plr.Character.HumanoidRootPart.Position)
                    wait()
                end
            end
        elseif lowerMessage == getgenv().prefix.."unfollow" then
            following = false
        elseif lowerMessage == getgenv().prefix.."chatluaver" then
            sendApiMessage("Lua version is reported to be: " .. _VERSION)
        elseif lowerMessage == getgenv().prefix.."goto" then
            following = true
            wait(0)
            following = false
        elseif lowerMessage == getgenv().prefix.."sit" then
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
        elseif lowerMessage == getgenv().prefix.."jump" then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        elseif lowerMessage == getgenv().prefix.."reset" then
            game.Players.LocalPlayer.Character:BreakJoints()
        elseif lowerMessage == getgenv().prefix.."dance" then
            if game:GetService("TextChatService").TextChannels.RBXGeneral then
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e dance")
            else
                print("unable to lol")
            end
        elseif lowerMessage == getgenv().prefix.."render" then
            sendApiMessage("Rendering enabled. I can see!")
            RunService:Set3dRenderingEnabled(true)
        elseif lowerMessage == getgenv().prefix.."dontrender" then
            sendApiMessage("Rendering disabled. I'm blind!")
            RunService:Set3dRenderingEnabled(false)
        elseif string.find(lowerMessage, getgenv().prefix .. "say") then
            local args = string.gsub(message, getgenv().prefix .. "say", "")
            sendApiMessage("[" .. plr.Name .. "]: " .. args)
        elseif lowerMessage == getgenv().prefix.."rejoin" then
            sendApiMessage(plr.Name .. " tried to use a restricted command! (Rejoin)")
        elseif lowerMessage == getgenv().prefix.."wave" then
            sendApiMessage("/e wave")
            sendApiMessage("Hello world!")
        elseif lowerMessage == getgenv().prefix.."cheer" then
            sendApiMessage("/e cheer")
            sendApiMessage("Yay!")
        elseif lowerMessage == getgenv().prefix.."laugh" then
            sendApiMessage("/e laugh")
            sendApiMessage("HAHAHAHAHAHA!!!")
        elseif lowerMessage == getgenv().prefix.."whoami" then
            sendApiMessage("I'm Torn, taken by CasualDev maybe????")
        elseif lowerMessage == getgenv().prefix.."credits" then
            sendApiMessage("Code by CasualDev Expanded by oc9x97 Fixing by Torn, Since Torn was slow to code most of it I had to use ChatGPT!")
        elseif lowerMessage == getgenv().prefix.."cmds" then
            sendApiMessage("credits, render, dontrender, rejoin, sit, dance, follow, unfollow, jump, reset, cmds, goto, laugh, cheer, wave, and love! ")
        elseif lowerMessage == getgenv().prefix.."resumealtcontrol" then
            threadlive = true
                 elseif lowerMessage == getgenv().prefix.."love" then
            	sendApiMessage("Love? I only save that for CasualDev.")
        elseif lowerMessage == getgenv().prefix.."bring" then
            for i,v in ipairs(player:GetPlayers()) do
                if v.Name == plr.Name then
                    local targetplayer = v
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetplayer.Character.HumanoidRootPart.Position.X, targetplayer.Character.HumanoidRootPart.Position.Y, targetplayer.Character.HumanoidRootPart.Position.Z)
                    LocalPlayer.Character.HumanoidRootPart.Rotation = targetplayer.HumanoidRootPart.Rotation
                 end
            end
            end
            end
        end
    end
    end)
end end
game.Players[host].Chatted:Connect(function(message)
    if threadlive then
        local lowerMessage = string.lower(message)
        if string.find(lowerMessage, getgenv().prefix.."follow") then
        	local args = string.gsub(message, getgenv().prefix .. "follow ", "")
        	print("Command args for follow are: " .. args)
        	if args == "" then
        	following = true
            if following then
                while following do
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players[host].Character.HumanoidRootPart.Position)
                    
                    wait()
                end
            end
            else
            for i,v in ipairs(game.Players:GetPlayers()) do
            	if v.Name == args then
            		following = true
			           	 if following then
			                while following do
			                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players[host].Character.HumanoidRootPart.Position)
			                    wait()
			                end
            			end
            	end
            end
            end
        elseif lowerMessage == getgenv().prefix.."unfollow" then
            following = false
             elseif lowerMessage == getgenv().prefix.."love" then
            	sendApiMessage("Love? I only save that for CasualDev.")
        elseif lowerMessage == getgenv().prefix.."chatluaver" then
            sendApiMessage("Lua version is reported to be: " .. _VERSION)
        elseif lowerMessage == getgenv().prefix.."goto" then
            following = true
            wait(0)
            following = false
        elseif lowerMessage == getgenv().prefix.."sit" then
            game.Players.LocalPlayer.Character.Humanoid.Sit = true
        elseif lowerMessage == getgenv().prefix.."jump" then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        elseif lowerMessage == getgenv().prefix.."reset" then
            game.Players.LocalPlayer.Character:BreakJoints()
            elseif lowerMessage == getgenv().prefix.."toggleservercontrol" then
            if not allowallcontrol then
           		allowallcontrol = true
           		else
           		allowallcontrol = false
           		end
           		sendApiMessage("Can players besides host control me: " .. tostring(allowallcontrol))
         elseif lowerMessage == getgenv().prefix.."leave" then
         	game:shutdown()
        elseif lowerMessage == getgenv().prefix.."dance" then
            if game:GetService("TextChatService").TextChannels.RBXGeneral then
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/e dance")
            else
                print("unable to lol")
            end
         elseif lowerMessage == getgenv().prefix.."hideplayers" then
           	for i,v in ipairs(game.Players:GetChildren()) do
                if v.Name == game.Players[host].Name or v.Name == LocalPlayer.Name then
                print("Don't hide host or bot!")
                else
                    for i,v in ipairs(v.Character:GetChildren()) do
                        if v:IsA("Part") or v:IsA("Accessory") then
                            if v:IsA("Accessory") then
                                v.Handle.Transparency = 1
                                else
                                v.Transparency = 1
                            end
                        end
                    end
                end
            end
        elseif lowerMessage == getgenv().prefix.."render" then
            sendApiMessage("Rendering enabled. I can see!")
            RunService:Set3dRenderingEnabled(true)
        elseif lowerMessage == getgenv().prefix.."dontrender" then
            sendApiMessage("Rendering disabled. I'm blind!")
            RunService:Set3dRenderingEnabled(false)
        elseif string.find(lowerMessage, getgenv().prefix .. "say") then
            local args = string.gsub(message, getgenv().prefix .. "say", "")
            sendApiMessage(args)
        elseif lowerMessage == getgenv().prefix.."rejoin" then
            TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LocalPlayer)
        elseif lowerMessage == getgenv().prefix.."wave" then
            sendApiMessage("/e wave")
            sendApiMessage("Hello world!")
        elseif lowerMessage == getgenv().prefix.."cheer" then
            sendApiMessage("/e cheer")
            sendApiMessage("Yay!")
        elseif lowerMessage == getgenv().prefix.."laugh" then
            sendApiMessage("/e laugh")
            sendApiMessage("HAHAHAHAHAHA!!!")
        elseif lowerMessage == getgenv().prefix.."whoami" then
            sendApiMessage("I'm Torn, taken by CasualDev maybe????")
        elseif lowerMessage == getgenv().prefix.."credits" then
            sendApiMessage("Code by CasualDev Expanded by oc9x97 Fixing by Torn, Since Torn was slow to code most of it I had to use ChatGPT!")
        elseif lowerMessage == getgenv().prefix.."cmds" then
            sendApiMessage("credits, render, dontrender, rejoin, sit, dance, follow, unfollow, jump, reset, cmds, laugh, cheer, wave, love, shadow, unshadow, stopaltcontrol, bring, ws, jp")
        elseif lowerMessage == getgenv().prefix.."stopaltcontrol" then
            threadlive = false
            event:Disconnect()
            sendApiMessage("Stopped alt control. Made by team DOOMBLOX!")
        elseif lowerMessage == getgenv().prefix.."resumealtcontrol" then
            threadlive = true
       
        elseif lowerMessage == getgenv().prefix.."bring" then
            for i,v in ipairs(player:GetPlayers()) do
                if v.Name == getgenv().host then
                    local targetplayer = v
                    LocalPlayer.Character.HumanoidRootPart.CFrame = targetplayer.Character.HumanoidRootPart.CFrame
                    end
            end
        elseif lowerMessage == getgenv().prefix.."shadow" then
            shadowing = true
                while shadowing do
                  if shadowing then
                    for i,v in ipairs(player:GetPlayers()) do
                        if v.Name == getgenv().host then
                            local targetplayer = v
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetplayer.Character.HumanoidRootPart.Position.X, targetplayer.Character.HumanoidRootPart.Position.Y, targetplayer.Character.HumanoidRootPart.Position.Z)
                        end
                    end
                    end
                end
            elseif lowerMessage == getgenv().prefix.."unshadow" then
                shadowing = false
            elseif string.find(lowerMessage, getgenv().prefix.."ws") then
                local args = string.gsub(message, getgenv().prefix .. "ws", "")
                LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(args)
            elseif string.find(lowerMessage, getgenv().prefix.."jp") then
                local args = string.gsub(message, getgenv().prefix .. "jp", "")
                LocalPlayer.Character.Humanoid.JumpPower = tonumber(args)
            end
    end
end)

xpcall(function() apiws = WebSocket.Connect("localhost:8080") end, apierr)
sendApiMessage("RobloxBots V0.0.4 by Team D00MBLOX Loaded (Host: " .. getgenv().host .. ")")
print("loaded")