local core = require('openmw.core')
local types = require('openmw.types')
local acti = require('openmw.interfaces').Activation

local actorSneakStates = {}

local function isActivationAllowed(obj, actor)
    local ownerData = obj.owner
    if (ownerData.recordId) then
        return (ownerData.recordId == actor.recordId)
    elseif (ownerData.factionId) then
        local requiredRank = ownerData.factionRank or 1
        local actorRank = types.NPC.getFactionRank(actor, ownerData.factionId)
        if (types.NPC.isExpelled(actor, ownerData.factionId)) then
            actorRank = 0
        end
        return (actorRank >= requiredRank)
    end
    return true
end

local function onActivate(obj, actor)
    if (actor.type ~= types.Player) then return end

    if (obj.type == types.Book) then return end

    if (actorSneakStates[actor.recordId]) then return end

    if (isActivationAllowed(obj, actor)) then return end

    actor:sendEvent('ShowMessage', {
        message = 'Blocked activation of ' .. obj.recordId
    })
    return false
end

for _, type in pairs(types) do
    if (type.baseType == types.Item or type.baseType == types.Lockable) then
        acti.addHandlerForType(type, onActivate)
    end
end

return {
    eventHandlers = {
        ['BlockStealing:ActorSneakChanged'] = function(state)
            actorSneakStates[state.recordId] = state.sneaking
        end
    }
}
