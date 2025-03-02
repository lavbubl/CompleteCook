function wrap(m, n) {
  return n >= 0 ? n % m : (n % m + m) % m;
}

function approach(value, target, increment = 0.5)
{
	var t = target - value;
	return value + clamp(t, -increment, increment);
}


function wave(from, to, duration, offset)
{
	var _wave = (to - from) * 0.5;

	return from + _wave + sin((((current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * _wave;
}

function draw_set_align(halign, valign, color = c_white) 
{
	draw_set_halign(halign) 
	draw_set_valign(valign)
	draw_set_color(color)
}

function quick_shader_set_uniform_f(shader, uniform_name, val)
{
	var f = shader_get_uniform(shader, uniform_name)
	shader_set_uniform_f(f, val)
}

function shake_camera(_mag = 5, _mag_decel = 0.25)
{
	obj_camera.mag = _mag
	obj_camera.mag_decel = _mag_decel
}

function reset_anim(spr)
{
	sprite_index = spr
	image_index = 0;
}

function reset_anim_on_end(spr)
{
	if anim_ended()
		return reset_anim(spr);
}

enum fade_types
{
	none,
	hallway,
	v_hallway,
	door,
	generic,
	box
}

function do_fade(t_room, t_door, type)
{
	with obj_fade
	{
		if !fade
		{
			fade = true
			target_room = t_room
			pos = {
				x: obj_player.x,
				y: obj_player.y
			}
			obj_player.spawn = t_door
			obj_player.door_type = type
		}
	}
}

function do_secret_fade()
{
	with obj_fade
	{
		if !fade
		{
			fade = true
			target_room = other.t_room
		}
	}
	obj_player.secret_exit = true
}

function do_hold_player(_exit)
{
	with obj_player
	{
		x = other.x
		y = other.y - 20
		xstart = x
		ystart = y
		hsp = 0
		vsp = 0
		state = states.actor
		secret_exit = _exit
		secret_cutscene = _exit
		sprite_index = _exit ? spr_player_hurt : spr_player_bodyslamfall
		image_speed = 0.35
	}
}

function instance_create(_x, _y, obj)
{
	return instance_create_depth(x, y, 1, obj);
}

function sleep(o)
{
	var t = current_time + o;
	while current_time < t
		do {};
}

function set_globals()
{
	global.combo = {
		count: 0,
		timer: 0,
		font: font_add_sprite_ext(spr_tv_c_font, "0123456789", true, 2),
		wasted: false,
		started: false
	}
	pal_swap_init_system(shd_pal_swapper, shd_pal_swapper, shd_pal_swapper) //cool
	global.ds_dead_enemies = ds_list_create()
	global.ds_saveroom = ds_list_create()
	global.doorshut = false
	global.scorefont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0)
	global.generic_font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.1234567890:", true, 0)
	global.hud_negativefont = font_add_sprite_ext(spr_negativenumber_font, "0123456789$-", true, 0)
	global.secret = false
	global.rank_milestones = {
		c: 20,
		b: 40,
		a: 80,
		s: 160
	}
	global.level_data = {
		treasure: false,
		level_name: "entrance"
	}
}

function bbox_in_camera()
{
	return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 
		obj_camera.campos.x, obj_camera.campos.y, obj_camera.campos.x + screen_w, obj_camera.campos.y + screen_h);
}

function check_p_rank()
{
	return global.level_data.treasure && !global.combo.wasted;
}

function set_rank_milestones(_s, _a, _b, _c)
{	
	global.rank_milestones = {
		c: _c,
		b: _b,
		a: _a,
		s: _s
	}
}

function draw_reset_color(alpha = true)
{
	draw_set_color(c_white)
	if alpha
		draw_set_alpha(1)
}

function tile_layer_delete_at(_x, _y)
{
	var layers = layer_get_all()
	for (var i = 0; i < array_length(layers); i++) 
	{
		var cur_layer = layers[i]
	    if (string_starts_with(layer_get_name(cur_layer), "Tiles"))
		{
			var map_id = layer_tilemap_get_id(cur_layer)
			tilemap_set_at_pixel(map_id, 0, _x, _y)
		}
	}
}

function create_follower(_x, _y, spr_idle = noone, spr_move = noone, spr_panic = noone, spr_taunt = noone)
{
	var f = {
		sprite_index: noone,
		image_index: 0,
		x: _x,
		y: _y,
		sprs: {
			idle: spr_idle,
			move: spr_move,
			panic: spr_panic,
			taunt: spr_taunt
			},
		x_offset: 0,
		lerp_spd: 0
	}
	return f;
}
