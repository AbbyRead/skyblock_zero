---@class sbz_gentexture
gentexture_cache                = {}

local modname                   = core.get_current_modname()
local modpath                   = core.get_modpath(modname)

-- Set up cache folders (tried in order: mod folder, mod data, world)
gentexture_cache.global_cache   = modpath .. "/cache"
gentexture_cache.mod_data_cache = core.get_mod_data_path()
gentexture_cache.world_cache    = core.get_worldpath() .. "/gentexture_cache"

core.mkdir(gentexture_cache.global_cache)
core.mkdir(gentexture_cache.mod_data_cache)
core.mkdir(gentexture_cache.world_cache)

-- Load API and generator functions
dofile(modpath .. "/api.lua")
dofile(modpath .. "/generator.lua")

-- Generate a small 16x16 noise texture and register a node with it
local w, h   = 16, 16
local pixels = gentexture_cache.generate_noise(w, h)
local b64    = gentexture_cache.get("test_noise", w, h, pixels)

if b64 then
    core.register_node(modname .. ":test_noise_block", {
        description = "Test Noise Block",
        tiles       = { b64 },
        groups      = { cracky = 1, oddly_breakable_by_hand = 1 },
    })
else
    core.log("error", "[gentexture_cache] Failed to generate texture for test_noise_block")
end
