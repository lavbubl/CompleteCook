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

if cooldown == 0 && state == states.normal
{
	hsp = 0
	state = states.shoot
	reset_anim(spr_monkey_eat)
}
else if state == states.shoot
{
	if cooldown == 0 && floor(image_index) == 15
	{
		cooldown = 200
		scr_sound_3d(sfx_enemyprojectile, x, y)
		if instance_exists(banana_id)
			instance_destroy(banana_id)
		with instance_create(x, y, obj_banana)
		{
			image_xscale = other.xscale
			other.banana_id = id
			hsp = image_xscale * -4
			vsp = -5
		}
	}
	if anim_ended()
	{
		state = states.normal
		sprite_index = sprs.move
	}
}

if obj_player.state == states.taunt
	cooldown = 0

cooldown = max(cooldown - 1, 0)

collide()
