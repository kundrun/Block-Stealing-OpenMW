local __module = {}

__module.MOD_KEY = 'BlockStealing'
__module.L10N_KEY = 'block_stealing'

__module.SETTINGS_KEY_PAGE = 'Settings.' .. __module.MOD_KEY

__module.SETTINGS_KEY_GROUP_BEHAVIOUR = __module.SETTINGS_KEY_PAGE .. '.Behaviour'
__module.SETTINGS_KEY_GOLD = 'Gold'
__module.SETTINGS_KEY_BOOKS = 'Books'
__module.SETTINGS_KEY_CONTAINERS = 'Containers'
__module.SETTINGS_KEY_DOORS = 'Doors'
__module.SETTINGS_KEY_OTHER = 'Other'

__module.SETTINGS_KEY_GROUP_MISC = __module.SETTINGS_KEY_PAGE .. '.Misc'
__module.SETTINGS_KEY_NOTIFICATIONS = 'Notifications'

local function name(suffix)
    return 'settings_name_' .. suffix
end

__module.SETTINGS_NAME_PAGE = name('page')

__module.SETTINGS_NAME_GROUP_BEHAVIOUR = name('group_behaviour')
__module.SETTINGS_NAME_GOLD = name('gold')
__module.SETTINGS_NAME_BOOKS = name('books')
__module.SETTINGS_NAME_CONTAINERS = name('containers')
__module.SETTINGS_NAME_DOORS = name('doors')
__module.SETTINGS_NAME_OTHER = name('other')

__module.SETTINGS_NAME_GROUP_MISC = name('group_misc')
__module.SETTINGS_NAME_NOTIFICATIONS = name('notifications')

__module.SETTINGS_DESC_PAGE = 'settings_desc_page'

__module.SETTINGS_OPTION_BLOCK = 'settings_option_block'
__module.SETTINGS_OPTION_SNEAK = 'settings_option_sneak'
__module.SETTINGS_OPTION_ALLOW = 'settings_option_allow'

return __module
