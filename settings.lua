-- settings.lua: Configuration & Audio Management
local Config = {
    graphics = {
        renderDistance = 8,
        fov = 75,
        vsync = true,
        shadows = true,
        quality = "high"
    },
    controls = {
        sens = 1.0,
        invertY = false,
        keybinds = {
            forward = "w",
            back = "s",
            left = "a",
            right = "d",
            jump = " ",
            inv = "e"
        }
    },
    audio = {
        master = 0.8,
        music = 0.4,
        ambient = true
    }
}

-- Feature: Config Persistence (LocalStorage bridge)
function Config:Save()
    print("Settings saved to local storage simulation")
end

function Config:Load()
    print("Settings loaded")
end

-- Feature: Graphic Quality Handler
function Config:SetQuality(lvl)
    if lvl == "low" then
        self.graphics.shadows = false
        self.graphics.renderDistance = 4
    elseif lvl == "high" then
        self.graphics.shadows = true
        self.graphics.renderDistance = 12
    end
end

-- Feature: Keybind Rebind Logic
function Config:Rebind(action, newKey)
    self.controls.keybinds[action] = newKey
end

-- Audio Mixer Logic
function Config:SetVolume(bus, val)
    if self.audio[bus] then self.audio[bus] = val end
end

print("Settings: Configuration Module Ready")
-- [Lisää logiikkaa: Resolution scaling, language localization maps, mobile control layouts...]
