local core = require('openmw.core')
local self = require('openmw.self')
local I = require('openmw.interfaces')
local C = require('scripts.block_stealing.util.constants')

--region Menu Registration

I.Settings.registerPage {
    key         = C.SETTINGS_KEY_PAGE,
    l10n        = C.L10N_KEY,
    name        = C.SETTINGS_NAME_PAGE,
    description = C.SETTINGS_DESC_PAGE
}

--endregion Menu Registration

--region Sneak State

local sneaking -- intentionally nil, to trigger event right after game load

local function checkSneaking()
    local sneakingUpdate = self.controls.sneak or false
    if (sneakingUpdate == sneaking) then return end

    sneaking = sneakingUpdate
    core.sendGlobalEvent(C.MOD_KEY .. '_ActorSneakChanged', {
        recordId = self.recordId,
        sneaking = sneaking
    })
end

return {
    engineHandlers = {
        onUpdate = function(dt)
            if (dt > 0) then checkSneaking() end
        end
    }
}

--endregion Sneak State
