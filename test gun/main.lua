function love.load()
	love.physics.setMeter(64)
	world = love.physics.newWorld(0, 9.81 * 64, true)
	
	love.graphics.setMode(650, 650, false, false, 0)
	love.graphics.setBackgroundColor(105, 14, 56)
	
	player = {}
	
	player.body = love.physics.newBody(world, 650/2, 550, "static")
	player.shape = love.physics.newRectangleShape(0, 0, 30, 30)
	player.fixture = love.physics.newFixture(player.body, player.shape, 2)
	
	player.shots = {}
	
	function shoot()
		local shot = {}
		shot.x = player.body:getX() + player.body:getY()/2
		shot.y = player.body:getY()
		table.insert(player.shots, shot)
	end
	
	enemies = {}
	for i=0,7 do
		enemy = {}
		enemy.width = 40
		enemy.height = 20
		enemy.x = i * (enemy.width + 60) + 100
		enemy.y = enemy.height + 100
		table.insert(enemies, enemy)
	end
end



function love.keyreleased(key)
	if (key == "spacebar") then
		shoot()
	end
end



function love.update(dt)
	world:update(dt)
	
	if love.keyboard.isDown("left") then
		player.body:setPosition(player.body:getX() - 1, player.body:getY())
	elseif love.keyboard.isDown("right") then
		player.body:setPosition(player.body:getX() + 1, player.body:getY())
	end
	
	for i,v in ipairs(enemies) do
	
		v.y = v.y + dt
		
		if v.y &gt; 465 then
			--code
		end
	end
	
	local remEnemy = {}
	local remShot = {}
	
	for i,v in ipairs(player.shots) do
		
		v.y = v.y - dt * 100
		
		if v.y &lt; 0 then
			table.insert(remShot, i)
		end
		
		for ii,vv in ipairs(enemies) do
			if CheckCollision(v.x, v.y, 2, 5, vv.x, vv.y, vv.width, vv.height) then
				table.insert(remEnemy, ii)
				
				table.insert(remShot, i)
			end
		end
		
	end
	
	for i,v in ipairs(remEnemy) do
		table.insert(remEnemy) do
		table.remove(enemies, v)
	end
	for i,v in ipairs(remShot) do
		table.remove(player.shots, v)
	end
end
end


function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
	
	local ax2, ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, bx1 + bh
	return ax1 &lt; bx2 and ax2 &lt; bx1 and ay1 &lt; by2 and ay2 &lt; by1
	
end



function love.draw()
	love.graphics.setColor(0, 0, 255)
	love.graphics.polygon("fill", player.body:getWorldPoints(player.shape:getPoints()))
	
	love.graphics.setColor(0, 255, 255, 255)
	for i,v in ipairs(enemies) do
		love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
	end
	
	
	love.graphics.setColor(255,255,255,255)
	for i,v ipairs(player.shots) do
		love.graphics.rectangle("fill", v.x, v.y, 2, 5)
	end
	
	
end