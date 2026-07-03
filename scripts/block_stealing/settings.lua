local storage = require('openmw.storage')
local async = require('openmw.async')
local I = require('openmw.interfaces')
local C = require('scripts.block_stealing.util.constants')

--region Accessors

local function getStoredSetting(section, key)
    return storage.globalSection(section):get(key)
end

local settingsCache = {}

local function getCachedSetting(section, key)
    local setting = settingsCache[section .. '.' .. key]
    if not setting then
        setting = getStoredSetting(section, key)
        settingsCache[section .. '.' .. key] = setting
    end
    return setting
end

local function clearCachedSetting(section, key)
    if not section then return end
    if key then
        settingsCache[section .. '.' .. key] = nil
    else
        for k, _ in pairs(settingsCache) do
            -- k.startsWith(section)
            if k:sub(1, #section) == section then
                settingsCache[k] = nil
            end
        end
    end
end

local function getBehaviour(objType)
    return getCachedSetting(C.SETTINGS_KEY_GROUP_BEHAVIOUR, objType)
end

local function getNotifications()
    return getCachedSetting(C.SETTINGS_KEY_GROUP_MISC, C.SETTINGS_KEY_NOTIFICATIONS)
end

--endregion Accessors

--region Update Handlers

storage.globalSection(C.SETTINGS_KEY_GROUP_BEHAVIOUR)
       :subscribe(async:callback(clearCachedSetting))

storage.globalSection(C.SETTINGS_KEY_GROUP_MISC)
       :subscribe(async:callback(clearCachedSetting))

--endregion Update Handlers

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

--region Exported Interface

return {
    interfaceName = C.MOD_KEY .. '_Settings',
    interface     = {
        version          = 1,
        getBehaviour     = getBehaviour,
        getNotifications = getNotifications
    }
}

--endregion Exported Interface
