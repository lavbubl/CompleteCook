function scr_monster_collide()
{
	repeat abs(vsp)
	{
		if (!(scr_monster_solid(x, (y + sign(vsp)))))
			y += sign(vsp)
		else
		{
			vsp = 0
			break
		}
	}
	
	repeat abs(hsp)
	{
		var k = 1
		if (k <= 4)
		{
			if (scr_monster_solid((x + sign(hsp)), y) && (!(scr_monster_solid((x + sign(hsp)), (y - k)))))
				y -= k
			if ((!(scr_monster_solid((x + sign(hsp)), y))) && (!(scr_monster_solid((x + sign(hsp)), (y + 1)))) && scr_monster_solid((x + sign(hsp)), (y + (k + 1))))
				y += k
			for (k++; k <= 4; k++)
			{
				if (scr_monster_solid((x + sign(hsp)), y) && (!(scr_monster_solid((x + sign(hsp)), (y - k)))))
					y -= k
				if ((!(scr_monster_solid((x + sign(hsp)), y))) && (!(scr_monster_solid((x + sign(hsp)), (y + 1)))) && scr_monster_solid((x + sign(hsp)), (y + (k + 1))))
					y += k
			}
		}
		if (!(scr_monster_solid((x + sign(hsp)), y)))
			x += sign(hsp)
		else
		{
			hsp = 0
			break
		}
	}
	
	if (grav > 0)
	{
		if (vsp < 20)
			vsp += grav
	}
	else if (vsp > -20)
		vsp += grav
	grounded = scr_monster_solid(x, (y + 1))
}

function scr_monster_solid(argument0, argument1)
{
	var old_x = x
	var old_y = y
	x = argument0
	y = argument1
	if place_meeting(x, y, obj_monstersolid)
	{
		x = old_x
		y = old_y
		return true;
	}
	if check_slope(obj_monsterslope)
	{
		x = old_x
		y = old_y
		return true;
	}
	x = old_x
	y = old_y
	return false;
}

