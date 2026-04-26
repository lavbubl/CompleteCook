depth = -3000

bind = function(_bindname, _ix, _name, _defaultbind) constructor
{
	bindname = _bindname
	image_index = _ix
	name = _name
	defaultbind = _defaultbind
}

binds = [
	new bind("up",				0,		"",				vk_up),
	new bind("down",			1,		"",				vk_down),
	new bind("right",			2,		"",				vk_right),
	new bind("left",			3,		"",				vk_left),
	new bind("jump",			4,		"",				"Z"),
	new bind("grab",			5,		"",				"X"),
	new bind("dash",			6,		"",				vk_shift),
	new bind("taunt",			7,		"",				"C"),
	new bind("ui_start",		8,		"",				vk_escape),
	new bind("superjump",		9,		"",				vk_nokey),
	new bind("groundpound",		10,		"",				vk_nokey),
	new bind("ui_up",			-1,		"MENU UP",		vk_up),
	new bind("ui_down",			-1,		"MENU DOWN",	vk_down),
	new bind("ui_right",		-1,		"MENU RIGHT",	vk_right),
	new bind("ui_left",			-1,		"MENU LEFT",	vk_left),
	new bind("ui_accept",		-1,		"CONFIRM",		[vk_enter, vk_space, "Z"]),
	new bind("ui_deny",			-1,		"DENY",			[vk_escape, vk_backspace, "X"])
]

config_buttons = [
	[INPUTS.bind_reset, " Reset binds"],
	[INPUTS.bind_add,	" Add bind"],
	[INPUTS.bind_clear, " Clear bindings"]
]

c_x = 0
offset = 0
selected = 0
back_selected_target = 0
binding = false
target_drawing_type = INPUT_TYPE.KEYBOARD
//have to hardcode this so there's an order
