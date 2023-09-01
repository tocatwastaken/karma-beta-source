_G["RBXUtils"] = {
    OnPlayerJoined = function(functoconnect)
        connection = game.Players.PlayerAdded:Connect(functoconnect)
        return connection
    end,
    OnPlayerLeft = function(functoconnect)
        connection = game.Players.PlayerRemoving:Connect(functoconnect)
        return connection
    end,
    OnGameLoaded = function(functoconnect)
        repeat wait() until game:IsLoaded()
        functoconnect()
    end,
    OnCharacterAdded = function(functoconnect)
        OnPlayerJoined(function(player)
            connection = player.CharacterAdded:Connect(functoconnect)
            return connection
        end)
    end,
    NewInstance = function(typetomake, properties)
        inst = Instance.new(typetomake, properties)
        return inst
    end,
    DestroyInstance = function(insttodestroy)
        insttodestroy:Destroy()
    end,
    ConsoleClear = function()
        rconsoleclear()
    end,
    ConsoleTitle = function(title)
        rconsoletitle(title)
    end,
    ConsolePrint = function(msg)
        rconsoleprint(msg .. "\n")
    end,
    ConsoleWarn = function(msg)
        rconsoleprint("[WARN]", msg .. "\n")
    end,
    ConsoleErr = function(msg)
        rconsoleprint("[ERROR]", msg .. "\n")
    end, 
    ConsoleInfo = function(msg)
        rconsoleprint("[INFO]", msg .. "\n")
    end,
    
}