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
}