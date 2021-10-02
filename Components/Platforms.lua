
local platforms = {}
platforms.position_x = 100
platforms.position_y = -100
platforms.speed_y = 1000
platforms.width = 70
platforms.height = 20
platforms.isChanged = false

local platformsMT = {__index = platforms}

function platforms.new(position_x, position_y, speed_y, width, height, isChanged)
    local platform = {}
    platform.position_x = position_x
    platform.position_y = position_y or platforms.position_y
    platform.speed_y = speed_y or platforms.speed_y
    platform.width = width or platforms.width
    platform.height = height or platforms.height
    platform.isChanged = isChanged or platforms.isChanged 

    return setmetatable(platform, platformsMT)
end

return platforms