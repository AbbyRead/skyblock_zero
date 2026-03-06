-- Utility functions
local function hash(str)
    return core.sha1(str)
end

local function try_write(path, data)
    local f = io.open(path, "wb")
    if not f then return false end
    f:write(data)
    f:close()
    return true
end

local function file_exists(path)
    local f = io.open(path, "rb")
    if f then
        f:close()
        return true
    end
    return false
end

-- Generate a PNG, write it to cache, and register it with dynamic_add_media
-- so the engine treats it as a normal named texture usable in node tiles.
-- Returns the filename (e.g. "test_noise_abc123.png") for use in tiles,
-- or nil on failure. Must be called at mod load time.
function gentexture_cache.get(name, width, height, pixels)
    local id            = hash(name .. width .. height)
    local filename      = name .. "_" .. id .. ".png"

    local global_path   = gentexture_cache.global_cache .. "/" .. filename
    local mod_data_path = gentexture_cache.mod_data_cache .. "/" .. filename
    local world_path    = gentexture_cache.world_cache .. "/" .. filename

    local filepath      = nil

    if file_exists(global_path) then
        filepath = global_path
    elseif file_exists(mod_data_path) then
        filepath = mod_data_path
    elseif file_exists(world_path) then
        filepath = world_path
    else
        -- Encode and write fresh
        local png_data = core.encode_png(width, height, pixels)
        assert(png_data, "core.encode_png returned nil — check pixel array")

        if try_write(global_path, png_data) then
            filepath = global_path
        elseif try_write(mod_data_path, png_data) then
            filepath = mod_data_path
        elseif try_write(world_path, png_data) then
            filepath = world_path
        else
            core.log("error", "[gentexture_cache] Could not write PNG to any cache location")
            return nil
        end
    end

    -- Register the file as engine media so clients can load it by filename.
    -- dynamic_add_media at load time (nil callback) is supported since 5.9.0.
    core.dynamic_add_media({ filename = filename, filepath = filepath })

    return filename
end
