-- Blockworld Settings Data
local settings = {
    graphics = {
        renderDistance = 8,
        quality = "medium",
        fpsLimit = 60,
        vsync = true,
        shadows = true
    },
    controls = {
        sensitivity = 1.0,
        fov = 75,
        invertY = false
    },
    audio = {
        masterVolume = 0.6,
        musicVolume = 0.3
    }
}

function updateSetting(category, key, value)
    settings[category][key] = value
    print("Setting updated: " .. key .. " = " .. tostring(value))
end

