Config = {
    --- debug
    debug = true,

    vehicleLockingDistance = 5.0,
    
    -- NPC Vehicle Lock States
    lockNPCDrivenCars = true, -- Lock state for NPC cars being driven by NPCs [true = locked, false = unlocked]
    lockNPCParkedCars = true, -- Lock state for NPC parked cars [true = locked, false = unlocked]
    
    -- Lockpick Settings
    removeNormalLockpickChance = { -- Chance to remove lockpick on fail
        [0] = 0.5, -- Compacts  
        [1] = 0.5, -- Sedans  
        [2] = 0.5, -- SUVs  
        [3] = 0.5, -- Coupes  
        [4] = 0.5, -- Muscle  
        [5] = 0.5, -- Sports Classics  
        [6] = 0.5, -- Sports  
        [7] = 0.5, -- Super  
        [8] = 0.5, -- Motorcycles  
        [9] = 0.5, -- Off-road  
        [10] = 0.5, -- Industrial  
        [11] = 0.5, -- Utility  
        [12] = 0.5, -- Vans  
        [13] = 0.5, -- Cycles  
        [14] = 0.5, -- Boats  
        [15] = 0.5, -- Helicopters  
        [16] = 0.5, -- Planes  
        [17] = 0.5, -- Service  
        [18] = 0.5, -- Emergency  
        [19] = 0.5, -- Military  
        [20] = 0.5, -- Commercial  
        [21] = 0.5, -- Trains  
        [22] = 0.5, -- Open Wheel
    },
    removeLockpickAdvanced = { -- Chance to remove advanced lockpick on fail
        [0] = 0.5, -- Compacts  
        [1] = 0.5, -- Sedans  
        [2] = 0.5, -- SUVs  
        [3] = 0.5, -- Coupes  
        [4] = 0.5, -- Muscle  
        [5] = 0.5, -- Sports Classics  
        [6] = 0.5, -- Sports  
        [7] = 0.5, -- Super  
        [8] = 0.5, -- Motorcycles  
        [9] = 0.5, -- Off-road  
        [10] = 0.5, -- Industrial  
        [11] = 0.5, -- Utility  
        [12] = 0.5, -- Vans  
        [13] = 0.5, -- Cycles  
        [14] = 0.5, -- Boats  
        [15] = 0.5, -- Helicopters  
        [16] = 0.5, -- Planes  
        [17] = 0.5, -- Service  
        [18] = 0.5, -- Emergency  
        [19] = 0.5, -- Military  
        [20] = 0.5, -- Commercial  
        [21] = 0.5, -- Trains  
        [22] = 0.5, -- Open Wheel
    },

    -- Carjack Settings
    carJackEnable = true, -- True allows for the ability to car jack peds.
    carjackingTime = 7500, -- How long it takes to carjack
    delayBetweenCarjackings = 10000, -- Time before you can carjack again
    carjackChance = {
        ['2685387236'] = 0.0, -- melee
        ['416676503'] = 0.5, -- handguns
        ['-957766203'] = 0.75, -- SMG
        ['860033945'] = 0.90, -- shotgun
        ['970310034'] = 0.90, -- assault
        ['1159398588'] = 0.99, -- LMG
        ['3082541095'] = 0.99, -- sniper
        ['2725924767'] = 0.99, -- heavy
        ['1548507267'] = 0.0, -- throwable
        ['4257178988'] = 0.0, -- misc
    },
    -- Hotwire Settings
    hotwireChance = 0.5, -- Chance for successful hotwire or not
    timeBetweenHotwires = 5000, -- Time in ms between hotwire attempts
    minHotwireTime = 20000, -- Minimum hotwire time in ms
    maxHotwireTime = 40000, --  Maximum hotwire time in ms

    -- Police Alert Settings
    alertCooldown = 10000, -- 10 seconds
    policeAlertChance = 0.75, -- Chance of alerting police during the day
    policeNightAlertChance = 0.50, -- Chance of alerting police at night (times:01-06)

    -- These vehicles cannot be jacked
    immuneVehicles = {
        'stockade'
    },

    -- These vehicles will never lock
    noLockVehicles = {

    },

    -- These weapons cannot be used for carjacking
    noCarjackWeapons = {
        "WEAPON_UNARMED",
        "WEAPON_Knife",
        "WEAPON_Nightstick",
        "WEAPON_HAMMER",
        "WEAPON_Bat",
        "WEAPON_Crowbar",
        "WEAPON_Golfclub",
        "WEAPON_Bottle",
        "WEAPON_Dagger",
        "WEAPON_Hatchet",
        "WEAPON_KnuckleDuster",
        "WEAPON_Machete",
        "WEAPON_Flashlight",
        "WEAPON_SwitchBlade",
        "WEAPON_Poolcue",
        "WEAPON_Wrench",
        "WEAPON_Battleaxe",
        "WEAPON_Grenade",
        "WEAPON_StickyBomb",
        "WEAPON_ProximityMine",
        "WEAPON_BZGas",
        "WEAPON_Molotov",
        "WEAPON_FireExtinguisher",
        "WEAPON_PetrolCan",
        "WEAPON_Flare",
        "WEAPON_Ball",
        "WEAPON_Snowball",
        "WEAPON_SmokeGrenade",
    }
}
