function sprite_set_size(argument0, argument1)
{
	image_xscale = (argument0 / sprite_get_width(sprite_index))
	image_yscale = (argument1 / sprite_get_width(sprite_index))
}

function snap_tile(argument0, argument1)
{
	return (floor((argument0 / argument1)) * argument1);
}

function add_object(argument0, argument1, argument2, argument3, argument4 = 0, argument5 = 0)
{
	var s = 1
	if (sprite_get_width(argument2) >= 64 or sprite_get_height(argument2) >= 64)
		s = min((64 / sprite_get_width(argument2)), (64 / sprite_get_height(argument2)))
	
	ds_list_add(object_list[argument0], {
		name: argument1,
		sprite_index: argument2,
		image_xscale: s,
		image_yscale: s,
		object_index: argument3,
		image_xoffset: argument4,
		image_yoffset: argument5,
		place_xoffset: 0,
		place_yoffset: 0,
		layerdepth: 0
	})
}

function set_object_place_offset(argument0, argument1, argument2)
{
	var b = ds_list_find_value(array_get(object_list, argument0), (ds_list_size(objectlist) - 1))
	b.place_xoffset = argument1
	b.place_yoffset = argument1
}

function set_object_layerdepth(argument0, argument1)
{
	b = ds_list_find_value(array_get(object_list, argument0), (ds_list_size(objectlist) - 1))
	b.layerdepth = argument1
}

function objectlist_calculate_scrollsize()
{
	var xx = 0
	var yy = 0
	for (var i = 0; i < ds_list_size(object_list); i++)
	{
		xx += 64
		if (xx >= sprite_width)
		{
			xx = 0
			yy += 64
		}
	}
	scroll_ymax = (yy - sprite_height)
	if (scroll_ymax < 0)
		scroll_ymax = 0
}

function create_buttons_array(argument0, argument1, argument2, argument3, argument4)
{
	var xsize = 0
	draw_set_font(global.editorfont)
	for (i = 0; i < array_length(argument4); i++)
	{
		b = argument4[i]
		var t = string_width(b[0])
		if (t > xsize)
			xsize = (t + argument2)
	}
	for (i = 0; i < array_length(argument4); i++)
	{
		b = argument4[i]
		with (instance_create_depth(argument0, (argument1 + (i * argument3)), depth, obj_textbutton))
		{
			buttonid = i
			sprite_index = spr_bigbutton
			sprite_set_size(xsize, argument3)
			label = b[0]
			if (b[1] != -4)
				OnSelect = method(id, b[1])
			if (b[2] != -4)
				OnDeselect = method(id, b[2])
			parent = other.id
		}
	}
}
