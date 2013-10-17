function love.load()
	love.physics.setMeter(64)
	world = love.physics.newWorld(0, 9.81*64, true)

--creating bodies, shapes and fixtures

objects = {}

--creating the ground
objects.ground = {}
objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2)
objects.ground.shape = love.physics.newRectangleShape(650, 50)
objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)

--creating boundries
objects.leftwall = {}
objects.leftwall.body = love.physics.newBody(world, 10, 650/2)
objects.leftwall.shape = love.physics.newRectangleShape(50, 650)
objects.leftwall.fixture = love.physics.newFixture(objects.leftwall.body, objects.leftwall.shape)

objects.rightwall = {}
objects.rightwall.body = love.physics.newBody(world, 640, 650/2)
objects.rightwall.shape = love.physics.newRectangleShape(50, 650)
objects.rightwall.fixture = love.physics.newFixture(objects.rightwall.body, objects.rightwall.shape)

--ceiling
objects.ceiling = {}
objects.ceiling.body = love.physics.newBody(world, 650/2, 10)
objects.ceiling.shape = love.physics.newRectangleShape(650, 50)
objects.ceiling.fixture = love.physics.newFixture(objects.ceiling.body, objects.ceiling.shape)


--creating a ball
objects.ball = {}
objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic")--dynamic so ball can move
objects.ball.shape = love.physics.newCircleShape(20)--radius of ball
objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1)--density of 1
objects.ball.fixture:setRestitution(0.9)--ball bounce

--creating a few blocks
objects.block1 = {}
objects.block1.body = love.physics.newBody(world, 200, 550, "dynamic")
objects.block1.shape = love.physics.newRectangleShape(0,0,100,50)
objects.block1.fixture = love.physics.newFixture(objects.block1.body, objects.block1.shape, 5)--higher density means more mass

objects.block2 = {}
objects.block2.body = love.physics.newBody(world, 200, 400, "dynamic")
objects.block2.shape = love.physics.newRectangleShape(0,0,100,50)
objects.block2.fixture = love.physics.newFixture(objects.block2.body, objects.block2.shape, 2)--higher density means more mass

--graphic setup
love.graphics.setBackgroundColor(104, 136, 248)-- set background color to blue
love.graphics.setMode(650, 650, false, true, 0)-- window dimensions to 650 by 650, no full screen, vsync on, no antialiasing
end

function love.update(dt)
	world:update(dt)--puts world into motion
	
	--creating some key events
	if love.keyboard.isDown("right") then--push ball right
		objects.ball.body:applyForce(600,0)
	elseif love.keyboard.isDown("left") then--push ball left
		objects.ball.body:applyForce(-600, 0)
	elseif love.keyboard.isDown("up") then--push ball up
		objects.ball.body:applyForce(0, -500)
	elseif love.keyboard.isDown("down") then
		objects.ball.body:setPosition(650/2, 650/2)
		objects.ball.body:applyForce(0,0)
	end
end


function love.draw()
	love.graphics.setColor(72, 260, 14)--set drawing color for ground to green
	love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
	
	love.graphics.setColor(72, 260, 14)
	love.graphics.polygon("fill", objects.leftwall.body:getWorldPoints(objects.leftwall.shape:getPoints()))
	
	love.graphics.setColor(72, 260, 14)
	love.graphics.polygon("fill", objects.rightwall.body:getWorldPoints(objects.rightwall.shape:getPoints()))
	
	love.graphics.setColor(72, 260, 14)
	love.graphics.polygon("fill", objects.ceiling.body:getWorldPoints(objects.ceiling.shape:getPoints()))
	
	love.graphics.setColor(193, 47, 14)--set ball to red
	love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
	
	love.graphics.setColor(50, 50, 50)--sets to blocks to grey
	love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
	love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
end


















