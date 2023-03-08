enemy = {}
require 'libraries/windfield'

function enemy.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    enemy.x = 600
    enemy.y = 1500
    enemy.speed = 700
    enemy.sprite = love.graphics.newImage('sprites/agentRight.png')
end

function enemy.update(dt)

end

function enemy.draw()

end