local lib = lib
local globalState = GlobalState
local SetParkedVehicleDensityMultiplierThisFrame =  SetParkedVehicleDensityMultiplierThisFrame
local SetVehicleDensityMultiplierThisFrame =        SetVehicleDensityMultiplierThisFrame
local SetRandomVehicleDensityMultiplierThisFrame =  SetRandomVehicleDensityMultiplierThisFrame
local SetPedDensityMultiplierThisFrame =            SetPedDensityMultiplierThisFrame
local SetScenarioPedDensityMultiplierThisFrame =    SetScenarioPedDensityMultiplierThisFrame

CreateThread(function()
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