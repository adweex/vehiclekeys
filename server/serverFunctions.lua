--- Adds a key to the selected vehicle entity and returns a success status.
---@param entity number The entity (vehicle) to add the key to.
---@param citizenid string The CitizenID of the player whose key is being added.
---@return boolean | nil `true` if the key was successfully added, `nil` otherwise.
function GiveKey(entity, citizenid)
    if not entity or not citizenid then return end
    local ent = Entity(entity)
    if not ent then return end

    local keyholders = {}
    if not ent.state.keys then
        ent.state:set('doorState', 0, true)
        keyholders = { [citizenid] = true }
    else
        if not ent.state.keys[citizenid] then
            keyholders = ent.state.keys
            keyholders[citizenid] = true
        else return end
    end
    ent.state:set('keys', keyholders, true)
    return true
end

--- Removes a key from the selected vehicle entity and returns a success status.
---@param entity number The entity (vehicle) from which the key is being removed.
---@param citizenid string The CitizenID of the player whose key is being removed.
---@return boolean | nil `true` if the key was successfully removed, `nil` otherwise.
function RemoveKey(entity, citizenid)
    if not entity or not citizenid then return end
    local ent = Entity(entity)
    if not ent then return end

    local keyholders = ent.state.keys
    if not keyholders or not keyholders[citizenid] then return end

    keyholders[citizenid] = nil
    ent.state:set('keys', keyholders, true)
    return true
end

---@param entity number The entity (vehicle) from which the key is being removed.
---@param doorState number 
function SetDoorState(entity, doorState)

end

function HasKey(entity, citizenid)
    return Entity(entity).state.keyholders[citizenid]
end

---@param coord1 vector3[]
---@param coord2 vector3[]
---@param distance number
function IsCloseToCoords(coord1, coord2, distance)
    return #(coord1 - coord2) < distance
end