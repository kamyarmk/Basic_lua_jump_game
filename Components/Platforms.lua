
local platforms = {}
platforms.min_pos_x = 0
platforms.max_pos_x = 600
platforms.position_x = 100
platforms.position_y = 0
platforms.speed_y = 100
platforms.width = 70
platforms.height = 20

function platforms.draw()
    love.graphics.rectangle( 'line',
        platforms.position_x,
        platforms.position_y,
        platforms.width,
        platforms.height )   
end

return platforms