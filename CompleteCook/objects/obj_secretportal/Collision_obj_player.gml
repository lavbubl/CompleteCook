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
		scr_soundeffect(sfx_box)
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
	touched = 1
	playerid = other.id
	switch other.state
	{
		case states.knightpep:
		case states.knightpepattack:
		case states.knightpepbump:
		case states.knightpepslopes:
			other.sprite_index = other.spr_knightpep_fall
			break;
		case states.firemouth:
			other.sprite_index = spr_player_firemouthspin
			break;
		default:
			other.sprite_index = other.spr_hurt
			break;
	}
	other.state = states.actor
	other.vsp = 0
	other.hsp = 0
	with (obj_heatafterimage)
		visible = false
}
