-- Basic Jumping Game
-- In this game We have a Simple Elements like a ball that is jumbing and you have to go on the Panels

local ball = {}
ball.radius = 10
ball.position_x = 500
ball.position_y = 550
ball.speed_x = 500
ball.speed_y = 500

local max_height_jump = 100
local current_jump = 0


function ball.update( dt )

    if max_height_jump == 100 then
        if current_jump >= max_height_jump then
            max_height_jump = 0
        end
        if current_jump < max_height_jump then
            ball.position_y = ball.position_y - ball.speed_y * dt           
            current_jump = current_jump + ball.position_y * dt
        end    
    else
        if current_jump <= max_height_jump then
            max_height_jump = 100
        end
        if current_jump > max_height_jump then
            ball.position_y = ball.position_y + ball.speed_y * dt           
            current_jump = current_jump - ball.position_y * dt
        end    
    end
    
    if love.keyboard.isDown("right") then
        ball.position_x = ball.position_x + (ball.speed_x * dt)
     end
     if love.keyboard.isDown("left") then
        ball.position_x = ball.position_x - (ball.speed_x * dt)
     end   
end

function ball.draw()
    local segments_in_circle = 16
    love.graphics.circle( 'line',
              ball.position_x,
              ball.position_y,
              ball.radius,
              segments_in_circle )   
end


local platforms = {}
platforms.position_x = 500
platforms.position_y = 500
platforms.speed_x = 500
platforms.width = 70
platforms.height = 20


local walls = {}
walls.width = 5
walls.height = 2


local gameStates = {}


function love.load()

end

function love.update(dt)
    ball.update( dt )
end

function love.draw()
    ball.draw()
end

function love.quit()
    
end

