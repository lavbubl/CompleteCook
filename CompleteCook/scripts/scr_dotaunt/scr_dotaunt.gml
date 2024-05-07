function scr_dotaunt()
{
	if ((key_taunt2 or input_finisher_buffer > 0 or (state == states.backbreaker && key_up && supercharged)) && !skateboarding)
	{
		input_finisher_buffer = 0
		if ((!key_up or !supercharged) && global.tauntcount < 10 && place_meeting(x, y, obj_exitgate) && (global.panic == true or instance_exists(obj_wartimer)) && global.combotime > 0)
		{
			global.tauntcount++
			global.collect += 25
			with (instance_create(x + 16, y, obj_smallnumber))
				number = "25"
			create_collect(x, y, spr_taunteffect)
			scr_soundeffect(sfx_collecttopping)
		}
		if (!finisher)
		{
			scr_soundeffectpitched(sfx_taunt, 0.97, 1.03)
			if (state != states.backbreaker && sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4)
			{
				tauntstoredmovespeed = movespeed
				tauntstoredvsp = vsp + grav
				tauntstoredsprite = sprite_index
				tauntstoredstate = state
			}
			state = states.backbreaker
			if (supercharged && key_up)
			{
				image_index = 0
				sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
			}
			else
			{
				taunttimer = 20
				sprite_index = spr_taunt
				image_index = random_range(0, 11)
			}
			with (instance_create(x, y, obj_taunteffect))
				player = other.id
		}
	}
}
