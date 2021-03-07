TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

local highlighted = 1

function TitleScreenState:update(dt)

--[[
	sounds['titleMusic']:setLooping(true)
	sounds['titleMusic']:play()
--]]

	if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
		highlighted = highlighted == 1 and 2 or 1
		sounds['beep']:play()
	end

	if love.keyboard.wasPressed('h') then
		--sounds['titleMusic']:stop()
		gStateMachine:change('helpState')
	end

	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		if highlighted == 1 then
			--sounds['titleMusic']:stop()
			sounds['select']:play()
			gStateMachine:change('playState')
		else
			--sounds['titleMusic']:stop()
			sounds['select']:play()
			love.event.quit()
		end
	end
end


function TitleScreenState:render()
	love.graphics.clear(50/255, 50/255, 255/255, 255/255)
	love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
	love.graphics.setFont(inkTitleFont)
	love.graphics.printf('SQUID ASTEROIDS', 0, 60, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(inkNormalFont)

	love.graphics.setColor(0/255, 0/255, 0/255, 40/255)
	if highlighted == 1 then
		love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
	end
	love.graphics.printf('PLAY', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
	love.graphics.setColor(0/255, 0/255, 0/255, 80/255)

	if highlighted == 2 then
		love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
	end
	love.graphics.printf('EXIT', 0, VIRTUAL_HEIGHT / 2 + 100, VIRTUAL_WIDTH, 'center')
	love.graphics.setColor(0/255, 0/255, 0/255, 40/255)

	love.graphics.setFont(inkSmallFont)
	love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
	love.graphics.printf('Press "H" For Help', 0, VIRTUAL_HEIGHT / 2 + 320, VIRTUAL_WIDTH, 'center')

end