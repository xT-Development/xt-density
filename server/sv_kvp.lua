local globalState = GlobalState
local config = require 'configs.server'

-- Init Density Values --
local function initDensity()
    local newStates = {}
    local disableDensity = (GetResourceKvpInt('density_disable') == 1) and true or false

    for densityType in pairs(config.defaultValues) do
        local setDensity = GetResourceKvpFloat(('density_%s'):format(densityType)) or config.defaultValues[densityType]
        newStates[densityType] = tonumber(('%.1f'):format(setDensity))
    end

    globalState.density = newStates
    globalState.disableDensity = disableDensity
end

-- Save Density Values to KVP --
local function saveDensity()
    local disableDensity = globalState.disableDensity and 1 or 0
    SetResourceKvpIntNoSync('density_disable', disableDensity)

    for densityType in pairs(globalState.density) do
        SetResourceKvpFloatNoSync(('density_%s'):format(densityType), globalState.density[densityType])
    end
    FlushResourceKvp()
end

-- Handlers --
AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    initDensity()
 end)

 AddEventHandler('onResourceStop', function(resource)
     if resource ~= GetCurrentResourceName() then return end
     saveDensity()
 end)