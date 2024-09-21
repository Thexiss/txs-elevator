DynamicElevators = {}

exports('AddElevator', function(elevatorName, data)
    DynamicElevators[elevatorName] = data
    TriggerClientEvent('txs-elevator:client:updateElevators', -1, DynamicElevators)
end)

RegisterNetEvent('txs-elevator:client:requestElevators', function()
    local src = source
    TriggerClientEvent('txs-elevator:client:updateElevators', src, DynamicElevators)
end)
