showMode = false
centerCam = false centerX = 550 centerY = 300
thisCameraSystem = true
local isHardmode = false

function onCreatePost()
    isHardmode = false

    luaDebugMode = true 
end

local targetCamX, targetCamY = 0, 0

function onStepHit()

end

local thingLerp = 1
function onUpdate(elapsed)
    if not inGameOver and not getProperty('isCameraOnForcedPos') and thisCameraSystem then
        if centerCam then
            setProperty("camFollow.x", centerX + math.sin(getSongPosition()/500)*5)
            setProperty("camFollow.y", centerY + math.cos(getSongPosition()/700)*5)
        else
            setProperty("camFollow.x", targetCamX + math.sin(getSongPosition()/500)*30)
            setProperty("camFollow.y", targetCamY + math.cos(getSongPosition()/700)*30)
        end
    end
end


function onMoveCamera(character)
    if thisCameraSystem then
        if showMode or getProperty('showMode') and not getProperty('isCameraOnForcedPos')  then
            if character == "dad" then
                --setProperty("camFollow.x", getProperty("camFollow.x") + 300)
                setProperty("camFollow.x", 230.5)
            else
                --setProperty("camFollow.x", getProperty("camFollow.x") - 360)
                setProperty("camFollow.x", 917.5)
            end
        else
            if character == "dad" then
                --setProperty("camFollow.x", getProperty("camFollow.x") + 300)
                --setProperty("camFollow.x", 230.5)
                setProperty("camFollow.x", -92)
            else
                setProperty("camFollow.x", 1275.5)
            end
        end

        targetCamX, targetCamY = getProperty("camFollow.x"), getProperty("camFollow.y")
    end
end