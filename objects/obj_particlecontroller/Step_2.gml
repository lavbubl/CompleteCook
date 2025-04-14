var target = obj_player

for (var p = 0; p < array_length(particle_list); p++)
{
	var p_id = particle_list[p]
	with p_id
	{
		image_index += image_speed
		switch (type)
		{
			case particles.gib:
			case particles.stars:
			case particles.yellowstar:
				x += hsp
				y += vsp
				vsp += 0.5
				if y > room_height
					array_delete(other.particle_list, p, 1)
				break;
			case particles.hurtstar:
				var r_shake = random_range(-1, 1)
				x += (hsp * dir1) + r_shake
				y += (vsp * dir2) + r_shake
				hsp = approach(hsp, 0, 0.25)
				vsp = approach(vsp, 0, 0.25)
				if lifetime > 0
					lifetime--
				else
					array_delete(other.particle_list, p, 1)
				break;
			case particles.taunt:
				x = target.x
				y = target.y
				if anim_ended()
					image_speed = 0
				if (target.taunttimer < 1 || target.state != states.taunt)
					array_delete(other.particle_list, p, 1)
				break;
			case particles.sparks:
				x += hsp
				y += vsp
				if (x < 0 || x >= room_width || y < 0 || y >= room_height)
					array_delete(other.particle_list, p, 1)
				break;
			case particles.machcharge:
				x = target.x
				if target.sprite_index = spr_player_Sjumpcancel
					x += 10 * target.xscale
				y = target.y
				image_xscale = target.xscale
				if target.state != statetofollow
					array_delete(other.particle_list, p, 1)
				break;
			default:
				if anim_ended()
					array_delete(other.particle_list, p, 1)
				break;
		}
	}
}
