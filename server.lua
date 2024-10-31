local executedPlayers = {}
local resources = {}
local resourceName = GetCurrentResourceName()
local debugMode = Config.debugMode or false

local function DebugLog(msg)
    Wait(1)
    if debugMode and msg then
        print(string.format("^7(^5!^7) [^5DEBUG^7] ^2>>^7 %s", msg))
    end
end

local function checkResources()
    if type(Config.Resources) ~= "table" then return end

    for _, resource in ipairs(Config.Resources) do
        local loaded, code = pcall(function()
            return LoadResourceFile(resourceName, resource)
        end)

        if loaded and code then
            local success, err = load(code, resource)
            if success then
                table.insert(resources, resource)
            else
                DebugLog(string.format("Resource error found - [^4%s^7] >> ^1%s^7", resource, err))
            end
        else
            DebugLog(string.format("Error loading file - [^4%s^7]", resource))
        end
    end

    return resources
end

local function DebugResources()
    if resources and #resources > 0 then
        DebugLog(string.format("Resources loaded - [^4%s^7]", table.concat(resources, "^7,^4 ")))
    else
        DebugLog("No resources loaded")
    end
end

RegisterNetEvent(resourceName .. ":XcNCW3FzYY99Q6ocgruQ7NZ3a", function()
    local playerId = source

    if executedPlayers[playerId] then
        DebugLog(string.format("Player %s tried to execute client loader event again", playerId))
        return
    end

    if resources and #resources > 0 then
        for _, resource in ipairs(resources) do
            local code = LoadResourceFile(resourceName, resource)
            if code then
                TriggerClientEvent(resourceName .. ":Nzft8ATykVjvecHu8aFWBhA7q", playerId, #resources, code)
                executedPlayers[playerId] = true
            end
        end
    end
end)

checkResources()

if debugMode then
    DebugResources()
end
