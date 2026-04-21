-- Blockworld Main Core
local screen = "menu"
local playerName = "Player"
local fps = 60

print("Blockworld: Core initialized.")

function setScreen(newScreen)
    screen = newScreen
    print("Screen changed to: " .. screen)
    renderUI()
end

function renderUI()
    -- Tässä simuloitaisiin UI:n piirtämistä HTML/Canvas-tasolle
    if screen == "menu" then
        print("Rendering Main Menu: Play, Settings, Character")
    elseif screen == "inventory" then
        print("Rendering Inventory: Items, Crafting, Character")
    end
end

-- Alustus
setScreen("menu")

