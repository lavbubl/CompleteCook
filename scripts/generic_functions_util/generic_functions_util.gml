function wrap(m, n) {
  return n >= 0 ? n % m : (n % m + m) % m;
}

function approach(value, target, increment = 0.5)
{
	var t = target - value;
	return value + clamp(t, -increment, increment);
}

function wave(from, to, duration, offset, timer = current_time)
{
	var _wave = (to - from) * 0.5;

	return from + _wave + sin((((timer * 0.001) + duration * offset) / duration) * (pi * 2)) * _wave;
}

function string_convert_seconds_to_timer(_num, _hours = false, _thousandth = false)
{
	var _ms = string(floor((_num % 1) * (_thousandth ? 1000 : 10)))
	var _s = string(floor(_num % 60))
	var _m = string(floor((_num / 60) % 60))
	var _h = string(floor(_num / 3600))
	
	//for all positions in the timer, make it follow a 0 when its below 10
	if _thousandth && string_length(_ms) <= 1
		_ms = "0" + _ms
	if _thousandth && string_length(_ms) <= 2
		_ms = "0" + _ms
	if string_length(_s) <= 1
		_s = "0" + _s
	if string_length(_m) <= 1
		_m = "0" + _m
	if string_length(_h) <= 1
		_h = "0" + _h
	
	var _str = _m + ":" + _s + "." + _ms
	if _hours
		_str = _h + ":" + _str
	return _str; //00:00:00.0 h:m:s:ms
}

function draw_set_align(halign, valign) 
{
	draw_set_halign(halign) 
	draw_set_valign(valign)
}

function quick_shader_set_uniform_f(shader, uniform_name, val)
{
	var f = shader_get_uniform(shader, uniform_name)
	shader_set_uniform_f(f, val)
}

function shake_camera(_mag = 3, _mag_decel = 3 / room_speed)
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
		if _exit
			secret_cutscene = true
		sprite_index = _exit ? spr_player_hurt : spr_player_bodyslamfall
		image_speed = 0.35
	}
}

function instance_create(_x, _y, obj)
{
	return instance_create_depth(_x, _y, 1, obj); //fun fact, x and y were missing underscores before
}

function sleep(ms)
{
	var t = current_time + ms;
	while current_time < t
		do {};
}

