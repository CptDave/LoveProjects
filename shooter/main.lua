function love.load()
	love.physics.setMeter(64)
	world = love.physics.newWorld(0, 0, true)
	
	objects = {}
	
	objects.player = {}
	
	objects.player.body = love.physics.newBody(world, 650/2, 650/2 + 650/4, "dynamic")
	objects.player.shape = love.physics.newRectangleShape(0, 0, 25, 25)
	objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1)
	
	objects.wall = {}
	
	objects.wall.body = love.physics.newBody(world, 25, 650/2, "static")
	objects.wall.shape = love.physics.newRectangleShape(0, 0, 25, 650)
	objects.wall.fixture = love.physics.newFixture(objects.wall.body, objects.wall.shape)
	
	objects.wall2 = {}
	
	objects.wall2.body = love.physics.newBody(world, 775, 650/2, "static")
	objects.wall2.shape = love.physics.newRectangleShape(0, 0, 25, 650)
	objects.wall2.fixture = love.physics.newFixture(objects.wall2.body, objects.wall2.shape)
	
	
end

function love.update(dt)
	world:update(dt)
	
		
	if love.keyboard.isDown("left") then
		objects.player.body:applyForce(-500, 0)
	elseif love.keyboard.isDown("right") then
		objects.player.body:applyForce(500, 0)
	else 
		objects.player.body:setLinearVelocity(0,0)
	end
	
end

function love.draw()
	love.graphics.setColor(0, 255, 0)
	love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints()))
	
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.polygon("fill", objects.wall.body:getWorldPoints(objects.wall.shape:getPoints()))
	
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.polygon("fill", objects.wall2.body:getWorldPoints(objects.wall2.shape:getPoints()))
	
	function draw()
		love.graphics.setColor(255, 0, 0)
		love.graphics.polygon("fill", objects.attack..number.body:getWorldPoints(objects.attack..number.shape:getPoints()))
	end
end

function love.mousepressed()

	number = 1
	
	objects.attack + number = {}
	
	objects.attack..number.body = love.physics.newBody(world, objects.player.body:getX(), objects.player.body:getY() - 15, "dynamic")
	objects.attack..number.shape = love.physics.newRectangleShape(0, 0, 5, 5)
	objects.attack..number.fixture = love.physics.newFixture(objects.attack..number.body, objects.attack..number.shape)
	
	draw()
	
	objects.attack..number.body:applyForce(0, -200)
	
	if objects.attack..number.body:getY() < 100 then
		objects.attack..number.body:destroy()
	end
	
	number = number + 1
end
