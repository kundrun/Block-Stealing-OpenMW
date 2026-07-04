local types = require('openmw.types')

local function isOwner(actor, ownerId)
    return actor.recordId == ownerId
end

local function isRankedFactionMember(actor, factionId, factionRank)
    local actorRank = types.NPC.getFactionRank(actor, factionId)
    if types.NPC.isExpelled(actor, factionId) then
        actorRank = 0
    end
    local requiredRank = factionRank or 1
    return actorRank >= requiredRank
end

local function isLawfulUse(obj, actor)
    local ownership = obj.owner
    if ownership.recordId then
        return isOwner(actor, ownership.recordId)
    elseif ownership.factionId then
        return isRankedFactionMember(actor, ownership.factionId, ownership.factionRank)
    else
        return true
    end
end

local function allowCrimeUse(obj, actor, controls)
    if (obj.type == types.Book) then return true end
    if controls.isSneaking(actor) then return true end
end

local __module = {}

function __module.allowUse(obj, actor, controls)
    return isLawfulUse(obj, actor) or allowCrimeUse(obj, actor, controls)
end

return __module
