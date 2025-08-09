function collide()
{
	var hsp_plat = 0
	var vsp_plat = 0
	var o_inc = 8 //optimization increment
	
	old_x2 = x
	old_y2 = y
	
	var ground_check = false
	
	var bh = bbox_bottom - y
	var plat_id = noone
	with collision_rectangle(bbox_left, bbox_top + min(0, vsp), bbox_right, bbox_bottom + max(0, vsp) + 4, obj_movingplatform, false, true)
	{
		plat_id = id
		if (other.bbox_bottom - other.vsp <= bbox_top)
		{
			hsp_plat = hsp
			vsp_plat = vsp
			ground_check = true
			other.vsp = 0
			other.y = bbox_top - bh
		}
	}
	
	var hsp_final = hsp + hsp_plat
	var vsp_final = vsp + vsp_plat
	
	var abs_final = abs(vsp_final);
	
	var i = 0
	
	while i < round(abs_final)
	{
		if (!scr_solid(x, y + (o_inc * sign(vsp_final))) && 
			!place_meeting(x, y + (o_inc * sign(vsp_final)), obj_slopeplatform) && 
			i <= round(abs_final) - o_inc)
		{
			y += o_inc * sign(vsp_final)
			i += o_inc
			continue;
		}
		else if scr_solid(x, y + sign(vsp_final))
		{
			vsp = 0
			break;
		}
		else
		{
			if abs_final
				y += sign(vsp_final)
			else
				y += vsp_final;
		}
		i++
	}
		
	abs_final = abs(hsp_final);
	
	i = 0
	var h = 4
	
	while i < round(abs_final)
	{
		if (!scr_solid(x + (o_inc * sign(hsp_final)), y) && 
			!place_meeting(x, y + h, obj_slope) && 
			!place_meeting(x, y + h, obj_slopeplatform) && 
			!place_meeting(x + (o_inc * sign(hsp_final)), y, obj_slopeplatform) &&
			i <= round(abs_final) - o_inc)
		{
			x += o_inc * sign(hsp_final)
			i += o_inc
			continue;
		}
		else if scr_solid(x + sign(hsp_final), y + 1) && scr_solid(x + sign(hsp_final), y - h)
		{
			hsp = 0
			break;
		}
		else
		{
			if abs_final
				x += sign(hsp_final)
			else
				x += hsp_final;
			
			if !scr_solid(x, y - h)
			{
				while scr_solid(x, y)
					y--;
			}
			else if !scr_solid(x, y + h)
			{
				while scr_solid(x, y - 1)
					y++;
			}
			if scr_solid(x, y + h + 1) && scr_solid(x - sign(hsp_final), y + 1)
			{
				while !scr_solid(x, y + 1) && !(plat_id != noone && bbox_bottom >= plat_id.bbox_top && old_y2 + bh < plat_id.bbox_top)
					y++
			}
		}
		i++;
	}
	
	if (vsp < 20)
		vsp += grav
	
	grounded = scr_solid(x, y + 1) || ground_check
}

function collide_init()
{
	hsp = 0
	vsp = 0
	grav = 0.5
	grounded = false
	old_x2 = x
	old_y2 = y
}

function scr_solid(_x, _y)
{
	var collided = false
	var master = id
	var do_parent_check = false
	var climbingladder = false
	if variable_instance_exists(master, "state")
	{
		if (master.state == states.ladder)
			climbingladder = true
	}
	for (var i = 0; i < instance_number(par_collision); i++) 
	{
		var _id = instance_find(par_collision, i)
		with instance_place(_x, _y, _id)
		{
			switch (object_index)
			{
				case obj_solid:
					collided = true
					continue;
				case obj_platform:
					if image_yscale >= 0 && master.bbox_bottom <= bbox_top && !climbingladder
						collided = true
					else if image_yscale <= 0 && master.bbox_top >= bbox_bottom && !climbingladder
						collided = true
					continue;
				case obj_sideplatform:
					if image_xscale >= 0 && master.bbox_left >= bbox_right
						collided = true
					else if image_xscale <= 0 && master.bbox_right <= bbox_left
						collided = true
					continue;
				case obj_slope:
					if (collide_slope(master, _x, _y))
						collided = true
					continue;
				case obj_slopeplatform:
					if (collide_slopeplatform(master, _x, _y) && !climbingladder)
						collided = true
					continue;
				default:
					do_parent_check = true
			}
			if do_parent_check
			{
				switch (object_get_parent(object_index))
				{
					case obj_solid:
					case obj_destroyable:
					case obj_metalblock:
					case obj_ratblock:
					case obj_rattumbleblock:
						collided = true
						continue;
					case obj_slope:
						if (collide_slope(master, _x, _y))
							collided = true
						continue;
				}
			}
		}
	}
	return collided;
}

