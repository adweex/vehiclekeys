lib.addCommand('givekeys', {
    help = Lang:t("addcom.givekeys"),
    params = {
        {
            name = Lang:t("addcom.givekeys_id"),
            type = 'number',
            help = Lang:t("addcom.givekeys_id_help"),
            optional = true
        },
    },
    restricted = false,
}, function (source, args)
    local src = source
    if IsCloseToCoords(GetEntityCoords(GetPlayerPed(src)), GetEntityCoords(GetPlayerPed(args.id)), 10.0) then
        TriggerClientEvent('vehiclekeys:client:GiveKeys', src, args.id)
    else
        TriggerClientEvent('ox_lib:notify', source, { --swap with qbx notify !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            description = Lang:t("notify.not_near"),
            type = 'error'
        })
    end
end)

--[[ NOT YET IMPLEMENTED
lib.addCommand('addkeys', {
    help = Lang:t("addcom.addkeys"),
    params = {
        {
            name = 'id',
            type = 'number',
            help = Lang:t("addcom.addkeys_id_help"),
            optional = true
        },
        {
            name = 'plate',
            type = 'string',
            help = Lang:t("addcom.addkeys_plate_help"),
            optional = true
        },
    },
    restricted = 'group.admin',
}, function (source, args)
    local src = source
    if not args.id or not args.plate then
        exports.qbx_core:Notify(src, Lang:t("notify.fpid"))
        return
    end
    GiveKeys(args.id, args.plate)
end)


lib.addCommand('removekeys', {
    help = Lang:t("addcom.remove_keys"),
    params = {
        {
            name = 'id',
            type = 'number',
            help = Lang:t("addcom.remove_keys_id_help"),
            optional = true
        },
        {
            name = 'plate',
            type = 'string',
            help = Lang:t("addcom.remove_keys_plate_help"),
            optional = true
        }
    },
    restricted = 'group.admin',
}, function (source, args)
    local src = source
    if not args.id or not args.plate then
        exports.qbx_core:Notify(src, Lang:t("notify.fpid"))
        return
    end
    RemoveKeys(args.id, args.plate)
end)
]]