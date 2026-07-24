function onCreate()
	makeLuaSprite('casa', 'casa', -250, -450);
	scaleObject('casa', 2.3, 2.3)
	addLuaSprite('casa', false)
end

local zoomOponente = 0.9
local zoomNormal = 0.75

function onMoveCamera(focus)
    if focus == 'dad' then

        setProperty('defaultCamZoom', zoomOponente)
    else

        setProperty('defaultCamZoom', zoomNormal)
    end
end
