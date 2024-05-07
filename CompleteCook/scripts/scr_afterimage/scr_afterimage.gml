function create_afterimage(argument0, argument1, argument2, argument3)
{
	var q = 
	{
		x: argument0,
		y: argument1,
		sprite_index: argument2,
		image_index: argument3,
		alarm: [15, 3, -1],
		image_blend: choose(global.afterimage_color1, global.afterimage_color2),
		image_xscale: 1,
		identifier: afterimage.afterimage,
		visible: true,
		alpha: 1
	}

	ds_list_add(global.afterimage_list, q)
	return q;
}

function create_mach3effect(argument0, argument1, argument2, argument3)
{
	q = 
	{
		x: argument0,
		y: argument1,
		sprite_index: argument2,
		image_index: argument3,
		alarm: [15, 6, -1],
		image_blend: choose(global.mach_color1, global.mach_color2),
		image_xscale: 1,
		visible: true,
		identifier: afterimage.mach3effect,
		playerid: obj_player1,
		alpha: 1
	}

	ds_list_add(global.afterimage_list, q)
	return q;
}

function create_heatattack_afterimage(argument0, argument1, argument2, argument3, argument4)
{
	var _velocity = 6
	with create_afterimage(argument0, argument1, argument2, argument3)
	{
		identifier = afterimage.heatattack
		alarm[1] = -1
		alarm[2] = -1
		alarm[0] = 8
		image_xscale = argument4
		hsp = _velocity
		vsp = 0
	}
	with create_afterimage(argument0, argument1, argument2, argument3)
	{
		identifier = afterimage.heatattack
		alarm[1] = -1
		alarm[2] = -1
		alarm[0] = 8
		image_xscale = argument4
		hsp = -_velocity
		vsp = 0
	}
	with create_afterimage(argument0, argument1, argument2, argument3)
	{
		identifier = afterimage.heatattack
		alarm[1] = -1
		alarm[2] = -1
		alarm[0] = 8
		image_xscale = argument4
		hsp = 0
		vsp = _velocity
	}
	with create_afterimage(argument0, argument1, argument2, argument3)
	{
		identifier = afterimage.heatattack
		alarm[1] = -1
		alarm[2] = -1
		alarm[0] = 8
		image_xscale = argument4
		hsp = 0
		vsp = -_velocity
	}
}

function create_firemouth_afterimage(argument0, argument1, argument2, argument3, argument4)
{
	with create_afterimage(argument0, argument1, argument2, argument3)
	{
		identifier = afterimage.firemouth
		alarm[0] = -1
		alarm[1] = -1
		alarm[2] = -1
		image_xscale = argument4
		image_blend = make_color_rgb(248, 112, 24)
		alpha = 1.25
	}
}

function create_blue_afterimage(argument0, argument1, argument2, argument3, argument4)
{
	with create_afterimage(argument0, argument1, argument2, argument3)
	{
		identifier = afterimage.blue
		alarm[0] = -1
		alarm[1] = -1
		alarm[2] = -1
		image_xscale = argument4
		image_blend = make_color_rgb(44, 126, 228)
		alpha = 1.25
	}
}

function create_blur_afterimage(argument0, argument1, argument2, argument3, argument4)
{
	var b = create_afterimage(argument0, argument1, argument2, argument3)
	with b
	{
		identifier = afterimage.blur
		alarm[0] = -1
		alarm[1] = -1
		alarm[2] = -1
		image_blend = c_white
		image_xscale = argument4
		alpha = 0.8
		playerid = noone
	}
	return b;
}
