local ball = {}
ball.radius = 10
ball.position_x = 500
ball.position_y = 550
ball.speed_x = 500
ball.speed_y = 500

local max_height_jump = 100
local current_jump = 0

function ball.rebound( shift_ball_x, shift_ball_y )
    local min_shift = math.min( math.abs( shift_ball_x ),
                    math.abs( shift_ball_y ) )
    if math.abs( shift_ball_x ) == min_shift then
       shift_ball_y = 0
    else
       shift_ball_x = 0
    end
    ball.position_x = ball.position_x + shift_ball_x
    ball.position_y = ball.position_y + shift_ball_y
    if shift_ball_x ~= 0 then
       ball.speed_x  = -ball.speed_x
    end
    if shift_ball_y ~= 0 then
       ball.speed_y  = -ball.speed_y
    end
end

function ball.update( dt )

    -- if max_height_jump == 100 then
    --     if current_jump >= max_height_jump then
    --         max_height_jump = 0
    --     end
    --     if current_jump < max_height_jump then
    --         ball.position_y = ball.position_y - ball.speed_y * dt
    --         current_jump = current_jump  + 5
    --     end 
    -- else
    --     if current_jump <= max_height_jump then
    --         max_height_jump = 100
    --     end
    --     if current_jump > max_height_jump then
    --         ball.position_y = ball.position_y + ball.speed_y * dt 
    --         current_jump = current_jump - 5
    --     end 
    -- end
 
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

return ball