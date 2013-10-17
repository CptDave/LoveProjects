function love.load()
	zombie = {
		x = 0,
		y = 0,
		y_velocity = 0,
		image = love.graphics.newImage("zombie.png")
	}
	
	gravity = 400
	jump_height = 300
	
	winW, winH = love.graphics:getWidth(), love.graphics:getHeight()
	
	
	love.physics.setMeter(64)
	world = love.physics.newWorld(0, 9.81 * 64, true)
	
	dasFloor = {}
	
	dasFloor.body = love.physics.newBody(world, 650/2, 650, "static")
	dasFloor.shape = love.physics.newRectangleShape(0, 0, 650, 50)
	dasFloor.fixture = love.physics.newFixture(dasFloor.body, dasFloor.shape)
	
	
	
	
	love.graphics.setBackgroundColor(104, 136, 248)-- set background color to blue
	love.graphics.setMode(650, 650, false, true, 0)-- window dimensions to 650 by 650, no full screen, vsync on, no antialiasing
	
	
	
end

function love.update(dt)
	world:update(dt)
	
	function love.update(dt)
    if zombie.y_velocity ~= 0 then -- we're probably jumping
        zombie.y = zombie.y + zombie.y_velocity * dt -- dt means we wont move at
        -- different speeds if the game lags
        zombie.y_velocity = zombie.y_velocity - gravity * dt
        if zombie.y < 0 then -- we hit the ground again
            zombie.y_velocity = 0
            zombie.y = 0
        end
    end
end

function love.keypressed(key)
    if key == " " then
        if zombie.y_velocity == 0 then -- we're probably on the ground, let's jump
            zombie.y_velocity = jump_height
        end
    end
end
	
end

function love.draw()
	love.graphics.rectangle("fill", 0, winH/2, winW, winH/ 2)
	love.graphics.translate(winW / 2, winH / 2)
	
	
    love.graphics.draw(zombie.image, zombie.x, -zombie.y, 0, 1, 1, 64, 103) -- trust me
	
	love.graphics.setColor(0, 255, 0)
	love.graphics.polygon("fill", dasFloor.body:getWorldPoints(dasFloor.shape:getPoints()))
	
end