event_inherited()

binds = [
	new bind("up",				0,		"",				gp_padu), //replace the controll
	new bind("down",			1,		"",				gp_padd),
	new bind("right",			2,		"",				gp_padr),
	new bind("left",			3,		"",				gp_padl),
	new bind("jump",			4,		"",				gp_face1),
	new bind("grab",			5,		"",				gp_face3),
	new bind("dash",			6,		"",				[gp_shoulderrb, gp_shoulderr]),
	new bind("taunt",			7,		"",				gp_face4),
	new bind("ui_start",		8,		"",				gp_start),
	new bind("superjump",		9,		"",				vk_nokey),
	new bind("groundpound",		10,		"",				vk_nokey),
	new bind("ui_up",			-1,		"MENU UP",		gp_padu),
	new bind("ui_down",			-1,		"MENU DOWN",	gp_padd),
	new bind("ui_right",		-1,		"MENU RIGHT",	gp_padr),
	new bind("ui_left",			-1,		"MENU LEFT",	gp_padl),
	new bind("ui_accept",		-1,		"CONFIRM",		[gp_face1, gp_start]),
	new bind("ui_deny",			-1,		"DENY",			gp_face3)
]

target_drawing_type = INPUT_TYPE.CONTROLLER
