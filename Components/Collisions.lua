local collisions = {}

function collisions.resolve_collisions(ball, platforms)
    collisions.ball_platform_collision( ball, platforms)
end

function collisions.check_rectangles_overlap( a, b )
    local overlap = false
    local shift_b_x, shift_b_y = 0, 0
    if not( a.x + a.width < b.x  or b.x + b.width < a.x  or
        a.y + a.height < b.y or b.y + b.height < a.y ) then
       overlap = true
       if ( a.x + a.width / 2 ) < ( b.x + b.width / 2 ) then
      shift_b_x = ( a.x + a.width ) - b.x
       else       shift_b_x = a.x - ( b.x + b.width )
       end
       if ( a.y + a.height / 2 ) < ( b.y + b.height / 2 ) then
      shift_b_y = ( a.y + a.height ) - b.y
       else
      shift_b_y = a.y - ( b.y + b.height ) 
       end 
    end
    return overlap, shift_b_x, shift_b_y
 end

function collisions.ball_platform_collision( ball, platforms )
    local overlap, shift_ball
    local a = { x = platforms.position_x,
            y = platforms.position_y,
            width = platforms.width,
            height = platforms.height }
    local b = { x = ball.position_x - ball.radius,
            y = ball.position_y - ball.radius,
            width = 2 * ball.radius,
            height = 2 * ball.radius }
    overlap, shift_ball =
        collisions.check_rectangles_overlap( a, b )   
    if overlap then
        ball.rebound( shift_ball )
    end 
 end

 return collisions