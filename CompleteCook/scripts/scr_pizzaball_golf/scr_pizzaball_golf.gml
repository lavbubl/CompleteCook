function scr_pizzaball_golf()
{
	sprite_index = spr_pizzaball_stun
	image_speed = 0.35
	var _i = 9
	if (!player.ispeppino)
		_i = 7
	x = (player.x + (23 * player.xscale))
	y = (player.y + 23)
	if (player.sprite_index == player.spr_golfswing && floor(player.image_index) == _i)
	{
		x = player.x
		y = player.y
		global.golfhit++
		scr_soundeffect(sfx_punch)
		if player.key_up
			scr_pizzaball_go_to_thrown((player.xscale * 15), -16, 0)
		else if player.key_down
			scr_pizzaball_go_to_thrown((player.xscale * 18), 5, 0)
		else
			scr_pizzaball_go_to_thrown((player.xscale * 17), -7, 0)
		if scr_solid(x, y)
		{
			x = player.x
			y = player.y
			while scr_solid(x, y)
				x += player.xscale
		}
	}
	exit;
}

