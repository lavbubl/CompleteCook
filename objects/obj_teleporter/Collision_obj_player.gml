if !other.warping
{
	scr_sound_3d(sfx_teleportenter, x, y)
	other.visible = false
	other.warping = true
	prev_state = other.state
	prev_ix = other.image_index
	other.state = -4
	var o = 32
	var xx = clamp(other.x, bbox_left + o, bbox_right - o)
	var yy = clamp(other.y, bbox_top + o, bbox_bottom - o)
	repeat 8
		create_effect(xx + random_range(50, -50), yy + random_range(50, -50), spr_teleportdebris)
	alarm[0] = 25
	create_effect(other.x, other.y, spr_teleporteffect)
	playerid = other.id
}
