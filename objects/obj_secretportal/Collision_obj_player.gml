if (active && sprite_index != spr_secretportal_open && (!instance_exists(obj_jumpscare)) && ds_list_find_index(global.saveroom, id) == -1)
{
	if (sprite_index != spr_secretportal_close)
	{
		sprite_index = spr_secretportal_close
		image_index = 0
	}
	if (!touched)
	{
		obj_camera.lock = true
		scr_soundeffect(sfx_secretenter)
		if (!obj_music.secret)
		{
			obj_music.secret = 1
			obj_music.secretend = 0
		}
		else
		{
			obj_music.secretend = 1
			obj_music.secret = 0
		}
	}
	playerid = other.id
	other.x = x;
	other.y = y - 30;
	other.vsp = 0;
	other.hsp = 0;
	other.cutscene = true;
	if !touched
	{
		other.superchargedeffectid = -4;
		if other.state != states.knightpep && other.state != states.knightpepslopes && other.state != states.knightpepbump && other.state != states.firemouth
		{
			if !other.isgustavo
				other.sprite_index = other.spr_hurt;
			else
				other.sprite_index = spr_player_ratmounthurt;
			other.image_speed = 0.35;
		}
		if other.state == states.knightpepslopes
		{
			other.sprite_index = other.spr_knightpepfall;
			other.state = states.knightpep;
			other.hsp = 0;
			other.vsp = 0;
		}
		other.tauntstoredstate = other.state;
		other.tauntstoredmovespeed = other.movespeed;
		other.tauntstoredhsp = other.hsp;
		other.tauntstoredvsp = other.vsp;
		other.tauntstoredsprite = other.sprite_index;
		other.state = states.secretenter;
	}
	touched = 1
	with (obj_heatafterimage)
		visible = false
}
