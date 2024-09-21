local currentElevator = nil

local function GetPlayerCurrentFloor(elevatorData)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local closestFloor = nil
    local closestDistance = 100.0

    for floorIndex, floorData in pairs(elevatorData.floors) do
        local distance = #(playerCoords - vector3(floorData.coords.x, floorData.coords.y, floorData.coords.z))
        
        if distance < closestDistance then
            closestFloor = floorIndex
            closestDistance = distance
        end
    end

    return closestFloor
end

local function OpenElevatorMenu(elevatorName)
    local elevatorData = Config.Elevators[elevatorName]
    local currentFloor = GetPlayerCurrentFloor(elevatorData)

    currentElevator = elevatorName
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        elevator = elevatorData,
        currentFloor = currentFloor
    })
end

CreateThread(function()
    for elevatorName, elevatorData in pairs(Config.Elevators) do
        for floorIndex, floor in pairs(elevatorData.floors) do
            exports['qb-target']:AddBoxZone("elevator_" .. elevatorName .. "_" .. floorIndex, vector3(floor.coords.x, floor.coords.y, floor.coords.z), 1.5, 1.5, {
                name = "elevator_" .. elevatorName .. "_" .. floorIndex,
                heading = 0,
                debugPoly = false,
                minZ = floor.coords.z - 1,
                maxZ = floor.coords.z + 1,
            }, {
                options = {
                    {
                        type = "client",
                        event = "txs-elevator:client:openMenu",
                        icon = "fas fa-arrow-up",
                        label = "Use Elevator",
                        elevatorName = elevatorName
                    }
                },
                distance = 2.0
            })
        end
    end
end)

RegisterNetEvent('txs-elevator:client:openMenu', function(data)
    OpenElevatorMenu(data.elevatorName)
end)

RegisterNUICallback('selectFloor', function(data, cb)
    local selectedFloor = tonumber(data.floor) + 1
    local elevatorData = Config.Elevators[currentElevator]
    local floorCoords = elevatorData.floors[selectedFloor].coords
    local reachedFloor = tostring('reached_floor_'..selectedFloor-1)
    SetNuiFocus(false, false)
    DoScreenFadeOut(200)
    Wait(2000)
    DoScreenFadeIn(200)
    SetEntityCoords(PlayerPedId(), floorCoords.x, floorCoords.y, floorCoords.z)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, 'elevator_ding', 0.5)
    Wait(2500)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, reachedFloor, 0.5)
    cb("ok")
end)

RegisterNUICallback('closeMenu', function(_, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)