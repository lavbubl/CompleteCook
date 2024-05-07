function scr_collide_player()
{
	grounded = false
	grinding = 0
	
	var vsp_final = (vsp + vsp_carry)
	vsp_carry = 0
	repeat abs(vsp_final)
	{
		if (!(scr_solid_player(x, (y + sign(vsp_final)))))
			y += sign(vsp_final)
		else
		{
			vsp = 0
			break
		}
	}
	
	var hsp_final = (hsp + hsp_carry)
	hsp_carry = 0
	repeat abs(hsp_final)
	{
		var k = 1
		if (k <= 4)
		{
			if (scr_solid_player((x + sign(hsp_final)), y) && (!(scr_solid_player((x + sign(hsp_final)), (y - k)))))
				y -= k
			if ((!(scr_solid_player((x + sign(hsp_final)), y))) && (!(scr_solid_player((x + sign(hsp_final)), (y + 1)))) && scr_solid_player((x + sign(hsp_final)), (y + (k + 1))))
				y += k
			for (k++; k <= 4; k++)
			{
				if (scr_solid_player((x + sign(hsp_final)), y) && (!(scr_solid_player((x + sign(hsp_final)), (y - k)))))
					y -= k
				if ((!(scr_solid_player((x + sign(hsp_final)), y))) && (!(scr_solid_player((x + sign(hsp_final)), (y + 1)))) && scr_solid_player((x + sign(hsp_final)), (y + (k + 1))))
					y += k
			}
		}
		
		if (!(scr_solid_player((x + sign(hsp_final)), y)))
			x += sign(hsp_final)
		else
		{
			hsp = 0
			break
		}
	}
	
	if (vsp < 20)
		vsp += grav
	if (platformid != noone)
	{
		if (vsp < -1 or (!instance_exists(platformid)) or (!(place_meeting(x, (y + 16), platformid))) or (!(place_meeting(x, (y + 32), platformid))))
		{
			platformid = noone
			y = floor(y)
		}
		else
		{
			grounded = true
			vsp = grav
			if (platformid.vsp > 0)
				vsp_carry = platformid.vsp
			y = (platformid.y - 46)
			if (!(place_meeting(x, (y + 1), platformid)))
				y++
			if (platformid.v_velocity != 0)
			{
				if scr_solid(x, y)
				{
					var i = 0
					while scr_solid(x, y)
					{
						y--
						if (i > 32)
							break
						else
						{
							i++
							continue
						}
					}
				}
				if scr_solid(x, y)
				{
					i = 0
					while scr_solid(x, y)
					{
						y++
						if (i > 64)
							break
						else
						{
							i++
							continue
						}
					}
				}
			}
		}
	}
	grounded |= scr_solid(x, (y + 1))
	grounded |= (vsp > 0 && (!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
	grinding = ((!(place_meeting(x, y, obj_grindrail))) && place_meeting(x, (y + 1), obj_grindrail))
	grounded |= grinding
	if (platformid != -4 or (place_meeting(x, (y + 1), obj_movingplatform) && (!(place_meeting(x, (y - 3), obj_movingplatform)))) or place_meeting(x, (y + 8), (101 && (!(place_meeting(x, (y + 6), obj_movingplatform))))))
		grounded = true
	if (grounded && platformid == -4)
		y = floor(y)
	exit;
}

