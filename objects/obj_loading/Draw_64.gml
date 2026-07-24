var _total_per_unloaded = array_length(tex_list) + array_length(events_list) // Add up how many assets are unloaded
var _total_max = tex_max + events_max // Get the total of how many assets that need loading

var _per = ((_total_max - _total_per_unloaded) / _total_max) * 100 // Get the loaded percentage

// Now draw it with the funny peppino
draw_sprite(spr_loadingscreen, 0, screen_w / 2, screen_h / 2)
var xx = (screen_w / 2) - sprite_get_xoffset(spr_loadingscreen)
var yy = (screen_h / 2) - sprite_get_yoffset(spr_loadingscreen)
var upscale = sprite_get_width(spr_loadingscreen) / 100
draw_sprite_part(spr_loadingscreen, 1, 0, 0, _per * upscale, sprite_get_height(spr_loadingscreen), xx, yy)
