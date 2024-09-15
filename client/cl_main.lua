local config = lib.load('configs.client')

local lib = lib
local globalState = GlobalState
local SetParkedVehicleDensityMultiplierThisFrame =  SetParkedVehicleDensityMultiplierThisFrame
local SetVehicleDensityMultiplierThisFrame =        SetVehicleDensityMultiplierThisFrame
local SetRandomVehicleDensityMultiplierThisFrame =  SetRandomVehicleDensityMultiplierThisFrame
local SetPedDensityMultiplierThisFrame =            SetPedDensityMultiplierThisFrame
local SetScenarioPedDensityMultiplierThisFrame =    SetScenarioPedDensityMultiplierThisFrame
local SetScenarioTypeEnabled =                      SetScenarioTypeEnabled
local SetVehicleModelIsSuppressed =                 SetVehicleModelIsSuppressed
local SetScenarioGroupEnabled =                     SetScenarioGroupEnabled

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

    SetPedPopulationBudget(config.pedPopulationBudget)
    SetVehiclePopulationBudget(config.vehiclePopulationBudget)

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

-- Credit: https://github.com/Qbox-project/qbx_smallresources
if config.blacklisted.enableBlacklist then
    CreateThread(function()
        while true do
            for _, sctyp in next, config.blacklisted.scenarioTypes do
                SetScenarioTypeEnabled(sctyp, false)
            end
            for _, scmdl in next, config.blacklisted.suppressedModels do
                SetVehicleModelIsSuppressed(joaat(scmdl), true)
            end
            for _, scgrp in next, config.blacklisted.scenarioGroups do
                SetScenarioGroupEnabled(scgrp, false)
            end
            Wait(10000)
        end
    end)
end