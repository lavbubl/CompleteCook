function scr_collide()
{
	grounded = false
	with (instance_place(x, (y + 2), obj_movingplatform))
	{
		with (other)
		{
			if (!(place_meeting(x, (y - (3 + abs(other.v_velocity))), other)))
			{
				platformid = other.id
				hsp_carry = other.hsp
				if (abs(other.vsp) > 2)
					vsp_carry = other.vsp
			}
		}
	}
	
	var vsp_final = (vsp + vsp_carry)
	vsp_carry = 0
	repeat abs(vsp_final)
	{
		if (!(scr_solid(x, (y + sign(vsp_final)))))
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
			if (scr_solid((x + sign(hsp_final)), y) && (!(scr_solid((x + sign(hsp_final)), (y - k)))))
				y -= k
			if ((!(scr_solid((x + sign(hsp_final)), y))) && (!(scr_solid((x + sign(hsp_final)), (y + 1)))) && scr_solid((x + sign(hsp_final)), (y + (k + 1))))
				y += k
			for (k++; k <= 4; k++)
			{
				if (scr_solid((x + sign(hsp_final)), y) && (!(scr_solid((x + sign(hsp_final)), (y - k)))))
					y -= k
				if ((!(scr_solid((x + sign(hsp_final)), y))) && (!(scr_solid((x + sign(hsp_final)), (y + 1)))) && scr_solid((x + sign(hsp_final)), (y + (k + 1))))
					y += k
			}
		}
		
		if (!(scr_solid((x + sign(hsp_final)), y)))
			x += sign(hsp_final)
		else
		{
			hsp = 0
			break
		}
	}
	if (vsp < 10)
		vsp += grav
	if (platformid != noone)
	{
		if (vsp < 0 or (!instance_exists(platformid)) or (!(place_meeting(x, ((y + 12) + (abs(platformid.v_velocity) * 2)), platformid))))
		{
			platformid = noone
			y = floor(y)
		}
		else
		{
			grounded = true
			vsp = grav
			if (platformid.vsp > 0)
				vsp = abs(platformid.v_velocity)
			y = (platformid.y - 46)
			if (!(place_meeting(x, (y + 1), platformid)))
			{
				var i = 0
				while (!(place_meeting(x, (y + 1), platformid)))
				{
					y++
					if (i > abs(sprite_height))
						break
					else
						continue
				}
			}
			if (platformid.v_velocity != 0)
			{
				if scr_solid(x, y)
				{
					i = 0
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
	grounded |= ((!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
	if (platformid != -4 or (place_meeting(x, (y + 1), obj_movingplatform) && (!(place_meeting(x, (y - 2), obj_movingplatform)))))
		grounded = true
}
