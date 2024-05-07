if (obj_player.key_right2 && i < 12)
{
	i += 1
	scr_soundeffect(sfx_step)
}
if ((-obj_player.key_left2) && i > 0)
{
	i -= 1
	scr_soundeffect(sfx_step)
}
if (obj_player.key_slap2 or keyboard_check_pressed(vk_f5) or obj_player.key_start)
{
	instance_destroy()
	obj_mainmenuselect.selected = 0
}
