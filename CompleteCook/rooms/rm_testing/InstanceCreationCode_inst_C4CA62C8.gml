func = function(argument0)
{
	if ((!active) && argument0.state == states.backbreaker)
	{
		active = 1
		obj_secretmanager.totems++
	}
	exit;
}

stepfunc = function()
{
	if active
	{
		with (instance_place(x, y, obj_totem))
			sprite_index = spr_totemcheese_pep
	}
	exit;
}

visible = false
