event_inherited()
attack_pool[0] = [states.handstandjump, states.jump]
attack_pool[1] = [states.skateboard, states.boss_skateboardturn]
attack_pool[2] = [states.handstandjump, states.throwing, states.boss_bombkick]
attack_pool[3] = [states.pogo, states.boss_bombpogo]
attack_pool[4] = [states.boss_jetpackstart, states.boss_jetpackcancel, states.boss_jetpackspin]
attack_pool[5] = [states.handstandjump, states.jump, states.skateboard, states.boss_skateboardturn, states.throwing, states.boss_bombkick, states.pogo, states.boss_bombpogo, states.boss_jetpackstart, states.boss_jetpackcancel, states.boss_jetpackspin]
attack_pool[6] = [states.handstandjump, states.jump, states.skateboard, states.boss_skateboardturn]
attack_pool[7] = [states.handstandjump, states.throwing, states.boss_bombkick, states.pogo, states.boss_bombpogo]
attack_pool[8] = [states.boss_jetpackstart, states.boss_jetpackcancel, states.boss_jetpackspin]
attack_type[states.handstandjump] = [states.revolver, states.revolver]
attack_type[states.jump] = [states.boots, states.revolver]
attack_type[states.skateboard] = [states.dynamite, states.dynamite]
attack_type[states.boss_skateboardturn] = [states.boots, states.boots]
attack_type[states.throwing] = [states.boots, states.boots]
attack_type[states.boss_bombkick] = [states.dynamite, states.dynamite]
attack_type[states.pogo] = [states.boots, states.boots]
attack_type[states.boss_bombpogo] = [states.boots, states.boots]
attack_type[states.boss_jetpackstart] = [states.boots, states.boots]
attack_type[states.boss_jetpackcancel] = [states.boots, states.boots]
attack_type[states.boss_jetpackspin] = [states.revolver, states.revolver]
current_behaviour = states.normal
current_attack = states.handstandjump
state = states.arenaround
ds_map_set(player_hurtstates, states.handstandjump, 30000)
ds_map_set(player_hurtstates, states.chainsawbump, 50)
ds_map_set(player_hurtstates, states.mach2, 20)
ds_map_set(player_hurtstates, states.mach3, 30)
ds_map_set(boss_hurtstates, states.punch, 30)
ds_map_set(boss_hurtstates, states.handstandjump, 30)
ds_map_set(boss_hurtstates, states.crouchslide, 30)
ds_map_set(boss_hurtstates, states.skateboard, 60)
ds_map_set(boss_hurtstates, states.pogo, 30)
ds_map_set(boss_hurtstates, states.boss_jetpack, 80)
ds_map_set(boss_hurtstates, states.boss_jetpackspin, 80)
phase = 1
max_phase = 9
max_hp = (500 * max_phase)
hp = max_hp
stunfallspr = spr_playerN_hurt
walkspr = spr_playerN_move
idlespr = spr_playerN_idle
spr_dead = spr_playerN_hurt
tauntspr = spr_playerN_taunt
fallspr = spr_playerN_fall
bumpspr = spr_playerN_bump
parryspr = spr_playerN_spin
defeatplayerspr = spr_playerN_spin
movespeed = 0
move = 0
normal_spd = 6
changeside_spd = 10
slide = 0
slidejump = 0
skateboard_turns = 0
bombkick = 0
bombpogo = 0
pogochargeactive = 0
pogospeedprev = 0
pogomach = 0
pogospeed = 0
jetpackcancel = 0
fakedeath = 1
angry = 1
spin_count = 0
slideskateboard = 0
spinskateboard = 0
bombcount = 0
jumpcount = 0
pogo_buffer = 0
pogo_max = 240
pogo_random = 4
spin_buffer = 0
spin_max = 18
chooseparry_max[0] = 480
chooseparry_max[1] = 420
chooseparry_max[2] = 360
chooseparry_max[3] = 300
chooseparry_max[4] = 300
chooseparry_max[5] = 300
chooseparry_max[6] = 300
chooseparry_max[7] = 300
chooseparry_max[8] = 300
chooseparry_random = 4
chooseparry_buffer = chooseparry_max[(phase - 1)]
taunt_buffer = 0
taunt_max = 25
attack_max[0] = 25
attack_max[1] = 25
attack_max[2] = 25
attack_max[3] = 25
attack_max[4] = 25
attack_max[5] = 25
attack_max[6] = 25
attack_max[7] = 25
attack_max[8] = 25
attack_cooldown = attack_max[0]
dashcloudid = -4
targetstunned = 0
targetstunnedminus[0] = 30
targetstunnedminus[1] = 30
targetstunnedminus[2] = 30
targetstunnedminus[3] = 30
targetstunnedminus[4] = 30
targetstunnedminus[5] = 30
targetstunnedminus[6] = 30
targetstunnedminus[7] = 30
targetstunnedminus[8] = 30
function boss_destroy(argument0)
{
	SUPER_boss_destroy(argument0)
	targetstunned = 1000
	stunned = 1000
	if fakedeath
	{
		angry = 1
		fakedeath = 0
		destroyable = 0
		with (obj_bosscontroller)
		{
			alarm[1] = (room_speed * 4)
			fakedeath = 1
			state = states.transitioncutscene
			depth = (other.depth + 1)
		}
	}
	else
	{
		global.noisecutscene2 = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "noise2", 1)
	}
	exit;
}

function boss_hurt(argument0, argument1)
{
	if (targetstunned > 0)
	{
		targetstunned -= targetstunnedminus[(phase - 1)]
		attack_cooldown = 0
		boss_noise_decide_attack()
		if (targetstunned < 0)
			targetstunned = 1
	}
	else
		targetstunned = 150
	var ps = state
	SUPER_boss_hurt(argument0, argument1)
	if (ps == states.pogo)
		movespeed = 0
	targetxscale = (-argument1.xscale)
	exit;
}

function boss_hurt_noplayer(argument0)
{
	if (targetstunned > 0)
	{
		targetstunned -= targetstunnedminus[(phase - 1)]
		attack_cooldown = 0
		if (targetstunned < 0)
			targetstunned = 1
	}
	else
		targetstunned = 150
	SUPER_boss_hurt_noplayer(argument0)
	exit;
}

function player_hurt(argument0, argument1)
{
	if ((!argument1.inv_frames) && (argument1.state != states.backbreaker or argument1.parry_inst == -4))
	{
		hitstate = state
		hithsp = hsp
		hitvsp = vsp
		SUPER_player_hurt(argument0, argument1)
		with (argument1)
		{
			inv_frames = 1
			alarm[1] = 15
		}
		if (hitstate == states.skateboard or hitstate == states.boss_jetpack)
		{
			stunned = (hitstate == states.skateboard ? 30 : 70)
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
			hitstate = states.stun
			movespeed = 0
			hitvsp = -4
			hithsp = ((-image_xscale) * 8)
		}
	}
	exit;
}

