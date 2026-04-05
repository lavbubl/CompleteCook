create_pause_option = function(_name = "", _type = optiontypes.both, _icon_index = 0, _func = undefined) constructor
{
	o_name = _name
	o_type = _type
	o_func = _func
	icon_index = _icon_index
	iconalpha = 0
}

create_pause_screen_asset = function(_spr, _startx = 0, _starty = 0, _endx = 0, _endy = 0, _xscale = 1, _yscale = 1) constructor
{
	sprite_index = _spr
	startx = _startx
	starty = _starty
	endx = _endx
	endy = _endy
	x = startx
	y = starty
	image_xscale = _xscale
	image_yscale = _yscale
}

input_handler = new InputHandler(obj_inputcontroller.main_gamepad).AddInput(["ui_left", "ui_right", "ui_up", "ui_down", "ui_accept", "ui_deny", "pause"]).Finalize();

// declare input
ui_input =
{
	left: false,
	right: false,
	up: false,
	down: false,
	accept: false,
	deny: false,
    pause: false
};

update_input = function()
{
    ui_input.left = input_handler.get_input("ui_left");
    ui_input.right = input_handler.get_input("ui_right");
    ui_input.up = input_handler.get_input("ui_up");
    ui_input.down = input_handler.get_input("ui_down");
    ui_input.accept = input_handler.get_input("ui_accept");
    ui_input.deny = input_handler.get_input("ui_deny");
    ui_input.pause = input_handler.get_input("pause");
}

depth = 0

create_image = false
pause = false
pause_alpha = 0
pause_image = spr_null
optionselected = 0
inputbuffer = 0

optiontypes = { //enum thats actually a struct
	hub: 0, //options only in the hub menu (like MAIN MENU)
	level: 1, //options in levels (like CHEF TASKS)
	both: 2 //optins thats in both the hub and levels
}

baseoptions = [
	new create_pause_option("RESUME",			optiontypes.both,	0), //blank func field, when this is selected its actually resumed in the [EVENT]
	new create_pause_option("OPTIONS",			optiontypes.both,	1, function() {
		instance_create(0, 0, obj_options)
		scr_sound(choose(sfx_ui_accept1, sfx_ui_accept2, sfx_ui_accept3))
	}),
	new create_pause_option("MAIN MENU",		optiontypes.hub,	3, function() {
		do_unpause()
		if obj_music.mu != noone
			audio_stop_sound(obj_music.mu)
		if obj_music.secret_mu != noone
			audio_stop_sound(obj_music.secret_mu)
		room_goto(mainmenu)
		with obj_player
		{
			reset_anim(spr_player_entergate)
			spawn = "a"
			state = states.actor
			door_type = fade_types.door
			hsp = 0
			vsp = 0
		}
		reset_level()
	}),
	new create_pause_option("RESTART LEVEL",	optiontypes.level,	2, function() {
		do_unpause()
		if obj_music.mu != noone
			audio_stop_sound(obj_music.mu)
		if obj_music.secret_mu != noone
			audio_stop_sound(obj_music.secret_mu)
		if global.start_room != noone
		{
			room_goto(global.start_room)
			with obj_player
			{
				reset_anim(spr_player_entergate)
				spawn = "a"
				state = states.actor
				door_type = fade_types.door
				hsp = 0
				vsp = 0
			}
		}
		else
			show_debug_message("start room was unset")
		reset_level()
	}),
	new create_pause_option("CHEF TASKS",		optiontypes.level,	8),
	new create_pause_option("EXIT LEVEL",		optiontypes.level,	3, function() {
		do_unpause()
		if obj_music.mu != noone
			audio_stop_sound(obj_music.mu)
		if obj_music.secret_mu != noone
			audio_stop_sound(obj_music.secret_mu)
		with obj_player
		{
			spawn = noone
			state = states.backtohub
			vsp = 0
			sprite_index = spr_player_slipbanana1
			x = return_location.x
			y = return_location.y
			room_goto(return_location.room)
		}
		
		instance_create(0, 0, obj_fadevisual)
		reset_level()
		
		global.in_level = false
		global.doorshut = true
	})
]

options = []

cursor = {
	x: 0,
	y: 0,
	sprite_index: spr_pizzaangel,
	image_index: 0,
	image_speed: 0.35
}

screen_assets = [
	new create_pause_screen_asset(spr_pause_border, -160, screen_h + 188, 0, screen_h), //left border
	new create_pause_screen_asset(spr_pause_border, screen_w + 160, screen_h + 188, screen_w, screen_h, -1), //right border
	new create_pause_screen_asset(spr_pause_vines, screen_w / 2, -117, screen_w / 2, 0), //vines
]

audio_master_gain(global.option_master_volume)
audio_group_set_gain(ag_sfx, global.option_sfx_volume, 0)
audio_group_set_gain(ag_music, global.option_music_volume, 0)

angel_timer = 240
