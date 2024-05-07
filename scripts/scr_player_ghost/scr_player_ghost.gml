function scr_player_ghost()
{
	visible = true
	image_speed = 0.35
	if (sprite_index != spr_ghostend)
	{
		move_h = (key_right + key_left)
		move_v = (key_down - key_up)
		var maxspeed = 6
		var hspaccel = 0.5
		var vspaccel = 0.5
		if (move_h == 0)
			hspaccel = 0.25
		if (move_v == 0)
			vspaccel = 0.25
		if key_attack
		{
			sprite_index = spr_ghostdash
			maxspeed = 10
			hspaccel = 0.65
			vspaccel = 0.65
		}
		hsp = Approach(hsp, (move_h * maxspeed), hspaccel)
		vsp = Approach(vsp, (move_v * maxspeed), vspaccel)
		if (hsp != 0)
			xscale = sign(hsp)
		if (!key_attack)
		{
			if (move_v < 0)
				sprite_index = spr_ghostjump
			else
				sprite_index = spr_ghostidle
		}
		if (place_meeting(x, y, obj_tombstone) && sprite_index != spr_ghostend)
		{
			sprite_index = spr_ghostend
			image_index = 0
			image_alpha = 1
			vsp = 10
			hsp = 0
			grav = 0.5
			movespeed = 0
			with (instance_place(x, y, obj_tombstone))
			{
				other.x = x
				other.y = y
			}
		}
	}
	if (sprite_index == spr_ghostend && floor(image_index) == (image_number - 1))
		state = states.normal
	if place_meeting(x, y, obj_ghosttransparency)
		image_alpha = 0.5
	else
		image_alpha = 1
}

function scr_player_ghostpossess()
{
	visible = false
	hsp = 0
	if (!instance_exists(possessID))
	{
		visible = true
		state = states.ghost
		sprite_index = spr_ghostidle
	}
}

