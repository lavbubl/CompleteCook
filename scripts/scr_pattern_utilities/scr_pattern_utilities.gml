function pattern_set_colors(palette_sprite)
{
	shader_set(shd_pattern)
	
	var sampler = shader_get_sampler_index(shd_pattern, "palTexture");
	var palette_uvs = shader_get_uniform(shd_pattern, "pal_uvs");
	var texel_h = shader_get_uniform(shd_pattern, "texel_h");
	
	var pal_uvs = sprite_get_uvs(palette_sprite, 0)
	var pal_tex = sprite_get_texture(palette_sprite, 0)
	
	texture_set_stage(sampler, pal_tex)
	shader_set_uniform_f(palette_uvs, pal_uvs[0], pal_uvs[1], pal_uvs[2], pal_uvs[3])
	shader_set_uniform_f(texel_h, texture_get_texel_height(pal_tex))
}

function pattern_draw(spr, ix, _x, _y, pattern_spr, xscale = 1, yscale = 1, rot = 0, col = c_white, alpha = 1)
{
	if pattern_spr == noone
		exit;
	
	if !surface_exists(pattern_surf)
	{
		pattern_surf = surface_create(sprite_get_width(spr), sprite_get_height(spr))
		pattern_mask_surf = surface_create(sprite_get_width(spr), sprite_get_height(spr))	
	}
	
	if surface_exists(pattern_surf)
	{
		surface_resize(pattern_surf, sprite_get_width(spr), sprite_get_height(spr))
		surface_resize(pattern_mask_surf, sprite_get_width(spr), sprite_get_height(spr))
		
		surface_set_target(pattern_mask_surf)
		draw_clear(c_white)
		gpu_set_blendmode(bm_subtract)
		pattern_set_colors(pal_peppatterncolors)
		draw_sprite(spr, ix, sprite_get_xoffset(spr), sprite_get_yoffset(spr))
		shader_reset()
		gpu_set_blendmode_ext(bm_src_alpha, bm_dest_alpha)
		surface_reset_target()
		
		surface_set_target(pattern_surf)
		draw_sprite_tiled(pattern_spr, 0, 0, 0)
		gpu_set_blendmode(bm_subtract)
		draw_surface(pattern_mask_surf, 0, 0)
		gpu_set_blendmode_normal_fixed()
		surface_reset_target()
		
		draw_surface_ext(pattern_surf, _x - (sprite_get_xoffset(spr) * xscale), _y - (sprite_get_yoffset(spr) * yscale), xscale, yscale, rot, col, alpha)
	}
}

function pattern_init()
{
	pattern_surf = noone
	pattern_mask_surf = noone
}

function pattern_cleanup()
{
	surface_free(pattern_surf)
	surface_free(pattern_mask_surf)
	
	pattern_surf = noone
	pattern_mask_surf = noone
}

/*function pattern_set(pattern_sprite, palette_sprite) just look at this masterful craft of programming.
{
	if (pattern_sprite == 0) 
		exit;
	
	shader_set(shd_pattern);
	var sampler = shader_get_sampler_index(shd_pattern, "palTexture");
	var patternsampler = shader_get_sampler_index(shd_pattern, "patternTexture");
	var u_uv = shader_get_uniform(shd_pattern, "pal_uvs");
	var u_pattern_uv = shader_get_uniform(shd_pattern, "pattern_uvs");
	var u_player_uv = shader_get_uniform(shd_pattern, "player_uvs");
	var u_player_size = shader_get_uniform(shd_pattern, "player_size");
	var u_pattern_size = shader_get_uniform(shd_pattern, "pattern_size");
	var col_count = shader_get_uniform(shd_pattern, "col_count");
	var u_pattern_offset = shader_get_uniform(shd_pattern, "pattern_offset");
	
	var pal_uvs = sprite_get_uvs(palette_sprite, 0)
	var pattern_uvs = sprite_get_uvs(pattern_sprite, 0)
	var player_uvs = sprite_get_uvs(sprite_index, image_index)
	var playerfirstframe_uvs = sprite_get_uvs(sprite_index, 0)
	var player_sprite_width = sprite_get_bbox_right(sprite_index) - sprite_get_bbox_left(sprite_index)
	var player_sprite_height = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index)
	var pattern_size = [sprite_get_width(pattern_sprite), sprite_get_height(pattern_sprite)]
	var left_corner_dist_from_origin = [sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index),
										sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index)]
	
	texture_set_stage(sampler, sprite_get_texture(palette_sprite, 0))
	texture_set_stage(patternsampler, sprite_get_texture(pattern_sprite, 0))
	shader_set_uniform_f(u_uv, pal_uvs[0], pal_uvs[1], pal_uvs[2], pal_uvs[3])
	shader_set_uniform_f(u_pattern_uv, pattern_uvs[0], pattern_uvs[1], pattern_uvs[2], pattern_uvs[3])
	shader_set_uniform_f(u_player_uv, player_uvs[0], player_uvs[1], player_uvs[2], player_uvs[3])
	shader_set_uniform_f(u_player_size, player_sprite_width, player_sprite_height)
	shader_set_uniform_f(u_pattern_size, pattern_size[0], pattern_size[1])
	shader_set_uniform_f(col_count,	sprite_get_height(palette_sprite))
	shader_set_uniform_f(u_pattern_offset, playerfirstframe_uvs[0], playerfirstframe_uvs[1], playerfirstframe_uvs[2], playerfirstframe_uvs[3]) //the filthiest hack ever done
}*/
