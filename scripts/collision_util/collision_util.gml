function collide()
{
	grounded = false
	
	var old_x = x
	var old_y = y
	
	var hsp_plat = 0
	var vsp_plat = 0
	
	if (vsp < 20)
		vsp += grav
	
	old_x2 = x
	old_y2 = y
		
	var h = bbox_bottom - y
	with (instance_place(x, y + 1 + other.vsp, obj_movingplatform))
	{
		if (other.bbox_bottom - other.vsp <= bbox_top)
		{
			hsp_plat = hsp
			vsp_plat = vsp
			other.vsp = 0
			other.grounded = true
			other.y = bbox_top - h
		}
	}
	
	var hsp_final = hsp + hsp_plat
	var vsp_final = vsp + vsp_plat
	
	repeat (abs(round(vsp_final)))
	{
		old_y = y
		y += sign(vsp_final)
		if (scr_solid(x, y))
		{
			y = old_y
			vsp = 0
			vsp_final = 0
		}
	}
		
	repeat (abs(round(hsp_final)))
	{
		old_x = x
		x += sign(hsp_final)
		
		var h = 4
    
		if (!scr_solid(x, y - h))
		{
			while (scr_solid(x, y))
			{
				y--
			}
		}
		if (scr_solid(x, y + h + 1) && scr_solid(x - sign(hsp_final), y + 1))
		{
			while (!scr_solid(x, y + 1))
			{
				y++
			}
		}
		
		if (scr_solid(x, y))
		{
			x = old_x
			hsp = 0
			hsp_final = 0
		}
	}
	
	old_x2 = x
	old_y2 = y
	
	if !grounded
		grounded = scr_solid(x, y + 1)
}

function init_collide()
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
	
	if (place_meeting(_x, _y, obj_solid))
		collided = true
	
	with (instance_place(_x, _y, obj_platform))
	{
		if (other.bbox_bottom <= bbox_top + 1 && (other.y - other.old_y2) >= 0)
			collided = true
	}
	
	if scr_slope(_x, _y)
		collided = true
	
	return collided;
}

function collide_slope(player, _x, _y)
{
	var side = 0
	var height = player.bbox_bottom - player.y
	var slope_y = 0
	var slope = (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
	if (image_xscale > 0)
	{
		side = _x + (player.bbox_right - player.x)
		slope_y = bbox_bottom - ((side - bbox_left) * slope)
	}
	else
	{
		side = _x + (player.bbox_left - player.x)
		slope_y = bbox_bottom + ((side - bbox_right) * slope);
	}
	return _y + height > slope_y;
}

function collide_slopeplatform(player, _x, _y)
{
	var side = 0
	var height = player.bbox_bottom - player.y
	var slope_y = 0
	var slope = (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
	var check_1 = false
	var check_2 = false
	if (image_xscale > 0)
	{
		side = _x + (player.bbox_right - player.x)
		slope_y = bbox_bottom - ((side - bbox_left) * slope)
	}
	else
	{
		side = _x + (player.bbox_left - player.x)
		slope_y = bbox_bottom + ((side - bbox_right) * slope);
	}
	check_1 = _y + height > slope_y
	
	if (image_xscale > 0)
	{
		side = player.old_x2 + (player.bbox_right - player.x)
		slope_y = bbox_bottom - ((side - bbox_left) * slope)
	}
	else
	{
		side = player.old_x2 + (player.bbox_left - player.x)
		slope_y = bbox_bottom + ((side - bbox_right) * slope);
	}
	check_2 = player.old_y2 + height <= max(slope_y, bbox_top)
	
	return check_1 && check_2
}

function scr_slope(_x, _y)
{
	with (instance_place(_x, _y, obj_slope))
	{
		if (collide_slope(other, _x, _y))
			return true;
	}
	
	with (instance_place(_x, _y, obj_slopeplatform))
	{
		if (collide_slopeplatform(other, _x, _y))
			return true;
	}
}

function do_slope_momentum(spd_up = 20)
{
	var go_down = false
	with (instance_place(x, y + 1, obj_slope))
	{
		if (collide_slope(other, other.x, other.y + 1) && other.xscale != sign(image_xscale))
			go_down = true
	}
	
	with (instance_place(x, y, obj_slopeplatform))
	{
		if (collide_slopeplatform(other, other.x, other.y + 1) && other.xscale != sign(image_xscale))
			go_down = true
	}
	if (go_down)
		movespeed = approach(movespeed, spd_up, 0.1)
}
