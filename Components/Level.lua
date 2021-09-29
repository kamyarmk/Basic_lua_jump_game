local level = {}
level.objects_amount = 10
level.instances = {}
local current_index = 0
function level.cunstruct_level(platforms)
    for i = 1, level.objects_amount, 1 do
        table.insert(level.instances, platforms)
    end
end

function level.draw()
    for  i, platforms in ipairs( level.instances ) do
        love.graphics.rectangle( 'line',
                platforms.position_x,
                platforms.position_y,
                platforms.width,
                platforms.height ) 

                
    end
    love.graphics.print(current_index, 400, 300)            
end

function level.update( dt )
    local index = 1
    
    if index < level.objects_amount then
        current_index = index
        if level.instances[current_index].position_y < 250 then
            level.instances[current_index].position_y = level.instances[current_index].position_y + level.instances[current_index].speed_y * dt
        else
            level.instances[current_index].position_y = level.instances[current_index].position_y + level.instances[current_index].speed_y * dt
            math.randomseed(os.time())
            level.instances[current_index + 1].position_x = math.random(500)
            level.instances[current_index + 1].position_y = level.instances[current_index + 1].position_y + level.instances[current_index + 1].speed_y * dt 
        end
        current_index = current_index + 1
    else
        current_index = 0
    end
end

return level