function set_globals()
{
	global.combo = {
		count: 0,
		timer: 0,
		record: 0,
		font: font_add_sprite_ext(spr_tv_c_font, "0123456789", true, 2),
		wasted: false
	}
	
	ini_open("globalsave.ini")
	global.option_master_volume = ini_read_real("options", "master_volume", 1)
	global.option_music_volume = ini_read_real("options", "music_volume", 1)
	global.option_sfx_volume = ini_read_real("options", "sfx_volume", 1)
	global.option_unfocus_mute = ini_read_real("options", "unfocus_mute", true)
	global.option_vsync = ini_read_real("options", "vsync", true)
	global.option_showhud = ini_read_real("options", "showhud", true)
	global.option_rumble = ini_read_real("options", "rumble", true)
	global.option_screenshake = ini_read_real("options", "screenshake", true)
	global.option_timer = ini_read_real("options", "timer", true)
	global.option_timertype = ini_read_real("options", "timertype", true)
	global.option_timerspeedrun = ini_read_real("options", "timerspeedrun", true)
	ini_close()
	
	audio_group_set_gain(ag_music, global.option_music_volume)
	audio_group_set_gain(ag_sfx, global.option_sfx_volume)
	
	pal_swap_init_system(shd_pal_swapper, shd_pal_swapper, shd_pal_swapper) //cool
	global.ds_dead_enemies = ds_list_create()
	global.ds_escapesaveroom = ds_list_create()
	global.ds_saveroom = ds_list_create()
	global.doorshut = false
	global.scorefont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0)
	global.generic_font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!?.1234567890:", true, 0)
	global.hud_negativefont = font_add_sprite_ext(spr_negativenumber_font, "0123456789$-", true, 0)
	global.smallnumberfont = font_add_sprite_ext(spr_smallnumber_font, "1234567890-+", true, 0)
	global.smallerfont = font_add_sprite_ext(spr_smaller_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡.:?¿1234567890ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+", true, 0);
	global.tutorialfont = font_add_sprite_ext(spr_tutorialfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz!¡,.:0123456789'?¿-áäãàâæéèêëíìîïóöõôòúùûüÿŸÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇçœß;«»+", true, 2)
	global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz.,:!¡0123456789?'\"ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜáäãàâéèêëíìîïóöõôòúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнльœ«»+ß", true, 2)
	global.bignumber_font = font_add_sprite_ext(spr_bignumber_font, "0123456789/:", true, 0)
	global.secret = false
	global.hurtcounter = 0
	global.boss_room = false
	global.start_room = noone
	global.in_level = false
	set_rank_milestones(1000, 500, 250, 125)
	
	global.level_data = {
		treasure: false,
		level_name: "Entrance",
		secret_count: 0,
		toppins: {
			shroom: false,
			cheese: false,
			tomato: false,
			sausage: false,
			pineapple: false
		},
		lap2: false,
		tauntcount: 0,
		boss_name: "dummy"
	}
	
	global.showcollisions = IS_DEBUG
	global.savefile = "1"
	global.savestring = $"saves/saveData{global.savefile}.ini"
	global.keybinds_filename = "keybinds.ccsav" //complete cook save :)
	
	reset_binds();
	
	if !file_exists(global.keybinds_filename)
	{
		var keybindBuf = buffer_create(buffer_grow, 1, 1) //store the struct as a buffer
		
        buffer_write(keybindBuf, buffer_text, json_stringify(global.keybinds));
        
		buffer_save(keybindBuf, global.keybinds_filename) //save the buffer externally
		
		buffer_delete(keybindBuf) //prevent memory leak
	}
	else
	{
		try
		{
			var loadedBuf = buffer_load(global.keybinds_filename);
            var _json = buffer_read(loadedBuf, buffer_text); // read json file
            buffer_delete(loadedBuf); // prevent memory leak
            
            var _new_binds = json_parse(_json);
            
            var _old_names = struct_get_names(global.keybinds);
            var _new_names = struct_get_names(_new_binds);
            
            array_sort(_old_names, true);
            array_sort(_new_names, true);
			
            if (!array_equals(_old_names, _new_names))
                throw "Missing Save element!";
            
            struct_foreach(global.keybinds, function(_name, _value)
            {
                if (!is_array(_value))
                    throw "Value is not an array!";
            });
            
            //global.keybinds = _new_binds;
		}
		catch(_exception)
		{
			show_message("ERROR!\n\nKeybind data is corrupted, input set to defaults.");
            file_delete(global.keybinds_filename);
		}
	}
    update_binds();
    
}

function update_binds()
{
    struct_foreach(global.keybinds, function(_key, _value)
    {
        declare_input(_key, global.keybinds[$ _key]);
    });
}

function reset_binds()
{
    global.keybinds = { //create keybind struct
        left:			construct_input_array([vk_left], [stick_left_left, gp_padl]),
        right:			construct_input_array([vk_right], [stick_left_right, gp_padr]),
        up:				construct_input_array([vk_up], [stick_left_up, gp_padu]),
        down:			construct_input_array([vk_down], [stick_left_down, gp_padd]),
        dash:			construct_input_array([vk_shift], [gp_shoulderrb]),
        jump:			construct_input_array([ord("Z")], [gp_face1]),
        grab:			construct_input_array([ord("X")], [gp_face2]),
        taunt:			construct_input_array([ord("C")], [gp_face4]),
        superjump:		construct_input_array(),
        groundpound:	construct_input_array(),
        ui_left:		construct_input_array([vk_left], [stick_left_left, gp_padl]),
        ui_right:		construct_input_array([vk_right], [stick_left_right, gp_padr]),
        ui_up:			construct_input_array([vk_up], [stick_left_up, gp_padu]),
        ui_down:		construct_input_array([vk_down], [stick_left_down, gp_padd]),
        ui_accept:		construct_input_array([ord("Z"), vk_enter], [gp_face1]),
        ui_deny:		construct_input_array([ord("X"), vk_escape, vk_backspace], [gp_face2]),
        
        // obj_keyconfig
        addbind:        construct_input_array([ord("Z")], [gp_face1]),
        clearbind:      construct_input_array([ord("C")], [gp_face2]),
        resetallbinds:  construct_input_array([vk_f1], [gp_select]),
        // obj_menuhandler
        menuhandler_deny: construct_input_array([vk_escape, vk_backspace], [gp_start]),
        // obj_pause
        pause: construct_input_array([vk_escape], [gp_start])
    }
}

function bbox_in_camera()
{
	return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 
		obj_camera.campos.x, obj_camera.campos.y, obj_camera.campos.x + screen_w, obj_camera.campos.y + screen_h);
}

