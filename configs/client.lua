return {
    debug = true,                                  -- Enable client debug messages

    disableDispatchServices = true,                 -- Disable emergency service AIs from responding to downed NPCs
    removeVehiclesFromGeneratorsInArea = {          -- Disable car generators in areas. Coords is center, distance is subtracted and added to the coords values to create a bounding box
        { coords = vec3(318.79,  -1481.95, 29.89),  distance = 300.0 },     -- Central LS Medical Center
        { coords = vec3(441.8465, -987.99,  30.68), distance = 300.0 },     -- MRPD
        { coords = vec3(316.79,   -592.36,  43.28), distance = 300.0 },     -- Pillbox
        { coords = vec3(-2150.44, 3075.99,  32.8),  distance = 300.0 },     -- Military
        { coords = vec3(-1108.35, 4920.64, 217.2),  distance = 300.0 },     -- Nudist Colony
        { coords = vec3(-458.24,  6019.81, 31.34),  distance = 300.0 },     -- Paleto PD
        { coords = vec3(1854.82,  3679.4,   33.82), distance = 300.0 },     -- Sandy PD
        { coords = vec3(-724.46,  -1444.03, 5.0),   distance = 300.0 },     -- Remove Choppers
        { coords = vec3(371.58,   -1270.57, 33.41), distance = 20.0 },      -- Blaze It
    },

    pedPopulationBudget = 3,                -- https://docs.fivem.net/natives/?_0x8C95333CFC3340F3
    vehiclePopulationBudget = 3,            -- https://docs.fivem.net/natives/?_0xCB9E1EB3BE2AF4E9

    -- Credit: https://github.com/Qbox-project/qbx_smallresources
    blacklisted = {                                 -- Add blacklisted scenarios, vehicle models, and scenario groups
        enableBlacklist = true,                     -- Enable/disable blacklisting thread. qb/qbx-smallresources already has this thread
        scenarioTypes = {
            'WORLD_VEHICLE_AMBULANCE',
            'WORLD_VEHICLE_FIRE_TRUCK',
            'WORLD_VEHICLE_POLICE_BIKE',
            'WORLD_VEHICLE_POLICE_CAR',
            'WORLD_VEHICLE_POLICE',
            'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
            'WORLD_VEHICLE_SECURITY_CAR',
            'WORLD_VEHICLE_HELI_LIFEGUARD',
            'WORLD_VEHICLE_MILITARY_PLANES_BIG',
            'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
        },

        suppressedModels = {
            'SHAMAL',
            'LUXOR',
            'LUXOR2',
            'JET',
            'LAZER',
            'TITAN',
            'CRUSADER',
            'RHINO',
            'AIRTUG',
            'RIPLEY',
            'BLIMP',
            'BUZZARD',
            'stromberg'
        },

        scenarioGroups = {
            'LSA_Planes',
            'SANDY_PLANES',
            'GRAPESEED_PLANES',
            `ng_planes`,
        },
    }
}