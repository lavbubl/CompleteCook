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

collide()

if (place_meeting(x, y, obj_player))
{
	if (obj_player.state == states.mach3 && alarm[0] == -1)
	{
		with (obj_player)
			reset_anim(spr_player_mach3kill)
		
		sprite_index = sprs.dead
		
		particle_create(x, y, particles.genericpoof)
		particle_create(x, y, particles.parry)
		repeat (8)
			particle_create(x, y, particles.gib)
		
		shake_camera()
		
		alarm[0] = 1
	}
	if (obj_player.state == states.grab)
	{
		follow_player = true
		with (obj_player)
		{
			reset_anim(spr_player_holdrise)
			state = states.hold
		}
	}
}