function check_p_rank()
{
	return global.level_data.treasure && !global.combo.wasted && global.level_data.lap2 && global.level_data.secret_count >= 3;
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

function draw_reset_color(_alpha = 1)
{
	draw_set_color(c_white)
	draw_set_alpha(_alpha)
}

function tile_layer_delete_at(_x, _y, kill_bg = false)
{
	var layers = layer_get_all()
	for (var i = 0; i < array_length(layers); i++) 
	{
		var cur_layer = layers[i]
	    if string_starts_with(layer_get_name(cur_layer), "Tiles") && (!string_starts_with(layer_get_name(cur_layer), "Tiles_BG") || kill_bg)
		{
			var map_id = layer_tilemap_get_id(cur_layer)
			tilemap_set_at_pixel(map_id, 0, _x, _y)
		}
	}
}

function create_follower(_x, _y, spr_idle = noone, spr_move = noone, spr_panic = noone, spr_taunt = noone, spr_intro = noone)
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
			taunt: spr_taunt,
			intro: spr_intro
		},
		x_offset: 0,
		lerp_spd: 0
	}
	return f; //make this a constructor [new follower_inst()]
}

function reset_level()
{
	global.panic.active = false
	global.combo.count = 0
	global.combo.timer = 0
	global.score = 0
	ds_list_clear(global.ds_dead_enemies)
	ds_list_clear(global.ds_escapesaveroom)
	ds_list_clear(global.ds_saveroom)
	quick_ini_write_real(global.savestring, "General", "file_timer", obj_timer.file_timer)
	obj_followerhandler.followers = []
	obj_levelcontroller.killed_enemy = false
	obj_timer.level_timer = 0
	with obj_player
	{
		visible = true
		visual_size = 1
		has_shotgun = false
		hasgerome = false
		supertauntcount = 0
		supertauntshow = false
	}
	global.combo.wasted = false
	global.doorshut = false
	global.secret = false
	global.hurtcounter = 0
	var _ln = global.level_data.level_name //dont reset the name
	global.level_data = {
		treasure: false,
		level_name: _ln,
		secret_count: 0,
		toppins: {
			shroom: false,
			cheese: false,
			tomato: false,
			sausage: false,
			pineapple: false
		},
		lap2: false,
		tauntcount: 0,
		boss_name: "dummy"
	}
}

function quick_ini_write_real(inistr, section, key, value)
{
	ini_open(inistr)
	ini_write_real(section, key, value)
	ini_close()
}

function gpu_set_blendmode_normal_fixed()
{
	gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_src_alpha, bm_dest_alpha)
	gpu_set_blendequation_sepalpha(bm_eq_add, bm_eq_max)
}

function do_tip(_string, _alarm = 220)
{
	with obj_shakytext
	{
		str = _string
		show = true
		alarm[0] = _alarm
	}
}
