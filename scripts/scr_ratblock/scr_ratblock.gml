function scr_ratblock_destroy()
{
	with (obj_player)
	{
		if ((other.sprite_index == spr_rattumbleblock or other.sprite_index == spr_rattumbleblock_big) && sprite_index == spr_tumble && (place_meeting((x + 1), y, other) or place_meeting((x - 1), y, other)))
			instance_destroy(other)
		if (state != states.mort && state != states.bombgrab && ((!scr_transformationcheck()) or state == states.barrel) && (place_meeting((x + 1), y, other) or place_meeting((x - 1), y, other) or place_meeting(x, (y + 1), other) or place_meeting(x, (y - 1), other)))
		{
			switch state
			{
				case states.barrel:
					if (!(place_meeting(x, (y - 12), other)))
						instance_destroy(other)
					break
				case states.bombpep:
					if (sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro)
					{
						instance_create(x, y, obj_bombexplosion)
						instance_destroy(other)
						GamepadSetVibration(0, 1, 1, 0.9)
						hurted = 1
						vsp = -4
						image_index = 0
						sprite_index = spr_bombpepend
						state = states.bombpep
						bombpeptimer = 0
					}
					break
				case states.gotoplayer:
				case states.tube:
				case states.actor:
				case states.boxxedpep:
				case states.boxxedpepspin:
				case states.boxxedpepjump:
				case states.knightpep:
				case states.knightpepbump:
					break
				case states.tumble:
					if (other.sprite_index == spr_rattumbleblock or other.sprite_index == spr_rattumbleblock_big)
						instance_destroy(other)
					break
				default:
					if (other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big)
						instance_destroy(other)
			}

		}
	}
}
