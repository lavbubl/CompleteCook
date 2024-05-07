if (state == states.transitioncutscene)
	exit;
if (state == states.victory)
	exit;
if (obj_player.state != states.playersuperattack)
{
	round_timer--
	if (round_timer <= 0)
	{
		instance_destroy(obj_baddiespawner)
		instance_destroy(obj_noisey)
		if (endroundfunc != -4)
			endroundfunc()
		if (round_count < round_max)
		{
			round_count++
			minutes = maxminutes
			seconds = maxseconds
			state = states.arenaround
			timer_buffer = timer_max
			bell_sprite = 1436
			bell_index = 0
			bell_buffer = 70
			with (par_boss)
			{
				phase++
				phase = clamp(phase, 0, max_phase)
				if (colliding && state != states.boss_cardboard && state != states.boss_cardboardend)
					state = states.arenaround
			}
		}
		else if instance_exists(bossID)
		{
			var b_hp = ((bossID.hp / bossID.max_hp) * 100)
			var p_hp = ((player_hp / player_hpmax) * 100)
			if (b_hp <= p_hp)
			{
				depth = (obj_player1.depth + 1)
				state = states.transitioncutscene
				with (bossID)
				{
					with (lastplayerid)
					{
						xscale = 1
						suplexmove = 1
						sfx_gain(suplexdashsnd)
						state = states.handstandjump
						movespeed = 10
						image_index = random_range(0, (image_number - 1))
						sprite_index = spr_player_groundedattack
					}
					hp = 0
					boss_destroy(lastplayerid)
				}
			}
			else
			{
				with (bossID)
				{
					sprite_index = defeatplayerspr
					fakedeath = 0
				}
				fakedeath = 0
				player_hp = 0
			}
		}
	}
}
if (state != states.arenaround && state != states.victory && state != states.transitioncutscene)
	alarm[0] = 1
