function love.load()
	--SETS WORLD AND GRAVITY
	love.physics.setMeter(64)
	world = love.physics.newWorld(0, 9.81 * 64, true)

	bg = love.graphics.newImage("background.png")
	
	--HOLDS ALL OF OUR ENEMYS AKA FALLING BLOCKS
	objects = {}

	objects.enemy = {}

	objects.enemy.body = love.physics.newBody(world, 650/2, 650/5, "dynamic")
	objects.enemy.shape = love.physics.newRectangleShape(0, 0, 50, 100)
	objects.enemy.fixture = love.physics.newFixture(objects.enemy.body, objects.enemy.shape, 2)
	
	objects.enemy2 = {}
	
	objects.enemy2.body = love.physics.newBody(world, 650/3, 650/5, "dynamic")
	objects.enemy2.shape = love.physics.newRectangleShape(0, 0, 50, 100)
	objects.enemy2.fixture = love.physics.newFixture(objects.enemy2.body, objects.enemy2.shape, 2)
	
	objects.enemy3 = {}
	
	objects.enemy3.body = love.physics.newBody(world, 600, 650/5, "dynamic")
	objects.enemy3.shape = love.physics.newRectangleShape(0, 0, 50, 100)
	objects.enemy3.fixture = love.physics.newFixture(objects.enemy3.body, objects.enemy3.shape, 2)
	
	--DEFAULT FONT
	font = love.graphics.newFont(20)

	--AMOUNT OF RECTANGLES CLICKED
	recSaved = 0
	
	--THE TIME
	thetime = 0
	
	
	--BACKGROUND COLOR AND WINDOW MODE
	love.graphics.setBackgroundColor(104, 136, 248)-- set background color to blue
	love.graphics.setMode(650, 650, false, true, 0)-- window dimensions to 650 by 650, no full screen, vsync on, no antialiasing
end


function love.update(dt)

	--SETS THE WORLD IN MOTION
	world:update(dt)
	
	--THIS IF STATMENT MAKES IT SO WHEN THE BLOCKS FALL TO THE BOTTOM THEY RESPAWN TO THE TOP IN A NEW LOCATION
	if objects.enemy.body:getY() > 770 then
		newSpawnX = math.random(50, 600)
		
		if newSpawnX > 100 then
			newSpawnX2 = math.random(50 + 100, 600)
		elseif newSpawnX < 550 then
			newSpawnX2 = math.random(50, 450)
		else 
			newSpawnX2 = math.random(50, 600)
		end
		
		newSpawnX3 = math.random(50, 600)
		
		objects.enemy.body:setPosition(newSpawnX, 650/5)
		objects.enemy.body:setLinearVelocity(0,0)
		
	elseif objects.enemy2.body:getY() > 770 then
		if newSpawnX > 100 then
			newSpawnX2 = math.random(50 + 100, 600)
		elseif newSpawnX < 550 then
			newSpawnX2 = math.random(50, 450)
		else 
			newSpawnX2 = math.random(50, 600)
		end
	
		objects.enemy2.body:setPosition(newSpawnX2, 650/5)
		objects.enemy2.body:setLinearVelocity(0,0)
		
	elseif objects.enemy3.body:getY() > 770 then
		if newSpawnX > 100 then
			newSpawnX2 = math.random(50 + 100, 600)
		elseif newSpawnX < 550 then
			newSpawnX2 = math.random(50, 450)
		else 
			newSpawnX2 = math.random(50, 600)
		end
	
		objects.enemy3.body:setPosition(newSpawnX3, 650/5)
		objects.enemy3.body:setLinearVelocity(0,0)
		
	end
	
	--THIS IF STATEMENT CHECKS TO SEE IF YOUR CLICK IS ON A BLOCK, IF RETURNS YES THEN 1 WILL BE ADDED TO YOUR RECTANGLES SAVED SCORE
	if love.mouse.isDown("l") then
		mouseX, mouseY = love.mouse.getX(), love.mouse.getY()
		
		en1X, en1Y = objects.enemy.body:getX(), objects.enemy.body:getY()
		en2X, en2Y = objects.enemy2.body:getX(), objects.enemy2.body:getY()
		en3X, en3Y = objects.enemy3.body:getX(), objects.enemy3.body:getY()
		
		newSpawnX = math.random(50, 600)
		
		if newSpawnX > 100 then
			newSpawnX2 = math.random(50 + 100, 600)
		elseif newSpawnX < 550 then
			newSpawnX2 = math.random(50, 450)
		else 
			newSpawnX2 = math.random(50, 600)
		end
		
		newSpawnX3 = math.random(50, 600)
		
		
		if mouseX > en1X - 25 and mouseX < en1X + 25 and mouseY > en1Y - 50 and mouseY < en1Y + 50 then
			recSaved = recSaved + 1
			objects.enemy.body:setPosition(newSpawnX, 650/5)
			objects.enemy.body:setLinearVelocity(0,0)
			objects.enemy.body:setAngle(math.rad(0))
			
		elseif mouseX > en2X - 25 and mouseX < en2X + 25 and mouseY > en2Y - 50 and mouseY < en2Y + 50 then
			recSaved = recSaved + 1
			objects.enemy2.body:setPosition(newSpawnX2, 650/5)
			objects.enemy2.body:setLinearVelocity(0,0)
			objects.enemy2.body:setAngle(math.rad(0))
			
		elseif mouseX > en3X - 25 and mouseX < en3X + 25 and mouseY > en3Y - 50 and mouseY < en3Y + 50 then
			recSaved = recSaved + 1
			objects.enemy3.body:setPosition(newSpawnX3, 650/5)
			objects.enemy3.body:setLinearVelocity(0,0)
			objects.enemy3.body:setAngle(math.rad(0))
		
		end

	end
	
	--KEEPS OUR BLOCKS FROM ROTATING
	objects.enemy.body:setAngle(math.rad(0))
	objects.enemy2.body:setAngle(math.rad(0))
	objects.enemy3.body:setAngle(math.rad(0))
	
	--A REALLY SHITTY TIME I THREW TOGETHER (NOT ACCURATE, BUT CLOSE ENOUGH)
	if 0 == 0 then
		thetime = thetime + .0148
	end
end


function love.draw()

	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(bg)
	
	--DRAW OUR BLOCKS AND TEXT TO THE SCREEN
	love.graphics.setColor(255, 245, 0)--set drawing color for ground to green
	love.graphics.polygon("fill", objects.enemy.body:getWorldPoints(objects.enemy.shape:getPoints()))
	
	love.graphics.setColor(255, 245, 0)--set drawing color for ground to green
	love.graphics.polygon("fill", objects.enemy2.body:getWorldPoints(objects.enemy2.shape:getPoints()))
	
	love.graphics.setColor(255, 245, 0)--set drawing color for ground to green
	love.graphics.polygon("fill", objects.enemy3.body:getWorldPoints(objects.enemy3.shape:getPoints()))
	
	
	love.graphics.setColor(0, 255, 0, 255)
	love.graphics.setFont(font)
	love.graphics.print("Rectangles Save: " .. recSaved, 25, 25)
	
	
	love.graphics.setColor(0, 255, 0, 255)
	love.graphics.setFont(font)
	love.graphics.print("Timer: " .. thetime, 500, 25)
end
