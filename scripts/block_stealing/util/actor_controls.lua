local actorSneakStates = {}

local __module = {}

function __module.isSneaking(actor)
    return actorSneakStates[actor.recordId]
end

function __module.setSneaking(state)
    actorSneakStates[state.recordId] = state.sneaking
end

return __module
