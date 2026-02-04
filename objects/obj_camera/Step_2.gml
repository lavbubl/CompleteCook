if obj_player.secret_exit || obj_player.sprite_index == spr_pizzaportalend
	exit;

campos = {
	x: obj_player.x - (screen_w / 2),
	y: obj_player.y - (screen_h / 2) - 50,
}

if obj_player.state == states.backtohub
	campos.y = obj_player.ystart - (screen_h / 2) - 50

campos.x += cam_charge

campos.x = clamp(campos.x, 0, room_width - screen_w)
campos.y = clamp(campos.y, 0, room_height - screen_h)

if global.panic.active && !global.secret
	mag = 1

if mag > 0 && global.option_screenshake
{
	campos.x += irandom_range(-mag, mag)
	campos.y += irandom_range(-mag, mag)
}

mag = max(mag - mag_decel, 0)

camera_set_view_pos(view_camera[0], campos.x, campos.y)
