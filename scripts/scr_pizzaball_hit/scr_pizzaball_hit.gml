function scr_pizzaball_hit()
{
	x = (hitX + irandom_range(-6, 6))
	y = (hitY + irandom_range(-6, 6))
	hitLag--
	sprite_index = stunfallspr
	if (hitLag <= 0)
	{
		x = hitX
		y = hitY
		var s = -1
		with (instance_nearest(x, y, obj_player))
			s = tauntstoredstate
		if (s != states.mach2)
			scr_pizzaball_go_to_thrown((hithsp * 1.5), -12)
		else
			scr_pizzaball_go_to_thrown((hithsp * 0.5), (hitvsp * 0.5))
		global.golfhit++
	}
}

function scr_pizzaball_grabbed()
{
	var pl = (grabbedby == 1 ? obj_player1 : obj_player2)
	with (pl)
	{
		sprite_index = spr_golfidle
		image_index = 0
		state = states.golf
		golfid = other.id
		hsp = 0
		vsp = 0
	}
	player = pl
	state = states.golf
}

function scr_pizzaball_go_to_thrown(argument0, argument1, argument2)
{
	if (argument2 == undefined)
		argument2 = 1
	hitspeed = abs(argument0)
	if (sign(argument0) != 0)
		image_xscale = sign(argument0)
	jumpspeed = abs(argument1)
	if (argument2 && jumpspeed < 12)
		jumpspeed = 12
	vsp = (-jumpspeed)
	bounced = 0
	state = states.thrown
	substate = states.thrown
}
