if (state != states.grabbed && state != states.pummel && state != states.hit && state != states.secret && ((!(place_meeting(x, y, obj_destructibles))) or place_meeting(x, y, obj_onewaybigblock)))
	instance_destroy()
