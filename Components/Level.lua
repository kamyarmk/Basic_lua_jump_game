local level = {}
level.objects_amount = 10
level.instances = {}
local current_index = 1

function level.constructor(platforms)
    for i = 1, level.objects_amount, 1 do
        table.insert(level.instances, newPlatform(platforms, i))
    end
end

function newPlatform(platform, index)
    return platform.new(index)
end
function random_x(position_x)
    math.randomseed(os.time())
    return position_x + math.random(300)
end

function level.draw()
    for i = 1, level.objects_amount, 1 do
        love.graphics.rectangle('line', 
            level.instances[i].position_x, 
            level.instances[i].position_y,
            level.instances[i].width, 
            level.instances[i].height)
    end
end

function level.update( dt )
    if(level.instances[current_index].position_y < 500) then
        level.instances[current_index].position_y = level.instances[current_index].position_y + level.instances[current_index].speed_y * dt
    else
        if(level.instances[current_index + 1].isChanged == false) then
            level.instances[current_index + 1].position_x = random_x(level.instances[current_index + 1].position_x)    
            level.instances[current_index + 1].isChanged = true
        end
        level.instances[current_index + 1].position_y = level.instances[current_index + 1].position_y + level.instances[current_index + 1].speed_y * dt
        current_index = current_index + 1
    end
end

return level