--- Adds a key to the selected vehicle entity and returns a success status.
---@param entity number The entity (vehicle) to which the key is added.
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
---@param entity number The entity (vehicle) from which the key is removed.
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

--- Sets the door state of the vehicle.
---@param entity number The entity (vehicle) for which the door state is updated.
---@param doorState number The door state number to update.
---@return boolean | nil `true` if the door state was successfully updated, `nil` otherwise.
function SetDoorState(entity, doorState)
    if not entity or not doorState then return end
    local ent = Entity(entity)
    if not ent then return end
    ent.state:set('doorState', doorState, true)
    return true
end

--- Checks for the existence of a key.
---@param entity number The entity (vehicle) where we check for the existence of a key.
---@param citizenid string The CitizenID of the player whose key we check for.
function HasKey(entity, citizenid)
    return Entity(entity).state.keys[citizenid]
end

--- Checks if the given two coordinates are close to each other based on distance.
---@param coord1 vector3[] The first set of coordinates.
---@param coord2 vector3[] The second set of coordinates.
---@param distance number The maximum allowed distance for them to be considered close.
function IsCloseToCoords(coord1, coord2, distance)
    return #(coord1 - coord2) < distance
end