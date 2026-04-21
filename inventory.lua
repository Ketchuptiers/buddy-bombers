-- Inventory Logic
local inventory = {}
local hotbar = {}
local craftGrid = {} -- 1-9 indexit

local RECIPES = {
    { id = "wood_planks", pattern = {"log", nil, nil, nil, nil, nil, nil, nil, nil}, count = 4 },
    { id = "sticks", pattern = {"wood_planks", nil, nil, "wood_planks", nil, nil, nil, nil, nil}, count = 4 }
}

function checkCrafting()
    for _, recipe in ipairs(RECIPES) do
        local match = true
        for i=1, 9 do
            if craftGrid[i] ~= recipe.pattern[i] then
                match = false
                break
            end
        end
        if match then return recipe end
    end
    return nil
end

print("Inventory System: Loaded.")

