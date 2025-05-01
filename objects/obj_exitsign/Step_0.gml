var spr_idle = isstick ? spr_stick_exitidle : spr_gustavo_exitidle
var spr_fall = isstick ? spr_stick_exitfall : spr_gustavo_exitfall

switch state
{
	case states.actor:
		visible = false
		y = camera_get_view_y(view_camera[0]) - 100
		
		if (abs(x - obj_player.x) <= screen_w / 2 && global.panic.active)
		{
			state = states.jump
			sprite_index = spr_fall
		}
		break;
	case states.jump:
		var spd = 20
		
		visible = true
		
		if y < ystart
			y = approach(y, ystart, spd)
		else
		{
			create_effect(x, y, spr_landeffect)
			sprite_index = spr_idle
			image_index = 0
			state = states.normal
		}
		
		with (instance_place(x, y, par_enemy))
		{
			if enemy_can_die()
				instance_destroy()
		}
		break;
}