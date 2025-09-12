alpha = approach(alpha, place_meeting(x, y, obj_player) ? 0 : 1, 0.15)
if (!surface_exists(surf)) surf = surface_create(image_xscale*sprite_width, image_yscale*sprite_height);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_tilemap(map_id,-x,-y)
surface_reset_target();
draw_surface_ext(surf, x, y, 1, 1, 0, c_white, alpha)
//idk how this even works the way it does ingame but Okay.