local types = require('openmw.types')
local C = require('scripts.block_stealing.util.constants')

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

local function checkCrimeSettings(objType, actor, controls, settings)
    local behaviour = settings.getBehaviour(objType)
    if behaviour == C.SETTINGS_OPTION_ALLOW then
        return true
    elseif behaviour == C.SETTINGS_OPTION_SNEAK then
        return controls.isSneaking(actor)
    else
        return false
    end
end

local function allowCrimeUse(obj, actor, controls, settings)
    local objType
    if obj.type == types.Book then
        objType = C.SETTINGS_KEY_BOOKS
    elseif obj.type == types.Container then
        objType = C.SETTINGS_KEY_CONTAINERS
    elseif obj.type == types.Door then
        objType = C.SETTINGS_KEY_DOORS
    elseif obj.recordId == 'gold_001' or
        obj.recordId == 'gold_005' or
        obj.recordId == 'gold_010' or
        obj.recordId == 'gold_025' or
        obj.recordId == 'gold_100' then
        objType = C.SETTINGS_KEY_GOLD
    else
        objType = C.SETTINGS_KEY_OTHER
    end
    return checkCrimeSettings(objType, actor, controls, settings)
end

local __module = {}

function __module.allowUse(obj, actor, controls, settings)
    return isLawfulUse(obj, actor) or allowCrimeUse(obj, actor, controls, settings)
end

return __module
