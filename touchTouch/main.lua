function love.load()
	world = love.physics.newWorld(0, 0, true)
	
	width = 600
	height = 600
	
	bars = {}
	
	bars.left = {}
	
	bars.left.body = love.physics.newBody(world, width/5, height/3, "kinematic")
	bars.left.shape = love.physics.newRectangleShape(10, height-20)
	bars.left.fixture = love.physics.newFixture(bars.left.body, bars.left.shape)
	
	bars.middle = {}
	
	bars.middle.body = love.physics.newBody(world, width/2, height/3, "kinematic")
	bars.middle.shape = love.physics.newRectangleShape(10, height-20)
	bars.middle.fixture = love.physics.newFixture(bars.middle.body, bars.middle.shape)
	
	bars.right = {}
	
	bars.right.body = love.physics.newBody(world, width - width/5, height/3, "kinematic")
	bars.right.shape = love.physics.newRectangleShape(10, height-20)
	bars.right.fixture = love.physics.newFixture(bars.right.body, bars.right.shape)
	
	tap = {}
	
	tap.middle = {}
	
	tap.middle.body = love.physics.newBody(world, width/2, height/6, "static")
	tap.middle.shape = love.physics.newCircleShape(15)
	tap.middle.fixture = love.physics.newFixture(tap.middle.body, tap.middle.shape, 1)
	
	tap.left = {}
	
	tap.left.body = love.physics.newBody(world, width/5, height/6, "static")
	tap.left.shape = love.physics.newCircleShape(15)
	tap.left.fixture = love.physics.newFixture(tap.left.body, tap.left.shape, 1)
	
	tap.right = {}
	
	tap.right.body = love.physics.newBody(world, width - width/5, height/6, "static")
	tap.right.shape = love.physics.newCircleShape(15)
	tap.right.fixture = love.physics.newFixture(tap.right.body, tap.right.shape, 1)
	
end

function love.update(dt)
	world:update(dt)
	
	Yrandom = math.random(-50, 0)
	
	if love.keyboard.isDown("down") then
		tap.left.body:setPosition(tap.left.body:getX(), tap.left.body:getY() + 10)
		tap.middle.body:setPosition(tap.middle.body:getX(), tap.middle.body:getY() + 10)
		tap.right.body:setPosition(tap.right.body:getX(), tap.right.body:getY() + 10)
	elseif love.keyboard.isDown("up") then
		tap.left.body:setPosition(tap.left.body:getX(), tap.left.body:getY() - 10)
		tap.middle.body:setPosition(tap.middle.body:getX(), tap.middle.body:getY() - 10)
		tap.right.body:setPosition(tap.right.body:getX(), tap.right.body:getY() - 10)
	end
	
	tap.left.body:setPosition(tap.left.body:getX(), tap.left.body:getY() + 5)
	tap.middle.body:setPosition(tap.middle.body:getX(), tap.middle.body:getY() + 5)
	tap.right.body:setPosition(tap.right.body:getX(), tap.right.body:getY() + 5)
	
	if tap.left.body:getY() > height then
		tap.left.body:setPosition(tap.left.body:getX(), Yrandom)
	elseif tap.middle.body:getY() > height then
		tap.middle.body:setPosition(tap.middle.body:getX(), Yrandom)
	elseif tap.right.body:getY() > height then
		tap.right.body:setPosition(tap.right.body:getX(), Yrandom)
	end
	
	
	if love.keyboard.isDown("left") then
		if tap.middle.body:getY() > height - 40 and tap.middle.body:getY() < height - 10 then
		tap.middle.body:setPosition(tap.middle.body:getX(), Yrandom)
		end
	end
end

function love.draw()
	love.graphics.setColor(130, 130, 130)
	love.graphics.polygon("fill", bars.left.body:getWorldPoints(bars.left.shape:getPoints()))
	
	
	love.graphics.setColor(130, 130, 130)
	love.graphics.polygon("fill", bars.middle.body:getWorldPoints(bars.middle.shape:getPoints()))
	
	
	love.graphics.setColor(130, 130, 130)
	love.graphics.polygon("fill", bars.right.body:getWorldPoints(bars.right.shape:getPoints()))
	
	love.graphics.setColor(60, 60, 60)
	love.graphics.circle("fill", tap.middle.body:getX(), tap.middle.body:getY(), 15, 100)
	
	love.graphics.setColor(60, 60, 60)
	love.graphics.circle("fill", tap.left.body:getX(), tap.left.body:getY(), 15, 100)
	
	love.graphics.setColor(60, 60, 60)
	love.graphics.circle("fill", tap.right.body:getX(), tap.right.body:getY(), 15, 100)
	
end