local I = require('openmw.interfaces')
local C = require('scripts.block_stealing.util.constants')

--region Menu Registration

I.Settings.registerGroup {
    page             = C.SETTINGS_KEY_PAGE,
    key              = C.SETTINGS_KEY_GROUP_BEHAVIOUR,
    order            = 1,
    permanentStorage = true,
    l10n             = C.L10N_KEY,
    name             = C.SETTINGS_NAME_GROUP_BEHAVIOUR,
    settings         = {
        {
            key      = C.SETTINGS_KEY_GOLD,
            name     = C.SETTINGS_NAME_GOLD,
            renderer = 'select',
            argument = {
                l10n  = C.L10N_KEY,
                items = {
                    C.SETTINGS_OPTION_BLOCK,
                    C.SETTINGS_OPTION_SNEAK,
                    C.SETTINGS_OPTION_ALLOW
                }
            },
            default  = C.SETTINGS_OPTION_SNEAK
        },
        {
            key      = C.SETTINGS_KEY_BOOKS,
            name     = C.SETTINGS_NAME_BOOKS,
            renderer = 'select',
            argument = {
                l10n  = C.L10N_KEY,
                items = {
                    C.SETTINGS_OPTION_BLOCK,
                    C.SETTINGS_OPTION_SNEAK,
                    C.SETTINGS_OPTION_ALLOW
                }
            },
            default  = C.SETTINGS_OPTION_SNEAK
        },
        {
            key      = C.SETTINGS_KEY_CONTAINERS,
            name     = C.SETTINGS_NAME_CONTAINERS,
            renderer = 'select',
            argument = {
                l10n  = C.L10N_KEY,
                items = {
                    C.SETTINGS_OPTION_BLOCK,
                    C.SETTINGS_OPTION_SNEAK,
                    C.SETTINGS_OPTION_ALLOW
                }
            },
            default  = C.SETTINGS_OPTION_SNEAK
        },
        {
            key      = C.SETTINGS_KEY_DOORS,
            name     = C.SETTINGS_NAME_DOORS,
            renderer = 'select',
            argument = {
                l10n  = C.L10N_KEY,
                items = {
                    C.SETTINGS_OPTION_BLOCK,
                    C.SETTINGS_OPTION_SNEAK,
                    C.SETTINGS_OPTION_ALLOW
                }
            },
            default  = C.SETTINGS_OPTION_SNEAK
        },
        {
            key      = C.SETTINGS_KEY_OTHER,
            name     = C.SETTINGS_NAME_OTHER,
            renderer = 'select',
            argument = {
                l10n  = C.L10N_KEY,
                items = {
                    C.SETTINGS_OPTION_BLOCK,
                    C.SETTINGS_OPTION_SNEAK,
                    C.SETTINGS_OPTION_ALLOW
                }
            },
            default  = C.SETTINGS_OPTION_SNEAK
        }
    }
}

I.Settings.registerGroup {
    page             = C.SETTINGS_KEY_PAGE,
    key              = C.SETTINGS_KEY_GROUP_MISC,
    order            = 2,
    permanentStorage = true,
    l10n             = C.L10N_KEY,
    name             = C.SETTINGS_NAME_GROUP_MISC,
    settings         = {
        {
            key      = C.SETTINGS_KEY_NOTIFICATIONS,
            name     = C.SETTINGS_NAME_NOTIFICATIONS,
            renderer = 'checkbox',
            default  = true
        }
    }
}

--endregion Menu Registration
