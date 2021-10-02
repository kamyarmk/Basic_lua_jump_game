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
    if(position_x + math.random(400) > 600)then
        return position_x - math.random(400)
    else
        return position_x + math.random(400)
    end
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
    if(current_index < level.objects_amount) then
        if(level.instances[current_index].position_y < 700) then
            level.instances[current_index].position_y = level.instances[current_index].position_y + level.instances[current_index].speed_y * dt
        else
            if(level.instances[current_index + 1].isChanged == false) then
                level.instances[current_index + 1].position_x = random_x(level.instances[current_index + 1].position_x)    
                level.instances[current_index + 1].isChanged = true
            end
            level.instances[current_index + 1].position_y = level.instances[current_index + 1].position_y + level.instances[current_index + 1].speed_y * dt
            current_index = current_index + 1
        end
    else
        current_index = 1;
        for i = 1, level.objects_amount, 1 do
            if(level.instances[i].position_y > 700)then
                level.instances[i].position_y = -100
                level.instances[i].isChanged = false
            end
    end
    end
    
end

return level