function collide_slope(master, _x, _y)
{
	var side = 0
	var height = 0
	var slope_y = 0
	var slope = (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
	
	if image_xscale >= 0
	{
		side = _x + master.bbox_right - master.x
		slope_y = bbox_bottom - ((side - bbox_left) * slope)
	}
	else
	{
		side = _x + master.bbox_left - master.x
		slope_y = bbox_bottom + ((side - bbox_right) * slope);
	}
	
	if image_yscale >= 0
	{
		height = master.bbox_bottom - master.y
		return _y + height > slope_y;
	}
	else
	{
		height = master.y - master.bbox_top
		return _y - height < bbox_top + (bbox_bottom - slope_y);
	}
}

function collide_slopeplatform(master, _x, _y)
{
	var side = 0
	var height = 0
	var clamped_y = 0
	var slope_y = 0
	var slope = (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
	var check_1 = false
	var check_2 = false
	
	if image_xscale >= 0
	{
		side = _x + (master.bbox_right - master.x)
		slope_y = bbox_bottom - ((side - bbox_left) * slope)
	}
	else
	{
		side = _x + (master.bbox_left - master.x)
		slope_y = bbox_bottom + ((side - bbox_right) * slope);
	}
	
	if image_yscale >= 0
	{
		height = master.bbox_bottom - master.y
		clamped_y = clamp(_y + height, bbox_top, bbox_bottom)
		check_1 = clamped_y > clamp(slope_y, bbox_top, bbox_bottom)
	}
	else
	{
		height = master.y - master.bbox_top
		clamped_y = clamp(_y - height, bbox_top, bbox_bottom)
		check_1 = clamped_y < clamp(bbox_top + (bbox_bottom - slope_y), bbox_top, bbox_bottom)
	}
	
	
	if image_xscale >= 0
	{
		side = master.old_x2 + (master.bbox_right - master.x)
		slope_y = bbox_bottom - ((side - bbox_left) * slope)
	}
	else
	{
		side = master.old_x2 + (master.bbox_left - master.x)
		slope_y = bbox_bottom + ((side - bbox_right) * slope);
	}
	
	if image_yscale >= 0
	{
		if master.grounded
			clamped_y = clamp(master.old_y2 + height, bbox_top, bbox_bottom)
		else
			clamped_y = master.old_y2 + height
	
		check_2 = clamped_y <= clamp(slope_y + 1, bbox_top, bbox_bottom)
	}
	else
	{
		if master.grounded
			clamped_y = clamp(master.old_y2 - height, bbox_top, bbox_bottom)
		else
			clamped_y = master.old_y2 - height
	
		check_2 = clamped_y >= clamp(bbox_top + (bbox_bottom - (slope_y - 1)), bbox_top, bbox_bottom)
	}
	
	return check_1 && check_2
}

function scr_slope(_x, _y)
{
	var s_list = ds_list_create()
	instance_place_list(_x, _y, obj_slope, s_list, false)
	for (var i = 0; i < ds_list_size(s_list); i++) {
	    with (ds_list_find_value(s_list, i))
		{
			if collide_slope(other, _x, _y)
				return true;
		}
	}
	
	instance_place_list(_x, _y, obj_slopeplatform, s_list, false)
	for (var i = 0; i < ds_list_size(s_list); i++) {
	    with (ds_list_find_value(s_list, i))
		{
			if collide_slopeplatform(other, _x, _y)
				return true;
		}
	}
	
	ds_list_destroy(s_list)
	return false;
}

function do_slope_momentum(spd_up = 20) //note: touch this code up
{
	var go_down = false
	
	with (instance_place(x, y + 1, obj_slope))
	{
		if (collide_slope(other, other.x, other.y + 1) && other.xscale != sign(image_xscale))
			go_down = true
	}
	
	with (instance_place(x, y + 1, obj_slopeplatform))
	{
		if (collide_slopeplatform(other, other.x, other.y + 1) && other.xscale != sign(image_xscale))
			go_down = true
	}
	if (go_down)
		movespeed = approach(movespeed, spd_up, 0.1) 
}

function behind_collision(_x, _y, obj_type)
{
	var master = id
	
	for (var i = 0; i < instance_number(par_collision); i++) 
	{
		var _id = instance_find(par_collision, i)
		with (instance_place(_x, _y, _id))
		{
			if object_index == obj_type
			{
				if image_xscale >= 0 
					return master.bbox_left >= bbox_right;
				else
					return master.bbox_right <= bbox_left;
			}
		}
	}
}

function collide_simple() //no grounded, no optimization, no 
{
	var hsp_plat = 0
	var vsp_plat = 0
	
	old_x2 = x
	old_y2 = y
	
	/*
	var bh = bbox_bottom - y
	with (instance_place(x, y + 1 + other.vsp, obj_movingplatform))
	{
		if (other.bbox_bottom - other.vsp <= bbox_top)
		{
			hsp_plat = hsp
			vsp_plat = vsp
			other.vsp = 0
			other.grounded = true
			other.y = bbox_top - bh
		}
	} ill get back to these another day*/
	
	var hsp_final = hsp + hsp_plat
	var vsp_final = vsp + vsp_plat
	
	repeat round(abs(vsp_final))
	{
		if scr_solid(x, y + sign(vsp_final))
		{
			vsp = 0
			break
		}
		else
			y += sign(vsp_final)
	}
	
	var h = 4
	
	repeat round(abs(hsp_final))
	{
		if place_meeting(x + sign(hsp_final), y, obj_solid)
		{
			hsp = 0
			break;
		}
		else
		{
			x += sign(hsp_final)
			
			if !scr_solid(x, y - h)
			{
				while scr_solid(x, y)
					y--;
			}
			else if !scr_solid(x, y + h)
			{
				while scr_solid(x, y - 1)
					y++;
			}
			if scr_solid(x, y + h + 1) && scr_solid(x - sign(hsp_final), y + 1)
			{
				while !scr_solid(x, y + 1)
					y++
			}
		}
	}
	
	if (vsp < 20)
		vsp += grav
	
	grounded = scr_solid(x, y + 1)
}
