local types = require('openmw.types')
local I = require('openmw.interfaces')
local controls = require('scripts.block_stealing.util.actor_controls')
local usage = require('scripts.block_stealing.util.object_usage')

local function onActivate(obj, actor)
    if (actor.type ~= types.Player) then return end

    if usage.allowUse(obj, actor, controls, I.BlockStealing_Settings) then return end

    if I.BlockStealing_Settings.getNotifications() then
        local objName = obj.type.record(obj.recordId).name
        actor:sendEvent('ShowMessage', {
            message = '[' .. objName .. '] use is blocked'
        })
    end
    return false
end

for _, type in pairs(types) do
    if (type.baseType == types.Item or type.baseType == types.Lockable) then
        I.Activation.addHandlerForType(type, onActivate)
    end
end

return {
    eventHandlers = {
        BlockStealing_ActorSneakChanged = controls.setSneaking
    }
}
