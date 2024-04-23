return {
    disableDispatchServices = true,                 -- Disable emergency service AIs from responding to downed NPCs
    removeVehiclesFromGeneratorsInArea = {          -- Disable car generators in areas
        { x1 = 335.2616, y1 = -1432.455, z1 = 46.51, x2 = 335.2616, y2 = -1432.455, z2 = 46.51 },       -- Central LS Medical Center
        { x1 = 441.8465, y1 = -987.99, z1 = 30.68, x2 = 441.8465, y2 = -987.99, z2 = 30.68 },           -- MRPD
        { x1 = 316.79, y1 = -592.36, z1 = 43.28, x2 = 316.79, y2 = -592.36, z2 = 43.28 },               -- Pillbox
        { x1 = -2150.44, y1 = 3075.99, z1 = 32.8, x2 = -2150.44, y2 = 3075.99, z2 = 32.8 },             -- Military
        { x1 = -1108.35, y1 = 4920.64, z1 = 217.2, x2 = -1108.35, y2 = 4920.64, z2 = 217.2 },           -- Nudist Colony
        { x1 = -458.24, y1 = 6019.81, z1 = 31.34, x2 = -458.24, y2 = 6019.81, z2 = 31.34 },             -- Paleto PD
        { x1 = 1854.82, y1 = 3679.4, z1 = 33.82, x2 = 1854.82, y2 = 3679.4, z2 = 33.82 },               -- Sandy PD
        { x1 = -724.46, y1 = -1444.03, z1 = 5.0, x2 = -724.46, y2 = -1444.03, z2 = 5.0 },               -- Remove Choppers
    },
    blacklisted = {                                 -- Add blacklisted scenarios, vehicle models, and scenario groups
        enableBlacklist = false,                    -- Enable/disable blacklisting thread. qb/qbx-smallresources already has this thread
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
        },

        scenarioGroups = {
            'LSA_Planes',
            'SANDY_PLANES',
            'GRAPESEED_PLANES',
            `ng_planes`,
        },
    }
}