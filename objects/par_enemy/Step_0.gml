if (ds_list_find_index(global.ds_dead_enemies, id) != -1)
{
	instance_destroy()
	exit;
}

struct_foreach(state_struct, function(_name, _data)
{
	var func_todo = _data.func
	
	if (self.state == _data.state)
	{
		with (self)
			func_todo()
	}
})

do_scared()

grav = 0.5
if (state == e_states.hit)
	grav = 0

collide()

if (place_meeting(x, y, obj_player))
{
	if (obj_player.instakill && alarm[0] == -1 && !follow_player)
	{
		with (obj_player)
		{
			if (state == states.mach3)
				reset_anim(spr_player_mach3kill)
			if (key_jump.down && state != states.groundpound)
			{
				vsp = -12
				jumpstop = false
			}
		}
		
		sprite_index = sprs.dead
		
		do_enemygibs()
		shake_camera()
		
		alarm[0] = 1
	}
	if ((obj_player.state == states.mach2 || obj_player.state == states.tumble) && stun_timer < 160)
	{
		sleep(50)
		hsp = obj_player.xscale * 18
		xscale = -obj_player.xscale
		warp = 0.5
		state = e_states.stun
		stun_timer = 180
		vsp = -5
		repeat (4)
			particle_create(x, y, particles.stars)
		flash = 8
		global.combo.timer = 60
	}
	with (obj_player)
	{
		if (state == states.grab && other.sprite_index != other.sprs.dead)
		{
			other.follow_player = true
			reset_anim(spr_player_holdrise)
			state = states.hold
			if (key_up.down)
			{
				state = states.piledriver
				sprite_index = spr_player_piledriver
				vsp = -18
			}
		}
	}
}

if blur_timer > 0
	blur_timer--
else if state == e_states.hit
{
	afterimage_create(after_images.blur)
	blur_timer = 2
}

if (obj_player.state == states.taunt)
{
	scared_timer = 0
	stun_timer = 0
}

if warp > 0
	warp -= 0.05

if flash > 0
	flash--

var en_list = ds_list_create()
instance_place_list(x, y, par_enemy, en_list, false)

for (var i = 0; i < ds_list_size(en_list); i++) {
    var _id = ds_list_find_value(en_list, i)
	if (place_meeting(x, y, _id) && _id.state == e_states.hit)
	{
		instance_destroy()
		do_enemygibs()
	}
}
