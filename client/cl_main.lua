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

local function disableDispatch()
    if not config.disableDispatchServices then return end

    CreateThread(function()
        for i = 1, 15 do
            EnableDispatchService(i, false)
        end
    end)
end

local function removeVehicles()
    if not config.removeVehiclesFromGeneratorsInArea or not next(config.removeVehiclesFromGeneratorsInArea) then return end

    CreateThread(function()
        for x = 1, #config.removeVehiclesFromGeneratorsInArea do
            local coords = config.removeVehiclesFromGeneratorsInArea[x].coords
            local distance = config.removeVehiclesFromGeneratorsInArea[x].distance
            RemoveVehiclesFromGeneratorsInArea((coords.x - distance), (coords.y - distance), (coords.z - distance), (coords.x + distance), (coords.y + distance), (coords.z + distance))
        end
    end)
end

local function setPopulationBudgets()
    SetPedPopulationBudget(config.pedPopulationBudget)
    SetVehiclePopulationBudget(config.vehiclePopulationBudget)
end

CreateThread(function()
    disableDispatch()
    removeVehicles()
    setPopulationBudgets()

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