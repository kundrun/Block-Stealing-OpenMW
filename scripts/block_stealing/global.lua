local core = require('openmw.core')
local types = require('openmw.types')
local acti = require('openmw.interfaces').Activation

local function onActivate(obj, actor)
    actor:sendEvent('ShowMessage', {
        message = 'Activated ' .. obj.recordId .. ' owned by ' .. (obj.owner.recordId or 'no one')
    })
end

for _, type in pairs(types) do
    if (type.baseType == types.Item or type.baseType == types.Lockable) then
        acti.addHandlerForType(type, onActivate)
    end
end

return {}
