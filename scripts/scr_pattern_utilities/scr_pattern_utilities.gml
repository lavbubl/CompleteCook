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

function pattern_draw(_spr, _ix, _x, _y, _pattern_spr, _xscale = 1, _yscale = 1, _rot = 0, _col = c_white, _alpha = 1)
{
	if _pattern_spr == noone
		exit;
	
	//original variables
	var _prev_cwe = gpu_get_colorwriteenable()
	
	//Stencil setup
	draw_clear_stencil(0)
	gpu_set_stencil_enable(true)
	gpu_set_stencil_func(cmpfunc_greater)
	gpu_set_stencil_pass(stencilop_replace)
	gpu_set_stencil_ref(1)
	
	//Draw mask
	gpu_set_colorwriteenable(false, false, false, false)
	
	pattern_set_colors(pal_peppatterncolors)
	draw_sprite_ext(_spr, _ix, _x, _y, _xscale, _yscale, _rot, _col, _alpha)
	shader_reset()
	
	gpu_set_colorwriteenable(_prev_cwe)
	
	////Draw tiled pattern
	gpu_set_stencil_ref(0)
	gpu_set_stencil_func(cmpfunc_notequal)
	gpu_set_stencil_pass(stencilop_keep)
	draw_sprite_tiled_ext(_pattern_spr, 0, _x, _y, _xscale, _yscale, _col, _alpha)
	gpu_set_stencil_enable(false) 
}

/*oh my sweet summer child...
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
