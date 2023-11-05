QBCore = exports['qbx-core']:GetCoreObject()

--- ##########################
--- ### SERVER-ONLY EVENTS ###
--- ##########################

--- Gives a key to an entity based on the player's CitizenID.
---@param id integer The player's ID.
---@param netId number The network ID of the entity.
RegisterNetEvent('vehiclekeys:server:GiveKey', function(id, netId)
    if source == -1 then
        if not id or not netId then return end
        GiveKey(NetworkGetEntityFromNetworkId(netId), QBCore.Functions.GetPlayer(id).PlayerData.citizenid)
    else
        DropPlayer(source, Lang:t('console.invalid_event'))
        print(Lang:t('console.error_server_only', { value = source, event = 'vehiclekeys:server:GiveKey' }))
    end
end)

--- Removes a key from an entity based on the player's CitizenID.
---@param id integer The player's ID.
---@param netId number The network ID of the entity.
RegisterNetEvent('vehiclekeys:server:RemoveKey', function(id, netId)
    if source == -1 then
        if not id or not netId then return end
        RemoveKey(NetworkGetEntityFromNetworkId(netId), QBCore.Functions.GetPlayer(id).PlayerData.citizenid)
    else
        DropPlayer(source, Lang:t('console.invalid_event'))
        print(Lang:t('console.error_server_only', { value = source, event = 'vehiclekeys:server:RemoveKey' }))
    end
end)

--- Sets the door state to a desired value.
--- This event is expected to be called only by the server.
RegisterNetEvent('vehiclekeys:server:SetDoorState', function(netId, doorState)
    if source == -1 then
        if not netId or not doorState then return end
        SetDoorState(NetworkGetEntityFromNetworkId(netId), doorState)
    else
        DropPlayer(source, Lang:t('console.invalid_event'))
        print(Lang:t('console.error_server_only', { value = source, event = 'vehiclekeys:server:SetDoorState' }))
    end
end)

--- #############################
--- ### CLIENT-SIDE CALLBACKS ###
--- #############################

--- Gives a key to an entity based on the target player's CitizenID but only if the owner already has a key.
---@param source number ID of the player
---@param netId number The network ID of the entity.
---@param targetPlayerId number ID of the target player who receives the key
---@return boolean | nil
lib.callback.register('vehiclekeys:server:GiveKey', function(source, netId, targetPlayerId)
    if not source or not netId or not targetPlayerId then return end
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
    local targetPlayerCitizenid = QBCore.Functions.GetPlayer(targetPlayerId).PlayerData.citizenid
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not citizenid or not entity or not targetPlayerCitizenid then return end
    if HasKey(entity, citizenid) then
        return not HasKey(entity, targetPlayerCitizenid) and GiveKey(entity, targetPlayerCitizenid)
    else
        TriggerClientEvent('ox_lib:notify', source, { --swap with qbx notify !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            description = Lang:t("notify.no_keys"),
            type = 'error'
        })
    end
end)

--- Removes a key from an entity based on the target player's CitizenID but only if the owner has a key.
---@param source number ID of the player
---@param netId number The network ID of the entity.
---@param targetPlayerId number ID of the target player who receives the key
---@return boolean | nil
lib.callback.register('vehiclekeys:server:RemoveKey', function(source, netId, targetPlayerId)
    if not source or not netId or not targetPlayerId then return end
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
    local targetPlayerCitizenid = QBCore.Functions.GetPlayer(targetPlayerId).PlayerData.citizenid
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not citizenid or not entity or not targetPlayerCitizenid then return end
    if HasKey(entity, citizenid) then
        return HasKey(entity, targetPlayerCitizenid) and RemoveKey(entity, targetPlayerCitizenid)
    else
        TriggerClientEvent('ox_lib:notify', source, { --swap with qbx notify !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            description = Lang:t("notify.no_keys"),
            type = 'error'
        })
    end
end)

--- Sets the door state to a desired value.
---@param source number ID of the player
---@param netId number The network ID of the entity
---@param doorState number The door state of the vehicle (e.g., open = 0)
lib.callback.register('vehiclekeys:server:SetDoorState', function(source, netId, doorState)
    if not source or not netId or not doorState then return end
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not citizenid or not entity then return end
    if HasKey(entity, citizenid) then
        if IsCloseToCoords(GetEntityCoords(entity), GetEntityCoords(GetPlayerPed(source)), Config.vehicleLockingDistance + 20.0) then
            SetDoorState(entity, doorState)
        else
            DropPlayer(source, 'Attempt to Exploit')
            print('^1 Player '..source..' failed distance check during (callback: vehiclekeys:server:SetDoorState)')
        end
    else
        TriggerClientEvent('ox_lib:notify', source, { --swap with qbx notify !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            description = Lang:t("notify.no_keys"),
            type = 'error'
        })
    end
end)

--- ###############
--- ### EXPORTS ###
--- ###############

--[[
--- Adds a key to the selected vehicle entity and returns a success status.
---@param netId number The netId of the vehicle to add the key to.
---@param citizenid string The CitizenID of the player whose key is being added.
---@return boolean | nil `true` if the key was successfully added, `nil` otherwise.
exports('GiveKey', function(netId, citizenid)
    if not netId or not citizenid then return end
    return GiveKey(NetworkGetEntityFromNetworkId(netId), citizenid)
end)

--- Removes a key from the selected vehicle entity and returns a success status.
---@param netId number The netId of the vehicle from which the key is being removed.
---@param citizenid string The CitizenID of the player whose key is being removed.
---@return boolean | nil `true` if the key was successfully removed, `nil` otherwise.
exports('RemoveKey', function(netId, citizenid)
    if not netId or not citizenid then return end
    return RemoveKey(NetworkGetEntityFromNetworkId(netId), citizenid)
end)
]]