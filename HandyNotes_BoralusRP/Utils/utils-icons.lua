local myname, ns = ...

if not ns.utils          then ns.utils          = {} end;
if not ns.utils.textures then ns.utils.textures = {} end;

local atlas_texture = function(atlas, scale)
    local texture, _, _, left, right, top, bottom = GetAtlasInfo(atlas)
    return {
        icon = texture,
        tCoordLeft = left,
        tCoordRight = right,
        tCoordTop = top,
        tCoordBottom = bottom,
        scale = scale or 1,
    }
end

ns.utils.textures.atlas = atlas_texture;
