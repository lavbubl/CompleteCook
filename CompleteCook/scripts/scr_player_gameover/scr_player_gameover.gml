function scr_player_gameover()
{
	image_speed = 0.35
	cutscene = 1
	if (sprite_index == spr_deathstart)
	{
		vsp = 0
		hsp = 0
	}
	flash = 0
	alarm[0] = -1
	alarm[1] = -1
	alarm[3] = -1
	alarm[4] = -1
	alarm[5] = -1
	alarm[6] = -1
	alarm[7] = -1
	alarm[8] = -1
	alarm[9] = -1
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_deathstart)
	{
		alarm[10] = 5
		vsp = -10
		sprite_index = spr_deathend
	}
	hurted = 0
	inv_frames = 0
	if place_meeting((x + floor(hsp)), y, obj_null)
	{
		x = floor(x)
		while (!(place_meeting((x + sign(hsp)), y, obj_null)))
			x += sign(hsp)
		hsp = 0
	}
	x += hsp
	if place_meeting(x, (y + floor(vsp)), obj_null)
	{
		y = floor(y)
		while (!(place_meeting(x, (y + sign(vsp)), obj_null)))
			y += sign(vsp)
		vsp = 0
	}
	y += floor(vsp)
	if (vsp < 30)
		vsp += grav
	exit;
}

