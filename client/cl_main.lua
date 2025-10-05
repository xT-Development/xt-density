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

function debugTxt(text)
    if not config.debug then return end

    lib.print.info('^5[DENSITY]^0 '..text)
end

local function disableDispatch()
    if not config.disableDispatchServices then return end

    debugTxt('Disabling dispatch services...')

    CreateThread(function()
        for i = 1, 15 do
            EnableDispatchService(i, false)
        end
        SetCreateRandomCops(false)
        SetCreateRandomCopsOnScenarios(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetDispatchCopsForPlayer(cache.playerId, false)
    end)
end

local function removeVehicles()
    if not config.removeVehiclesFromGeneratorsInArea or not next(config.removeVehiclesFromGeneratorsInArea) then return end

    debugTxt('Removing vehicles from generators in areas...')

    CreateThread(function()
        for x = 1, #config.removeVehiclesFromGeneratorsInArea do
            local coords = config.removeVehiclesFromGeneratorsInArea[x].coords
            local distance = config.removeVehiclesFromGeneratorsInArea[x].distance

            RemoveVehiclesFromGeneratorsInArea((coords.x - distance), (coords.y - distance), (coords.z - distance), (coords.x + distance), (coords.y + distance), (coords.z + distance))
        end
    end)
end

local function setPopulationBudgets()
    debugTxt('Setting population budgets...')

    SetPedPopulationBudget(config.pedPopulationBudget)
    SetVehiclePopulationBudget(config.vehiclePopulationBudget)
end

CreateThread(function()
    disableDispatch()
    removeVehicles()
    setPopulationBudgets()

    debugTxt('Applying density values...')

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
            if config.blacklisted.scenarioTypes and next(config.blacklisted.scenarioTypes) then
                for x = 1, #config.blacklisted.scenarioTypes do
                    SetScenarioTypeEnabled(config.blacklisted.scenarioTypes[x], false)
                end
            end

            if config.blacklisted.suppressedModels and next(config.blacklisted.suppressedModels) then
                for x = 1, #config.blacklisted.suppressedModels do
                    SetVehicleModelIsSuppressed(config.blacklisted.suppressedModels[x], true)
                end
            end

            if config.blacklisted.scenarioGroups and next(config.blacklisted.scenarioGroups) then
                for x = 1, #config.blacklisted.scenarioGroups do
                    SetScenarioGroupEnabled(config.blacklisted.scenarioGroups[x], false)
                end
            end

            Wait(10000)
        end
    end)
end