-- Basic Jumping Game
-- In this game We have a Simple Elements like a ball that is jumbing and you have to go on the Panels

-- Game Scene Generators
local ball = require "Components.Ball"
local platforms = require "Components.Platforms"
local walls = require "Components.Walls"

-- Game Mechanics Handlers
local level = require "Components.Level"
local collisions = require "Components.Collisions"
local gameStates = require "Components.GameStates"


function love.load()
    level.cunstruct_level(platforms)
end

function love.update(dt)
    ball.update( dt )
    level.update( dt )
    collisions.resolve_collisions(ball, platforms)
end

function love.draw()
    ball.draw()
    level.draw()
end

function love.quit()
 
end

