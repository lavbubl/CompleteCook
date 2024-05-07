function scr_hurtplayer(argument0)
{
	var _hurt = 0
	with (argument0)
	{
		if global.failcutscene
		{
		}
		else if (state == states.parry or state == states.debugstate or state == states.golf or state == states.slipbanan)
		{
		}
		else if (state == states.handstandjump && flash == 1)
		{
		}
		else if (state == states.backbreaker or state == states.chainsaw)
		{
		}
		else if global.kungfu
		{
			if (state == states.blockstance)
			{
				if (sprite_index != spr_player_airattackstart)
				{
					instance_create(x, y, obj_parryeffect)
					image_index = 0
				}
				sprite_index = spr_player_airattackstart
				hsp = ((-xscale) * 2)
			}
			else if (state != states.thrown && state != states.hit && (!hurted))
			{
				instance_create(x, y, obj_parryeffect)
				repeat (5)
				{
					with (create_debris(x, y, spr_slapstar))
						vsp = irandom_range(-6, -11)
				}
				hitLag = 3
				hitxscale = (x != other.x ? sign((other.x - x)) : (-other.image_xscale))
				state = states.hit
				hitstunned = 50
				hurted = 1
				alarm[7] = (hitstunned + 30)
				hithsp = 12
				hitvsp = -5
				hitX = x
				hitY = y
				sprite_index = spr_hurt
				if (global.hp > 1)
				{
					global.hp--
					with (obj_camera)
						healthshaketime = 60
				}
				else
				{
					with (obj_music)
						arena = 0
					global.kungfu = 0
					if (!instance_exists(obj_fadeout))
					{
						with (obj_player)
							targetRoom = lastroom
						instance_create(x, y, obj_fadeout)
					}
				}
			}
		}
		else if isgustavo
		{
			if (!hurted)
			{
				state = states.ratmounthurt
				movespeed = 6
				vsp = -9
				flash = 1
				scr_soundeffectpitched(sfx_pephurt, 0.9, 1.1)
				alarm[8] = 100
				hurted = 1
				instance_create(x, y, obj_spikehurteffect)
				_hurt = 1
			}
		}
		else if (state == states.shotgundash)
		{
		}
		else if ((state == states.knightpep or state == states.knightpepattack or state == states.knightpepslopes or state == states.knightpepbump) && cutscene == 0)
		{
		}
		else if (state == states.ghost)
		{
		}
		else if (state == states.ghostpossess)
		{
			if (instance_exists(possessID) && object_get_parent(possessID) == 407)
			{
				state = states.ghost
				with (obj_baddie)
				{
					if (is_controllable && state == states.ghostpossess && playerid == other.id)
						instance_destroy()
				}
			}
		}
		else if (state == states.slipnslide)
		{
		}
		else if (state == states.trickjump)
		{
		}
		else if (state == states.chainsawbump)
		{
		}
		else if (state == states.bombpep && hurted == 0)
		{
		}
		else if (state == states.rideweenie)
		{
		}
		else if (state == states.slipnslide)
		{
		}
		else if (state == states.boxxedpep)
		{
			hsp = ((-xscale) * 4)
			vsp = -5
			state = states.bump
			sprite_index = spr_bump
			alarm[5] = 2
			alarm[8] = 60
			alarm[7] = 120
			hurted = 1
		}
		else if (pizzashield == 1)
		{
			pizzashield = 0
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_pizzashield_collectible
			hsp = ((-xscale) * 4)
			vsp = -5
			state = states.bump
			sprite_index = spr_bump
			invhurt_buffer = 120
			alarm[8] = 60
			alarm[7] = 120
			hurted = 1
			scr_soundeffect(sfx_pephurt)
		}
		else if (state != states.hurt && state != states.ratmounthurt && state != states.grabbed && (hurted == 0 or state == states.cheesepep or state == states.cheesepepstickside or state == states.cheesepepstickup) && cutscene == 0)
		{
			if (state == states.mort or state == states.morthook or state == states.mortjump or state == states.mortattack)
			{
				with (instance_create(x, y, obj_mortflyaway))
					image_xscale = (-other.xscale)
			}
			if instance_exists(obj_hardmode)
				global.heatmeter_count = ((global.heatmeter_threshold - 1) * global.heatmeter_threshold_count)
			_hurt = 1
			if (character == "V")
				global.playerhealth -= 1
			if (state == states.barrel or state == states.barrelclimbwall or state == states.barreljump or state == states.barrelslide)
			{
				repeat (4)
					create_debris(x, y, spr_barreldebris)
			}
			if global.kungfu
			{
				if (global.hp > 1)
				{
					global.hp--
					with (obj_camera)
						healthshaketime = 60
				}
				else
				{
					with (obj_music)
						arena = 0
					global.kungfu = 0
					if (!instance_exists(obj_fadeout))
					{
						with (obj_player)
							targetRoom = lastroom
						instance_create(x, y, obj_fadeout)
					}
				}
			}
			if (state == states.grabbed)
			{
				if (object_index == obj_player1)
					y = obj_player2.y
				else
					y = obj_player1.y
			}
			scr_soundeffectpitched(sfx_pephurt, 0.9, 1.1)
			if (irandom(100) <= 50)
				scr_soundeffectpitched(choose(sfx_pepvoice7, sfx_pepvoice8), 0.9, 1.1)
			instance_create(x, y, obj_bangeffect)
			alarm[8] = 100
			alarm[7] = 50
			hurted = 1
			if (xscale == other.image_xscale)
				sprite_index = spr_hurtjump
			else
				sprite_index = spr_hurt
			movespeed = 8
			vsp = -14
			timeuntilhpback = 300
			instance_create(x, y, obj_spikehurteffect)
			state = states.hurt
			image_index = 0
			flash = 1
			repeat (5)
				instance_create(x, y, obj_hurtstars)
		}
		if _hurt
		{
			global.combotime -= 25
			global.style -= 25
			global.hurtcounter++
			global.player_damage++
			var loseamount = (50 * (global.stylethreshold + 1))
			if (!global.pizzadelivery)
			{
				with (instance_create(121, 60, obj_negativenumber))
					number = concat("-", loseamount)
				if (global.collect > loseamount)
					global.collect -= loseamount
				else
					global.collect = 0
				if (global.collect != 0)
				{
					if (character == "P" or character == "V")
					{
						repeat (10)
						{
							with (instance_create(x, y, obj_pizzaloss))
								sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
						}
					}
					else
					{
						repeat (10)
							instance_create(x, y, obj_pizzaloss)
					}
				}
			}
		}
	}
	exit;
}

