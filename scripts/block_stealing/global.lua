local core = require('openmw.core')
local types = require('openmw.types')
local acti = require('openmw.interfaces').Activation

local function onActivate(obj, actor)
    if (actor.type ~= types.Player) then return end

    if (obj.type == types.Book) then return end

    if (not obj.owner.recordId) then return end
    if (obj.owner.recordId == actor.recordId) then return end

    actor:sendEvent('ShowMessage', {
        message = 'Blocked activation of ' .. obj.recordId .. ' owned by ' .. obj.owner.recordId
    })
    return false
end

for _, type in pairs(types) do
    if (type.baseType == types.Item or type.baseType == types.Lockable) then
        acti.addHandlerForType(type, onActivate)
    end
end

return {}
