switch state
{
	case states.normal:
		sprite_index = spr_kingghost
		var dir = point_direction(x, y, obj_player1.x, obj_player1.y)
		x = lerp(x, (obj_player1.x - (100 * obj_player1.xscale)), 0.05)
		y = lerp(y, (obj_player1.y - 100), 0.05)
		if (x != obj_player1.x)
			image_xscale = (-(sign((x - obj_player1.x))))
		break
	
	case states.transitioncutscene:
		sprite_index = spr_kingghost_dash
		if ((!instance_exists(trapid)) or (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap))
			state = states.normal
		if instance_exists(trapid)
		{
			var xto = (trapid.x + trapid.xoffset)
			var yto = (trapid.y + trapid.yoffset)
			dir = point_direction(x, y, xto, yto)
			x = Approach(x, xto, abs(lengthdir_x(32, dir)))
			y = Approach(y, yto, abs(lengthdir_y(32, dir)))
			if (x == xto && y == yto)
				state = states.chase
		}
		break
	
	case states.chase:
		if ((!instance_exists(trapid)) or (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap && (trapid.object_index != obj_pinballtrap or trapid.sprite_index != spr_kingghost_pinball3)))
		{
			state = states.normal
			with (trapid)
			{
				switch object_index
				{
					case obj_anchortrap:
						sprite_index = spr_kingghost_anchor
						break
					case obj_knighttrap:
						sprite_index = spr_kingghost_spike
						break
					case obj_tvtrap:
						sprite_index = spr_kingghost_tv
						break
					case obj_pinballtrap:
						sprite_index = spr_kingghost_pinball
						break
				}
			}
			break
		}
		else
		{
			with (trapid)
			{
				switch object_index
				{
					case obj_anchortrap:
						sprite_index = spr_kingghost_anchor2
						if (state != states.fall && state != states.jump && obj_player1.x > (x - 100) && obj_player1.x < (x + 100) && obj_player1.y > y && obj_player1.y < (y + 500))
						{
							state = states.fall
							vsp = 10
						}
						break
					
					case obj_knighttrap:
						if (cooldown == 0 && state != states.punch && obj_player1.x > (x - 200) && obj_player1.x < (x + 200) && obj_player1.y > (y - 100) && obj_player1.y < (y + 100))
						{
							state = states.punch
							sprite_index = spr_kingghost_spike3
							image_index = 0
							attackbuffer = 30
							cooldown = 50
						}
						if (state == states.normal)
							sprite_index = spr_kingghost_spike2
						break
					
					case obj_tvtrap:
						sprite_index = spr_kingghost_tv2
						break
					
					case obj_pinballtrap:
						if (sprite_index != spr_kingghost_pinball3)
							sprite_index = spr_kingghost_pinball2
						break
				}
			}
			break
		}
}

visible = state != states.chase
if (room == rank_room)
	instance_destroy()
