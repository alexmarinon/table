local table = {}

function table.newObservedTable(initialValue, onChanged)
    local proxy = initialValue or {}
    return setmetatable({}, {
        __index = proxy,
        __newindex = function(t, key, val)
            proxy[key] = val
            onChanged(key, val)
        end
    })
end

return table
