fx_version 'cerulean'
game 'gta5'
author 'Aurora'

description 'vehiclekeys'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/functions.lua',
	'shared/config.lua',
}

client_scripts {
	'client/main.lua',
  	'client/clientFunctions.lua'
}

server_scripts{
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
  	'server/serverFunctions.lua'
}

dependency{
	'qbx-core',
	'ox_lib',
}

lua54 'yes'