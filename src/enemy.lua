enemy = {}
require 'libraries/windfield'

function enemy.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    enemy.x = 600
    enemy.y = 1510
    enemy.speed = 700
    enemy.isDead = false
    enemy.sprite = love.graphics.newImage('sprites/agentRight.png')
end

function enemy.update(dt)

end

function enemy.draw()
    love.graphics.draw(enemy.sprite, enemy.x, enemy.y, nil, -4, 4, 16, 16)
end