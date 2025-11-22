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
	state = states.kick
	cooldown = 3
	reset_anim(spr_pepgoblin_kick)
}
else
	cooldown--

if (grounded && state == states.kick && floor(image_index) == 3)
	vsp = -5

if state == states.kick
{
	if anim_ended()
	{
		reset_anim(sprs.move)
		state = states.normal
	}
}

collide()
