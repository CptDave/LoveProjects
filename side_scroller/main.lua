--side scoller first test,
--created by: Cpt. Dave

function love.load()
	love.physics.setMeter(65)
	
	world = love.physics.newWorld(0, 9.81 * 20, false)
	
	height = 600
	width = 600
	
	speed = .0
	
	player = {}
	
	player.body = love.physics.newBody(world, width/2, height/2, "dynamic")
	player.shape = love.physics.newRectangleShape(40, 40)
	player.fixture = love.physics.newFixture(player.body, player.shape, 1)
	player.fixture:setRestitution(0.1)--ball bounce
	
	ground = {}
	
	ground.body = love.physics.newBody(world, width/2, height/2 + height/4, "kinematic")
	ground.shape = love.physics.newRectangleShape(width, height/6)
	ground.fixture = love.physics.newFixture(ground.body, ground.shape, 1)

	ground2 = {}
	
	ground2.body = love.physics.newBody(world, width/2, height/2 + height/4, "kinematic")
	ground2.shape = love.physics.newRectangleShape(width, height/6)
	ground2.fixture = love.physics.newFixture(ground2.body, ground2.shape, 1)

	
end

function love.update(dt)
	world:update(dt)
	
	if love.keyboard.isDown("left") then
		player.body:setPosition(player.body:getX() - 4, player.body:getY())
	elseif love.keyboard.isDown("right") then
		player.body:setPosition(player.body:getX() + 4, player.body:getY())
	end
	
	if love.keyboard.isDown("up") then
		player.body:setPosition(player.body:getX(), player.body:getY() - 5)
	end
	
	if love.keyboard.isDown("down") then
		player.body:setPosition(width / 2, 0)
		player.body:applyForce(0, 80000)
	end
	
	ground.body:setPosition(ground.body:getX() + speed, ground.body:getY())
	ground2.body:setPosition(ground.body:getX() - 610, ground2.body:getY()) 
	
	--sets the blocks up after they disapear
	if ground.body:getX() >= width + 350 then
		ground.body:setPosition(ground.body:getX() - 610, ground.body:getY() )
	elseif ground2.body:getX() >= width + 350 then
		ground2.body:setPosition(ground2.body:getX() - 610, ground2.body:getY() )
	end
	
	text = love.graphics.print("Speed: " .. speed, 10, 10)
	
	speed = speed + .02
	
end

function love.draw()
	love.graphics.setColor(95, 95, 95)
	love.graphics.rectangle("fill", player.body:getX(), player.body:getY(), 40, 40)
	
	love.graphics.setColor(100, 200, 0)
	love.graphics.rectangle("fill", ground.body:getX() - 300, ground.body:getY() - 30, width, height - (height/2 + height/5))
	
	love.graphics.setColor(100, 200, 0)
	love.graphics.rectangle("fill", ground.body:getX() - 910, ground.body:getY() - 30, width, height - (height/2 + height/5))
	
	text = love.graphics.setColor(0, 255, 0, 255)
    text = love.graphics.print("Speed: " .. speed, 10, 10)
end

