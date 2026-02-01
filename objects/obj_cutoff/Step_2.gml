visible = !place_meeting(x, y, [obj_destroyable_secret,
								obj_destroyable_big_secret,
								obj_metalblock_secret,
								obj_tiledestroyextension])
if !place_meeting(x, y, obj_solid)
	instance_destroy()
