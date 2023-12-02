local config = {
    expression = models.model.root.Body.expression,
    cat_accessories = models.Extra.cat.cat_accessories,
    blahaj = models.External.blahaj.blahaj,
}

function setExpression(expression)
    config.expression:setPrimaryTexture("CUSTOM", textures["Expressions." .. expression])
end

function events.RENDER()
    -- Reset the expression in case nothing else is setting it
    setExpression("NeutralExpression")

    -- Canibalism :(
    local isEating = player:getActiveItem():getUseAction() == "EAT"
    local isEatingBread = isEating and player:getActiveItem().id == "minecraft:bread"
    if isEatingBread then setExpression("CryingExpression") end
end

-- Make vanilla model parts invisible
vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)
vanilla_model.CAPE:setVisible(false)
-- Make custom model parts invisible
config.cat_accessories:setVisible(false)
config.blahaj:setVisible(false)


local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)
