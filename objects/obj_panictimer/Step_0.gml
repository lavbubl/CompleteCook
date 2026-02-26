visible = hud_get_visible()

xstart = screen_w / 2
ystart = screen_h - 76

if (global.panic.active && !global.secret)
{
	global.panic.timer = max(global.panic.timer - 0.2, 0)

	if global.panic.timer <= 0
	{
		if !instance_exists(obj_pizzaface)
		{
			instance_create(obj_player.x, obj_player.y, obj_pizzaface)
			scr_sound(sfx_pizzaface)
		}
	}

	if (global.panic.timer % 12 == 1 && global.score > 0)
		decrease_score(5)
}

if (global.panic.active && global.panic.timer > 0)
{
	if !global.secret
		y = approach(y, ystart, 1)
	else
		y = approach(y, ystart + 212, 4)
}
else if global.panic.active
{
	if (showtime_buffer > 0 && pizzaface.sprite_index == spr_timer_pizzaface_wake)
		showtime_buffer--
	else
		y = approach(y, ystart + 212, 1)
}
else
{
	pizzaface.sprite_index = spr_timer_pizzaface_sleep
	y = ystart + 212
}