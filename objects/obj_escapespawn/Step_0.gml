switch state
{
	case 0:
		if (!global.panic)
		{
			visible = false
			instance_deactivate_object(baddieID)
			with (obj_baddiecollisionbox)
			{
				if (baddieID == other.baddieID)
					instance_destroy()
			}
		}
		else
			state = 1
		break
	case 1:
		var p = instance_nearest(x, y, obj_player)
		visible = false
		image_index = 0
		if distance_to_pos(x, y, p.x, p.y, 500, 100)
		{
			state = 2
			visible = true
		}
		break
	case 2:
		if (floor(image_index) > 5)
		{
			instance_activate_object(baddieID)
			with (baddieID)
			{
				x = other.x
				y = other.y
				state = states.stun
				sprite_index = stunfallspr
				stunned = 20
				boundbox = 0
				instance_create(x, y, obj_genericpoofeffect)
				scr_soundeffectpitched(sfx_escapespawn)
			}
			state = 3
		}
		break
	case 3:
		if (floor(image_index) == (image_number - 1))
			visible = false
		break
}

