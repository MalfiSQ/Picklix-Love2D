function love.load()
    require 'src/player'
    require 'src/enemy'

    sti = require 'libraries/sti'
    wf = require 'libraries/windfield'
    camera = require 'libraries/camera'

    player.load()
    enemy.load()

    gameMap = sti('maps/gameMap.lua')
    world = wf.newWorld(0, 100000 * 2)
    cam = camera()

    -- Player collider
    player.collider = world:newRectangleCollider(player.x, player.y, 70, 55)
    player.collider:setFixedRotation(true)

    -- Enemy collider
    enemy.collider = world:newRectangleCollider(enemy.x, enemy.y, 70, 55)
    enemy.collider:setFixedRotation(true)

    -- Ground colliders
    grounds = {}
    if gameMap.layers["GroundRC"] then
        for i, obj in pairs(gameMap.layers["GroundRC"].objects) do
            ground = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            ground:setType('static')
            table.insert(grounds, ground)
        end
    end
end

function love.update(dt)
    player.update(dt)
    enemy.update(dt)
    cam:lookAt(player.x, player.y)
    world:update(dt)
end

function love.draw()
    cam:attach()
        gameMap:drawLayer(gameMap.layers["Ground"])
        player.draw()
        enemy.draw()
        world:draw()
    cam:detach()
end