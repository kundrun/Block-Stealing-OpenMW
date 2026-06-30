local core = require('openmw.core')
local self = require('openmw.self')

local sneaking = nil

return {
    engineHandlers = {
        onUpdate = function(dt)
            if (dt <= 0) then return end

            local sneakingUpdate = self.controls.sneak or false
            if (sneakingUpdate == sneaking) then return end

            sneaking = sneakingUpdate
            core.sendGlobalEvent('BlockStealing:ActorSneakChanged', {
                recordId = self.recordId,
                sneaking = sneaking
            })
        end
    }
}
