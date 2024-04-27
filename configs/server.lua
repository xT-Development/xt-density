return {
    requiredPermission = 'admin',       -- Required ace permission to use the menu
    commandName = 'density',            -- Command to open the menu
    defaultValues = {                   -- Default density values
        ['parked'] = 0.8,
        ['vehicle'] = 0.8,
        ['peds'] = 0.8,
        ['scenario'] = 0.8,
        ['multiplier'] = 0.8
    },

    -- Credit: https://github.com/Qbox-project/qbx_smallresources
    blacklisted = {                                 -- Add blacklisted vehicle and ped models
        enableBlacklist = true,                     -- Enable/disable blacklisting. qb/qbx-smallresources already has this
        vehicles = {
            `SHAMAL`,
            `LUXOR`,
            `LUXOR2`,
            `JET`,
            `LAZER`,
            `BUZZARD`,
            `BUZZARD2`,
            `ANNIHILATOR`,
            `SAVAGE`,
            `TITAN`,
            `RHINO`,
            `FIRETRUK`,
            `MULE`,
            `MAVERICK`,
            `BLIMP`,
            `AIRTUG`,
            `CAMPER`,
            `HYDRA`,
            `OPPRESSOR`,
            `technical3`,
            `insurgent3`,
            `apc`,
            `tampa3`,
            `trailersmall2`,
            `halftrack`,
            `hunter`,
            `vigilante`,
            `akula`,
            `barrage`,
            `khanjali`,
            `caracara`,
            `blimp3`,
            `menacer`,
            `oppressor2`,
            `scramjet`,
            `strikeforce`,
            `cerberus`,
            `cerberus2`,
            `cerberus3`,
            `scarab`,
            `scarab2`,
            `scarab3`,
            `rrocket`,
            `ruiner2`,
            `deluxo`,
        },

        peds = {
            `s_m_y_ranger_01`,
            `s_m_y_sheriff_01`,
            `s_m_y_cop_01`,
            `s_f_y_sheriff_01`,
            `s_f_y_cop_01`,
            `s_m_y_hwaycop_01`,
        },
    }
}