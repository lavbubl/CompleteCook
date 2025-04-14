if escape_frozen
{
	visible = false
	
	if (distance_to_object(obj_player) <= 500 && alarm[1] == -1 && global.panic.active)
	{
		create_effect(x, y - 20, spr_pillarenemyspawner)
		alarm[1] = 22
	}
	
	exit;
}

do_enemy_generics()

if obj_player.taunttimer >= 20
	cooldown = 0

if (cooldown <= 0 && distance_to_object(obj_player) <= 300 && state == states.normal)
{
	xscale = x - obj_player.x >= 0 ? -1 : 1
	hsp = 0
	state = states.shoot
	cooldown = 200
	alarm[2] = 15
	reset_anim(spr_pizzard_magic)
}
else
	cooldown--

if state == states.shoot
{
	if anim_ended()
	{
		reset_anim(sprs.move)
		state = states.normal
	}
}
else
	alarm[2] = -1

collide()
