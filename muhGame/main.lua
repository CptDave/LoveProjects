function love.load()
	world = love.physics.newWorld(0, 0, true)

	local width = 800
	local height = 600
	playerSize = 15
	
	player = {}
	player.body = love.physics.newBody(world, ((width/2)-(playerSize/2)), ((height/2)-(playerSize/2)), "kinematic")--location
	player.shape = love.physics.newCircleShape(playerSize)--shape/size
	player.fixture = love.physics.newFixture(player.body, player.shape)--?applying?
	
end

function love.update(dt)
	world:update(dt)
	
	--controllers of the controls
	local xvel = 0
	local yvel = 0
	local speed = 200
	
	--controllers
	function love.keyboard.isDown(w)
		speed = speed * dt
		player.body:applyForce(0,speed)
	end
end

function love.draw()

	love.graphics.setColor(255, 255, 255)
	love.graphics.circle("fill", player.body:getX(), player.body:getY(), playerSize, 100)
	
end