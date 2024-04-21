local config = require 'configs.client'

local lib = lib
local globalState = GlobalState
local SetParkedVehicleDensityMultiplierThisFrame =  SetParkedVehicleDensityMultiplierThisFrame
local SetVehicleDensityMultiplierThisFrame =        SetVehicleDensityMultiplierThisFrame
local SetRandomVehicleDensityMultiplierThisFrame =  SetRandomVehicleDensityMultiplierThisFrame
local SetPedDensityMultiplierThisFrame =            SetPedDensityMultiplierThisFrame
local SetScenarioPedDensityMultiplierThisFrame =    SetScenarioPedDensityMultiplierThisFrame

CreateThread(function()
    for x = 1, #config.removeVehiclesFromGeneratorsInArea do
        local coords = config.removeVehiclesFromGeneratorsInArea[x]
        RemoveVehiclesFromGeneratorsInArea((coords.x1 - 300.0), (coords.y1 - 300.0), (coords.z1 - 300.0), (coords.x2 + 300.0), (coords.y2 + 300.0), (coords.z2 + 300.0))
    end

    if config.disableDispatchServices then
        for i = 1, 15 do
            EnableDispatchService(i, false)
        end
    end

    while true do
        local parkedDensity =       globalState.disableDensity and 0 or globalState.density['parked']
        local vehicleDensity =      globalState.disableDensity and 0 or globalState.density['vehicle']
        local multiplierDensity =   globalState.disableDensity and 0 or globalState.density['multiplier']
        local pedsDensity =         globalState.disableDensity and 0 or globalState.density['peds']
        local scenarioDensity =     globalState.disableDensity and 0 or globalState.density['scenario']

        SetParkedVehicleDensityMultiplierThisFrame(parkedDensity)
        SetVehicleDensityMultiplierThisFrame(vehicleDensity)
        SetRandomVehicleDensityMultiplierThisFrame(multiplierDensity)
        SetPedDensityMultiplierThisFrame(pedsDensity)
        SetScenarioPedDensityMultiplierThisFrame(scenarioDensity, scenarioDensity)

        Wait(0)
    end
end)