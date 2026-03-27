if escape_frozen
{
	visible = false
	
	if (abs(obj_player.x - self.x) <= 500 && abs(obj_player.y - self.y) <= 100 && alarm[1] == -1 && global.panic.active)
	{
		with create_effect(x, y - 20, spr_pillarenemyspawner)
			image_speed = 0.5
		alarm[1] = 16
	}
	
	exit;
}

do_enemy_generics()

var near_the_player = (abs(obj_player.x - self.x) <= 400 && abs(obj_player.y - self.y) <= 60)

if (cooldown <= 0 && near_the_player && state == states.normal)
{
	xscale = x - obj_player.x >= 0 ? -1 : 1
	hsp = 0
	state = states.punch
	cooldown = 100
	reset_anim(sprs.punchstart)
}
else
	cooldown--
	
if state == states.punch {
	if (sprite_index == sprs.punchstart)
	{
		image_speed = 0.35
		hsp = approach(hsp, 0, 1)
		if (floor(image_index) == (image_number - 1))
		{
			punchspd = 8
			hsp = punchspd * xscale
			reset_anim(sprs.punch)
			image_speed = 0.25
		}
	}
	else if (sprite_index == sprs.punch)
	{
		image_speed = 0.25
		punchspd = approach(punchspd, 0, 0.25)
		hsp = punchspd * xscale
		with (instance_place((x + hsp), y, obj_destroyable))
			instance_destroy()
		if (floor(image_index) == (image_number - 1))
		{
			state = states.normal
			cooldown = 100
			reset_anim(sprs.move)
		}
	}
}

collide()