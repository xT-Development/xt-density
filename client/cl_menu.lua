local lib = lib
local globalState = GlobalState

-- Input New Density Float --
local function densityInput()
    local input = lib.inputDialog('New Density', {
        { type = 'slider', label = 'Density Amount', min = 0.0, max = 1.0, step = 0.1 },
    })
    if not input or not input[1] then return end
    return input[1]
end

-- Handle onSelect to Modify Density Type --
local function handleDensityChange(type)
    local newInput = densityInput()
    if not newInput then return end

    local densityChanged = lib.callback.await('xt-density:server:setDensity', false, type, newInput)
    if densityChanged then
        lib.notify({ title = ('Density Set: %s'):format(newInput), type = 'success' })
    end
end

-- View All Density Values --
RegisterNetEvent('xt-density:client:densityMenu', function()
    local hasPerms = lib.callback.await('xt-density:server:hasDensityMenuPerm', false)
    if not hasPerms then return end

    lib.registerContext({
        id = 'density_menu',
        title = 'Server Vehicle / Ped Density',
        options = {
            {
                title = ('Parked Vehicles: %s'):format(globalState.disableDensity and 'OFF' or globalState.density['parked']),
                icon = 'fas fa-car',
                onSelect = function()
                    handleDensityChange('parked')
                end
            },
            {
                title = ('Vehicles: %s'):format(globalState.disableDensity and 'OFF' or globalState.density['vehicle']),
                icon = 'fas fa-car',
                onSelect = function()
                    handleDensityChange('vehicle')
                end
            },
            {
                title = ('Peds: %s'):format(globalState.disableDensity and 'OFF' or globalState.density['peds']),
                icon = 'fas fa-person',
                onSelect = function()
                    handleDensityChange('peds')
                end
            },
            {
                title = ('Scenario Peds: %s'):format(globalState.disableDensity and 'OFF' or globalState.density['scenario']),
                icon = 'fas fa-person-walking',
                onSelect = function()
                    handleDensityChange('scenario')
                end
            },
            {
                title = ('Multiplier: %s'):format(globalState.disableDensity and 'OFF' or globalState.density['multiplier']),
                icon = 'fas fa-xmark',
                onSelect = function()
                    handleDensityChange('multiplier')
                end
            },
            {
                title = ('%s Density'):format(globalState.disableDensity and 'Enable' or 'Disable'),
                icon = globalState.disableDensity and 'fas fa-check' or 'fas fa-xmark',
                iconColor = globalState.disableDensity and '#008000' or '#ff0000',
                onSelect = function()
                    local densityChanged = lib.callback.await('xt-density:server:toggleServerDensity', false)
                    if densityChanged then
                        lib.notify({ title = 'Toggled Density', type = 'success' })
                    end
                end
            },
        }
    })
    lib.showContext('density_menu')
end)