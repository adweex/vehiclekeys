fx_version 'cerulean'
game 'gta5'
author 'Aurora'

description 'vehiclekeys'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'@qbx_core/import.lua',
	'@qbx_core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua',
	'shared/functions.lua',
	'shared/config.lua',
}

client_scripts {
	'client/main.lua',
	'client/clientFunctions.lua'
}

server_scripts {
	'server/main.lua',
	'server/serverFunctions.lua',
	'server/commands.lua',
}

modules {
	'qbx_core:playerdata',
	'qbx_core:utils'
}

dependency {
	'qbx_core',
	'ox_lib',
}

lua54 'yes'