function Approach(a, b, amount)
{
	//STOOOLEEEEENNN!!!! RRaaaaaaaAAAAAAAAHHHHH https://www.youtube.com/watch?v=2FroAhEsuE8
	if a < b
	{
		a += amount;
		if a > b
			return b;
	}
	else
	{
		a -= amount;
		if a < b
			return b;
	}
	return a;
}
function get_milliseconds()
{
	return get_timer() / 1000;
}
function camera_zoom(zoom_target, zoom_speed)
{
	with obj_camera
	{
		targetzoom = zoom_target
		targetzoom = clamp(targetzoom, 0, max_zoom)
		
		if zoom_speed != undefined
			zoomspd = abs(zoom_speed)
	}
}

function camera_set_zoom(argument0)
{
	with obj_camera
		zoom = argument0
}

function try_solid(xplus, yplus, object, tries)
{
	var old_x = x
	var old_y = y
	var n = -1
	
	for(var i = 0; i < tries; i++)
	{
		x += xplus
		y += yplus
		
		if !scr_solid(x, y)
		{
			n = i + 1
			break
		}
	}
	
	x = old_x
	y = old_y
	return n;
}

function ledge_bump(argument0)
{
	var old_x = x
	var old_y = y
	
	x += xscale * 4
	var ty = try_solid(0, -1, obj_solid, argument0)
	x = old_x
	
	if ty != -1
	{
		y -= ty
		x += xscale
		if scr_solid(x, y)
		{
			x = old_x
			y = old_y
			return true;
		}
		return false;
	}
	return true;
}

function instance_create_unique(argument0, argument1, argument2)
{
	if instance_exists(argument2)
		return noone;
	var b = instance_create(argument0, argument1, argument2)
	return b;
}

function get_solid_difference(argument0, argument1, argument2)
{
	var old_x = x
	var old_y = y
	
	var n = 0
	for (i = 0; i < argument2; i++)
	{
		x += argument0
		y += argument1
		if !scr_solid(x, y)
			n++
	}
	
	x = old_x
	y = old_y
	return n;
}

function trace()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	show_debug_message(_string)
	exit;
}

function concat()
{
	var _string = ""
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i])
	return _string;
}

function ds_list_add_unique(argument0)
{
	if argument_count > 1
	{
		for (var i = 1; i < argument_count; i++)
		{
			var b = argument[i]
			if ds_list_find_index(argument0, b) == -1
				ds_list_add(argument0, b)
		}
	}
}

function point_in_camera(argument0, argument1, argument2)
{
	var cam_x = camera_get_view_x(argument2)
	var cam_y = camera_get_view_y(argument2)
	var cam_w = camera_get_view_width(argument2)
	var cam_h = camera_get_view_height(argument2)
	return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function point_in_camera_ext(argument0, argument1, argument2, argument3, argument4)
{
	var cam_x = camera_get_view_x(argument2)
	var cam_y = camera_get_view_y(argument2)
	var cam_w = camera_get_view_width(argument2)
	var cam_h = camera_get_view_height(argument2)
	return point_in_rectangle(argument0, argument1, (cam_x - argument3), (cam_y - argument4), ((cam_x + cam_w) + argument3), ((cam_y + cam_h) + argument4));
}

function bbox_in_camera(argument0, argument1)
{
	if is_undefined(argument1)
		argument1 = 0
	var cam_x = camera_get_view_x(argument0)
	var cam_y = camera_get_view_y(argument0)
	var cam_w = camera_get_view_width(argument0)
	var cam_h = camera_get_view_height(argument0)
	return bbox_left < cam_x + cam_w + argument1 && bbox_right > cam_x - argument1 && bbox_top < cam_y + cam_h + argument1 && bbox_bottom > cam_y - argument1;
}

function instance_nearest_random(argument0, argument1)
{
	var l = instance_furthest(x, y, argument0)
	var list = ds_list_create()
	for (i = 0; i < instance_number(argument0); i++)
	{
		var b = instance_find(argument0, i)
		var t = distance_to_object(b)
		if t <= l
			ds_list_add(list, b)
	}
	
	var b = undefined
	if ds_list_size(list) > 0
	{
		var n = irandom(argument1)
		if ds_list_size(list) < n
			n = ds_list_size(list) - 1
		b = ds_list_find_value(list, ds_list_size(list) - n)
	}
	ds_list_destroy(list)
	return b;
}

function instance_random(object) {
	return instance_find(object, irandom(instance_number(object) - 1));
}

function heat_calculate(num)
{
	trace(global.stylemultiplier)
	return num + round(num * global.stylemultiplier);
}
