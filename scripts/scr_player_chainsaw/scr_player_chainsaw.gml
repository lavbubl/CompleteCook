function scr_player_chainsaw()
{
	hsp = 0
	vsp = 0
	x = (hitX + random_range(-4, 4))
	y = (hitY + random_range(-4, 4))
	hitLag--
	if key_jump
		input_buffer_jump = 0
	if key_slap2
		input_buffer_slap = 0
	image_speed = 0
	if key_slap2
		input_attack_buffer = 8
	if (hitLag <= 0)
	{
		x = hitX
		y = hitY
		movespeed = tauntstoredmovespeed
		sprite_index = tauntstoredsprite
		state = tauntstoredstate
		vsp = tauntstoredvsp
		if (global.attackstyle == 0)
		{
			if ((tauntstoredstate == states.handstandjump && (tauntstoredsprite == spr_player_suplexgrabjumpstart or tauntstoredsprite == spr_player_suplexgrabjump or tauntstoredsprite == spr_player_airattack or tauntstoredsprite == spr_player_airattackstart)) or sprite_index == spr_piledriverland)
			{
				jumpAnim = 1
				state = states.jump
				sprite_index = spr_suplexland
				vsp = -11
				jumpstop = 0
				image_index = 0
			}
			else if (tauntstoredstate == states.handstandjump or tauntstoredstate == states.finishingblow)
				state = states.normal
		}
		if (global.attackstyle == 1)
		{
			if ((tauntstoredstate == states.handstandjump && (tauntstoredsprite == spr_player_suplexgrabjumpstart or tauntstoredsprite == spr_player_suplexgrabjump or tauntstoredsprite == spr_player_airattack or tauntstoredsprite == spr_player_airattackstart)) or sprite_index == spr_piledriverland)
			{
				movespeed = 4
				state = states.tackle
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
				image_index = 0
				vsp = -5
			}
			else if (tauntstoredstate == states.handstandjump or tauntstoredstate == states.finishingblow)
			{
				movespeed = 4
				state = states.tackle
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
				image_index = 0
			}
		}
		if (global.attackstyle == 2)
		{
			if (tauntstoredstate == states.lungeattack)
				state = states.lungeattack
		}
	}
}
