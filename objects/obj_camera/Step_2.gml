campos = {
	x: obj_player.x - (SCREEN_WIDTH / 2),
	y: obj_player.y - (SCREEN_HEIGHT / 2) - constant_y_offset,
}

if obj_player.state == states.backtohub
	campos.y = obj_player.ystart - (SCREEN_HEIGHT / 2) - 50

campos.x += cam_charge
campos.y += cam_y_offset

campos.x = clamp(campos.x, 0, room_width - SCREEN_WIDTH)
campos.y = clamp(campos.y, 0, room_height - SCREEN_HEIGHT)

if global.panic.active && !global.secret
	mag = 1

if mag > 0 && global.option_screenshake
{
	campos.x += irandom_range(-mag, mag)
	campos.y += irandom_range(-mag, mag)
}

mag = max(mag - mag_decel, 0)

cam_y_offset = approach(cam_y_offset, 0, 4)

if !obj_player.secret_exit && obj_player.sprite_index != spr_pizzaportalend
	camera_set_view_pos(view_camera[0], campos.x, campos.y)
