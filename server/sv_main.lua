local lib = lib
local globalState = GlobalState
local config = require 'configs.server'

globalState.disableDensity = globalState.disableDensity or false
globalState.density = {
    ['parked'] = config.defaultValues['parked'],
    ['vehicle'] = config.defaultValues['vehicle'],
    ['peds'] = config.defaultValues['peds'],
    ['scenario'] = config.defaultValues['scenario'],
    ['multiplier'] = config.defaultValues['multiplier']
}

-- Sets Density, Returns Bool --
local function setDensity(type, amount)
    local newStates = {}
    for densityType in pairs(globalState.density) do
        if densityType == type then
            newStates[densityType] = amount
        else
            newStates[densityType] = globalState.density[densityType]
        end
    end

    globalState.density = newStates

    return (globalState.density[type] == amount)
end

-- Set Specific Density Value --
lib.callback.register('xt-density:server:setDensity', function(source, type, amount)
    if not IsPlayerAceAllowed(source, config.requiredPermission) then return end
    return setDensity(type, amount)
end)

-- Disable All Density --
lib.callback.register('xt-density:server:toggleServerDensity', function(source)
    if not IsPlayerAceAllowed(source, config.requiredPermission) then return end
    local setState = (not globalState.disableDensity)

    globalState.disableDensity = setState

    return (globalState.disableDensity == setState)
end)

-- Has Permission to Open Menu --
lib.callback.register('xt-density:server:hasDensityMenuPerm', function(source)
    return IsPlayerAceAllowed(source, config.requiredPermission)
end)

lib.addCommand(config.commandName, {
    help = 'Server Vehicle / Ped Density (Admin Only)',
    params = {},
    restricted = config.requiredPermission
}, function(source, args, raw)
    TriggerClientEvent('xt-density:client:densityMenu', source)
end)