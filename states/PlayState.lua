PlayState = Class{__includes = BaseState}

function PlayState:init()

end

playerX = VIRTUAL_WIDTH / 2
playerY = VIRTUAL_HEIGHT / 2

velocity = -10
local vertices = {playerX, playerY, playerX + 40, playerY + 50, playerX - 40, playerY + 50}

function PlayState:update(dt)
	--sounds['playMusic']:setLooping(true)
	--sounds['playMusic']:play()

	if love.keyboard.isDown('space') then
		playerX = playerX + velocity * dt
		playerY = playerY + velocity + dt
		vertices = {playerX, playerY, playerX + 40, playerY + 50, playerX - 40, playerY + 50}
	end

	if love.keyboard.wasPressed('r') then
		--sounds['playMusic']:stop()
		gStateMachine:change('titleState')
	end
end


function PlayState:render()
	love.graphics.clear(50/255, 50/255, 255/255, 255/255)

	love.graphics.setColor(220/255, 220/255, 220/255, 255/255)
	love.graphics.polygon('fill', vertices)

	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	--love.graphics.draw(clouds, -cloudScroll, 0)

	--love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	--love.graphics.printf('Hello PlayState', 0, 200, VIRTUAL_HEIGHT / 2, 'center')
end 

