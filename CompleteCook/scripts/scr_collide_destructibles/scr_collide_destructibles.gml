function scr_collide_destructibles()
{
	for (var i = 0; i < 2; i++)
	{
		var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
		with (_obj_player)
		{
			if ((state == states.jump && sprite_index == spr_playerN_noisebombspinjump) or state == states.slipbanan or state == states.rideweenie or state == states.trickjump or state == states.ratmountbounce or (state == states.pogo && pogochargeactive == 1))
			{
				with (instance_place((x + xscale), y, obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
				with (instance_place(((x + hsp) + xscale), y, obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
				with (instance_place(x, ((y + vsp) + 1), obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
				with (instance_place(x, ((y + vsp) - 1), obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
				with (instance_place(x, (y + 1), obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
				with (instance_place(x, (y - 1), obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
			}
			if (state == states.tumble)
			{
				with (instance_place((x + xscale), y, obj_rollblock))
					instance_destroy()
			}
			if (state == states.mach3 && sprite_index == spr_player_fightball)
			{
				with (instance_place((x + xscale), y, obj_fightballblock))
					instance_destroy()
			}
			if (state == states.ratmountattack && place_meeting((x + hsp), y, obj_gustavodestroyable))
			{
				with (instance_place((x + hsp), y, obj_gustavodestroyable))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5)
					instance_destroy()
				}
			}
			if (state == states.trashroll or state == states.boxxedpepspin or ratmount_movespeed == 12 or state == states.ratmountpunch or state == states.ratmounttumble or state == states.punch or state == states.handstandjump or state == states.ratmountattack or state == states.lungeattack or state == states.cheeseball or state == states.bombpepside or state == states.rocket or state == states.shotgundash or state == states.faceplant or state == states.slipnslide or state == states.tacklecharge or sprite_index == spr_barrelroll or state == states.chainsawbump or state == states.mach3 or state == states.knightpep or state == states.machroll or state == states.knightpepslopes or state == states.knightpepattack or state == states.tumble or state == states.hookshot or state == states.shoulderbash)
			{
				if place_meeting((x + hsp), y, obj_destructibles)
				{
					with (instance_place((x + hsp), y, obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5)
						instance_destroy()
					}
					if (state == states.mach2)
						machpunchAnim = 1
				}
			}
			if (state == states.hurt && thrown == true)
			{
				if place_meeting((x - hsp), y, obj_destructibles)
				{
					with (instance_place((x - hsp), y, obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5)
						instance_destroy()
					}
				}
			}
			if ((state == states.knightpep or sprite_index == spr_lonegustavo_groundpoundstart or sprite_index == spr_lonegustavo_groundpound or state == states.jetpackjump or state == states.firemouth or state == states.slipbanan or state == states.superslam or state == states.hookshot or (state == states.bombpepup && bombup_dir == 1)) && vsp > 0)
			{
				if place_meeting(x, (y + 1), obj_destructibles)
				{
					with (instance_place(x, (y + 1), obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5)
						instance_destroy()
					}
					if (state == states.firemouth or state == states.jetpackjump)
					{
						with (instance_place(x, (y + 1), obj_tntblock))
						{
							GamepadSetVibration(0, 0.8, 0.8, 0.5)
							instance_destroy()
						}
						if (vsp > -11)
							vsp = -11
						jumpstop = 0
					}
				}
			}
			var num = instance_place_list(x, (y + 1), obj_destructibleplatform, global.instancelist, 0)
			for (var k = 0; k < num; k++)
			{
				with (ds_list_find_value(global.instancelist, k))
				{
					falling = 1
					if (falling == 1)
						image_speed = 0.35
				}
			}
			ds_list_clear(global.instancelist)
			if (vsp <= 0.5 && (state == states.jump or state == states.ratmountjump or state == states.mach3 or state == states.mach2 or state == states.antigrav or state == states.pogo or (state == states.bombpepup && bombup_dir == -1) or state == states.punch or state == states.climbwall or state == states.fireass or state == states.Sjump or state == states.cheeseballclimbwall or state == states.mach3 or (state == states.punch && (sprite_index == spr_player_breakdanceuppercut or sprite_index == spr_player_breakdanceuppercutend))))
			{
				var vy = -1
				if (state == states.punch && (sprite_index == spr_player_breakdanceuppercut or sprite_index == spr_player_breakdanceuppercutend))
					vy = vsp
				if place_meeting(x, (y + vy), obj_destructibles)
				{
					with (instance_place(x, (y + vy), obj_destructibles))
					{
						GamepadSetVibration(0, 0.6, 0.6, 0.5)
						instance_destroy()
						with (other)
						{
							if (state != states.Sjump && state != states.punch && state != states.climbwall)
								vsp = 0
							if (state == states.Sjump)
								vsp = -11
						}
					}
				}
			}
			if (vsp >= 0 && (state == states.freefall or state == states.superslam or state == states.freefallland or state == states.ratmountgroundpound or (state == states.slipbanan && vsp >= 10)))
			{
				if place_meeting(x, ((y + vsp) + 2), obj_destructibles)
				{
					with (instance_place(x, ((y + vsp) + 2), obj_destructibles))
					{
						with (_obj_player)
						{
							if place_meeting(x, ((y + vsp) + 2), obj_bigdestructibles)
							{
								var _inst = instance_place(x, ((y + vsp) + 2), obj_bigdestructibles)
								if instance_exists(_inst)
								{
									var j = 0
									var _max = 256
									while (!(place_meeting(x, ((y + vsp) + 1), obj_bigdestructibles)))
									{
										y += 1
										j++
										if (j >= _max)
											break
										else
											continue
									}
								}
							}
						}
						instance_destroy()
					}
				}
			}
			if (state == states.freefall or state == states.freefallland or state == states.slipbanan)
			{
				if (place_meeting(x, (y + 1), obj_metalblock) && (freefallsmash >= 10 or state == states.slipbanan))
				{
					with (instance_place(x, (y + 1), obj_metalblock))
						instance_destroy()
				}
			}
			if (state == states.crouchslide or state == states.machroll or state == states.mach2 or state == states.punch)
			{
				with (obj_destructibles)
				{
					if place_meeting((x - _obj_player.hsp), y, _obj_player)
					{
						var _destroyed = 0
						with (_obj_player)
						{
							if (place_meeting((x + hsp), y, obj_bigdestructibles) && state != states.crouchslide && state != states.mach2 && state != states.machroll)
							{
								state = states.finishingblow
								sprite_index = spr_player_lungehit
								image_index = 0
								instance_destroy(other)
								_destroyed = 1
							}
							else if (other.object_index != obj_bigdestructibles)
							{
								instance_destroy(other)
								_destroyed = 1
							}
							if (_destroyed && state == states.lungeattack)
								hit_connected = 1
						}
					}
				}
			}
		}
	}
}
