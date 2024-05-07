function scr_scareenemy()
{
	var player = instance_nearest(x, y, obj_player)
	if (state != states.grabbed && state != states.stun && state != states.hit && state != states.secret)
	{
		if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ((player.xscale > 0 && x >= player.x) or (player.xscale < 0 && x <= player.x)))
		{
			if (sprite_index != scaredspr && state != states.stun && state != states.staggered && (player.state == states.chainsawbump or player.state == states.mach3 or player.state == states.rideweenie or player.state == states.rocket or player.state == states.tacklecharge or player.state == states.knightpepslopes or (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
			{
				state = states.idle
				sprite_index = scaredspr
				if (x != player.x)
					image_xscale = (-(sign((x - player.x))))
				scaredbuffer = 100
				if grounded
					vsp = -3
			}
		}
	}
	exit;
}

