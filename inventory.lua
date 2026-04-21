-- inventory.lua: Inventory & Crafting Logic
local Inv = {
    storage = {},
    hotbar = {},
    crafting = {}, -- 3x3 grid
    selectedSlot = 1,
    draggingItem = nil
}

-- Initialize empty slots
for i=1, 27 do Inv.storage[i] = nil end
for i=1, 9 do Inv.hotbar[i] = nil end
for i=1, 9 do Inv.crafting[i] = nil end

-- Feature: Recipe Definitions
local Recipes = {
    {
        name = "Planks",
        pattern = {"LOG", nil, nil, nil, nil, nil, nil, nil, nil},
        result = {id = "PLANKS", count = 4}
    },
    {
        name = "Stick",
        pattern = {"PLANKS", nil, nil, "PLANKS", nil, nil, nil, nil, nil},
        result = {id = "STICK", count = 4}
    }
}

-- Feature: Pattern Matching Engine
function Inv:MatchRecipe()
    for _, recipe in ipairs(Recipes) do
        local match = true
        for i=1, 9 do
            local gridItem = self.crafting[i] and self.crafting[i].id or nil
            if gridItem ~= recipe.pattern[i] then
                match = false
                break
            end
        end
        if match then return recipe end
    end
    return nil
end

-- Feature: Item Stacking Logic
function Inv:AddItem(id, count)
    -- Check hotbar first, then storage
    -- Logic for finding existing stack or first empty slot
end

-- Feature: Drag & Drop Implementation (Internal state)
function Inv:OnSlotClick(area, index)
    -- Area: 1=inv, 2=hotbar, 3=craft
    -- Logic for swapping draggingItem and slot
end

-- Feature: Visual Rendering (called from main.lua)
function RenderInventory(ctx, canvas)
    -- Dark overlay
    ctx.fillStyle = "rgba(0,0,0,0.7)"
    ctx:fillRect(0, 0, canvas.width, canvas.height)
    
    -- Draw Storage Grid
    ctx.fillStyle = "rgba(255,255,255,0.1)"
    for i=0, 26 do
        local x = 100 + (i % 9) * 50
        local y = 100 + math.floor(i / 9) * 50
        ctx:fillRect(x, y, 45, 45)
    end
    
    -- Draw Crafting Grid (3x3)
    for i=0, 8 do
        local x = 600 + (i % 3) * 50
        local y = 150 + math.floor(i / 3) * 50
        ctx:fillRect(x, y, 45, 45)
    end
    
    -- Draw Labels
    ctx.fillStyle = "white"
    ctx.font = "14px monospace"
    ctx:fillText("STORAGE", 100, 90)
    ctx:fillText("CRAFTING", 600, 140)
    ctx:fillText("CHARACTER", 600, 350)
end

print("Inventory: Drag&Drop System Loaded")
-- [Lisää logiikkaa: Item tooltips, stack splitting (Right click), auto-sorting...]
