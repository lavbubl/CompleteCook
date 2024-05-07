if (!trapped)
{
	if (comeback == 1)
	{
		other.brick = 1
		if (other.state != states.ratmountcrouch && other.state != states.backbreaker)
		{
			if (!other.grounded)
				other.sprite_index = spr_player_ratmountfall
			else
				other.sprite_index = spr_player_ratmountidle
		}
		instance_create(other.x, other.y, obj_genericpoofeffect)
		instance_destroy()
	}
}
else if (other.state == states.ratmountpunch && baddieID == -4)
{
	scr_soundeffect(sfx_punch)
	vsp = -6
	hsp = (other.xscale * 8)
	trapped = 0
	wait = 1
	comeback = 0
	alarm[0] = 30
}
