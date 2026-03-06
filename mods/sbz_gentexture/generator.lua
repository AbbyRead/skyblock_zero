-- Generate a greyscale noise texture
function gentexture_cache.generate_noise(w, h)
    local pixels = {}
    for i = 1, w * h do
        local v = math.random(0, 255)
        pixels[i] = { r = v, g = v, b = v, a = 255 }
    end
    return pixels
end

-- Generate a left-to-right blue gradient texture
-- Guards against w == 1 to avoid division by zero
function gentexture_cache.generate_gradient(w, h)
    local pixels = {}
    for y = 0, h - 1 do
        for x = 0, w - 1 do
            local v = (w > 1) and math.floor((x / (w - 1)) * 255) or 0
            pixels[#pixels + 1] = { r = v, g = v, b = 255, a = 255 }
        end
    end
    return pixels
end
