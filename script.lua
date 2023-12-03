local modelparts = {
    expression = models.model.root.Body.expression,
    cat_accessories = models.Extra.cat.cat_accessories,
    blahaj = models.External.blahaj.blahaj,
}

function setExpression(expression)
    modelparts.expression:setPrimaryTexture("CUSTOM", textures["Expressions." .. expression])
end

function events.RENDER()
    -- Reset the expression in case nothing else is setting it
    setExpression("NeutralExpression")

    -- Canibalism :)
    local isEating = player:getActiveItem():getUseAction() == "EAT"
    local isEatingBread = isEating and player:getActiveItem().id == "minecraft:bread"
    if isEatingBread then setExpression("CryingExpression") end
end

function events.RENDER()
    -- Literally just sets the position of both Arms while Crouching
    if player:isCrouching() then
        models.model.root.LeftArm:setPos(0, -1, -4) 
        models.model.root.RightArm:setPos(0, -1, -4) 
    else
        models.model.root.LeftArm:setPos(0, 0, 0) 
        models.model.root.RightArm:setPos(0, 0, 0)
    end
end

-- Make vanilla model parts invisible
vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)
vanilla_model.CAPE:setVisible(false)
-- Make custom model parts invisible
modelparts.cat_accessories:setVisible(false)
modelparts.blahaj:setVisible(false)


local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)
