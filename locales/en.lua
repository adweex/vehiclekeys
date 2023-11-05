local Translations = {
    notify = {
        no_keys = 'You don\'t have keys to this vehicle.',
        not_near = 'There is nobody nearby to hand keys to',
        not_near_vehicle = 'There is no vehicle nearby',
        failed_givekey = 'You failed to hand over the keys',
        failed_removekey = 'You failed to take away the keys',
        failed_doorstate = 'You failed to change the state of the door',
        success_removekey = 'You successfuly took aray the keys',
        --vehicle_locked = 'Vehicle locked!',
        --vehicle_unlocked = 'Vehicle unlocked!',
        --vehicle_lockedpick = 'You managed to pick the door lock open!',
        --failed_lockedpick = 'You fail to find the keys and get frustrated.',
        gave_keys = 'You hand over the keys.',
        keys_taken = 'You get keys to the vehicle!',
        keys_lost = 'You lost the keys to a vehicle!',
        --fpid = 'Fill out the player ID and Plate arguments',
        --carjack_failed = 'Carjacking failed!',
    },
    progress = {
        --takekeys = 'Taking keys from body...',
        --searching_keys = 'Searching for the car keys...',
        --attempting_carjack = 'Attempting Carjacking...',
    },
    info = {
        --search_keys = '~g~[H]~w~ - Search for Keys',
        --toggle_locks = 'Toggle Vehicle Locks',
        --vehicle_theft = 'Vehicle theft in progress. Type: ',
        --engine = 'Toggle Engine',
    },
    addcom = {
        --givekeys = 'Hand over the keys to someone. If no ID, gives to closest person or everyone in the vehicle.',
        --givekeys_id = 'id',
        --givekeys_id_help = 'Player ID',
        --addkeys = 'Adds keys to a vehicle for someone.',
        --addkeys_id = 'id',
        --addkeys_id_help = 'Player ID',
        --addkeys_plate = 'plate',
        --addkeys_plate_help = 'Plate',
        --remove_keys = 'Remove keys to a vehicle for someone.',
        --remove_keys_id = 'id',
        --remove_keys_id_help = 'Player ID',
        --remove_keys_plate = 'plate',
        --remove_keys_plate_help = 'Plate',
    },
    console = {
        error_invalid_event = 'Invalid Event',
        error_server_only = '^1 Player %{value} attempted to call a server-only event (%{event})'
    }

}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})