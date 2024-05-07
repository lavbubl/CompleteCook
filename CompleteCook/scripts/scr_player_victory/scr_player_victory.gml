function scr_player_victory()
{
	hsp = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 1
	machhitAnim = 0
	global.heattime = 60
	if (place_meeting(x, y, obj_keydoor) or place_meeting(x, y, obj_geromedoor))
		sprite_index = spr_victory
	if place_meeting(x, y, obj_startgate)
		sprite_index = spr_entergate
	if (floor(image_index) == (image_number - 1))
		image_speed = 0
	else
		image_speed = 0.35
	exit;
}

