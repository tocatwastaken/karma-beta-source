getgenv().host = "Your Username"
getgenv().whitelist = {"user1", "user2"} -- Optional to fill out
getgenv().defaultfps = 60
getgenv().prefix = "!"
getgenv().shouldbotrender = true -- To show bot's screen or not to reduce lag
RunService = game:GetService("RunService")
TeleportService = game:GetService("TeleportService") -- Remove this and Rejoin if you are using Delta
PlaceId, JobId = game.PlaceId, game.JobId
local apiws

local function apierr(str)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Failed to connect to the API! (Error: " .. str .. ")")
end

local function sendApiMessage(message)
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
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

game.Players[host].Chatted:Connect(function(message)
    if threadlive then
        local lowerMessage = string.lower(message)
        if lowerMessage == getgenv().prefix.."follow" then
            following = true
            if following then
                while following do
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players[host].Character.HumanoidRootPart.Position)
                    wait()
                end
            end
        elseif lowerMessage == getgenv().prefix.."unfollow" then
            following = false
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
            sendApiMessage("credits, render, dontrender, rejoin, sit, dance, follow, unfollow, jump, reset, cmds, goto, laugh, cheer, wave, and love! ")
        elseif lowerMessage == getgenv().prefix.."stopaltcontrol" then
            threadlive = false
        elseif lowerMessage == getgenv().prefix.."resumealtcontrol" then
            threadlive = true
        end
    end
end)
xpcall(apiws = WebSocket.Connect("localhost:8080"), apierr)
sendApiMessage("KARMA Application Bot by Team D00MBLOX Loaded (Host: " .. getgenv().host .. ")")
print("loaded")