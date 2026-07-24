local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('bf y verity');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
    makeLuaSprite('pantallaNigga', '', 0, 0)
    makeGraphic('pantallaNigga', 1280, 720, '000000')
    setObjectCamera('pantallaNigga', 'other')
    
    addLuaSprite('pantallaNigga', true)
    setProperty('pantallaNigga.alpha', 0)
    makeLuaSprite('faderColor', '', 0, 0)
end

function onStepHit()
    if curStep == 304 then
        doTweenX('irAColor', 'faderColor', 1, 2, 'linear')
    end

    if curStep == 607 then
        doTweenX('irANormal', 'faderColor', 0, 2, 'linear')
    end
    
    if curStep == 1074 then
        setProperty('pantallaNigga.alpha', 1)
    end
end

function onUpdatePost(elapsed)
    local progreso = getProperty('faderColor.x')
    
    convertirASilueta('casa', 0, 0, 0, progreso)
    convertirASilueta('dad', 235, 195, 4, progreso)
    convertirASilueta('boyfriend', 4, 172, 240, progreso)
end

function convertirASilueta(objeto, r, g, b, progreso)
    local mult = 1 - progreso
    
    setProperty(objeto..'.colorTransform.redMultiplier', mult)
    setProperty(objeto..'.colorTransform.greenMultiplier', mult)
    setProperty(objeto..'.colorTransform.blueMultiplier', mult)
    setProperty(objeto..'.colorTransform.redOffset', r * progreso)
    setProperty(objeto..'.colorTransform.greenOffset', g * progreso)
    setProperty(objeto..'.colorTransform.blueOffset', b * progreso)
end