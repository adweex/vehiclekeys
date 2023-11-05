--- Handles giving keys to the target player for the closest vehicle within a certain distance.
---@param targetPlayerId number The ID of the target player who will receive the key.
RegisterNetEvent('vehiclekeys:client:GiveKeys', function(targetPlayerId)
    if not targetPlayerId then return end
    local vehicle = lib.getClosestVehicle(GetEntityCoords(cache.ped), Config.vehicleLockingDistance, true)
    
    if vehicle then
        GiveKey(targetPlayerId, vehicle)
    else
        lib.notify({
            description = Lang:t("notify.not_near_vehicle"),
            type = 'error'
        })
    end
end)

--- Handles the removal of keys from the target player for the closest vehicle within a certain distance.
---@param targetPlayerId number The ID of the target player from whom the key is being removed.
RegisterNetEvent('vehiclekeys:client:RemoveKeys', function(targetPlayerId)
    print('NOT YET IMPLEMENTED EXCEPTION')
end)
