local config = lib.load('configs.server')

if config.blacklisted.enableBlacklist then
    AddEventHandler('entityCreating', function(handle)
        local entityModel = GetEntityModel(handle)

        if config.blacklisted.models[entityModel] then
            CancelEvent()
        end
    end)
end