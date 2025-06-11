// declare input
ui_input =
{
	up: new Input(global.keybinds.ui_up),
	down: new Input(global.keybinds.ui_down),
	accept: new Input(global.keybinds.ui_accept),
	deny: new Input(global.keybinds.ui_deny),
	addbind: new Input("Z"),
	clearbind: new Input("C"),
	resetallbinds: new Input(vk_f1)
};

depth = -200
binds = [ 
	{input: global.keybinds.left,		image_index: 3,		name: "Left",		globalname: "left",			defaultbind: vk_left},
	{input: global.keybinds.right,		image_index: 2,		name: "Right",		globalname: "right",		defaultbind: vk_right},
	{input: global.keybinds.up,			image_index: 0,		name: "Up",			globalname: "up",			defaultbind: vk_up},
	{input: global.keybinds.down,		image_index: 1,		name: "Down",		globalname: "down",			defaultbind: vk_down},
	{input: global.keybinds.jump,		image_index: 4,		name: "Jump",		globalname: "jump",			defaultbind: "Z"},
	{input: global.keybinds.grab,		image_index: 5,		name: "Grab",		globalname: "grab",			defaultbind: "X"},
	{input: global.keybinds.dash,		image_index: 6,		name: "Dash",		globalname: "dash",			defaultbind: vk_shift},
	{input: global.keybinds.taunt,		image_index: 7,		name: "Taunt",		globalname: "taunt",		defaultbind: "C"},
	{input: global.keybinds.ui_left,	image_index: 3,		name: "Menu Left",	globalname: "ui_left",		defaultbind: vk_left},
	{input: global.keybinds.ui_right,	image_index: 2,		name: "Menu Right",	globalname: "ui_right",		defaultbind: vk_right},
	{input: global.keybinds.ui_up,		image_index: 0,		name: "Menu Up",	globalname: "ui_up",		defaultbind: vk_up},
	{input: global.keybinds.ui_down,	image_index: 1,		name: "Menu Down",	globalname: "ui_down",		defaultbind: vk_down},
	{input: global.keybinds.ui_accept,	image_index: 7,		name: "Accept",		globalname: "ui_accept",	defaultbind: [vk_enter, vk_space, "Z"]},
	{input: global.keybinds.ui_deny,	image_index: 8,		name: "Deny",		globalname: "ui_deny",		defaultbind: [vk_escape, vk_backspace, "X"]}
] //dont mind these warnings

c_x = 0
offset = 0
selected = 0
binding = false

if instance_exists(obj_pause)
{
	audio_pause_sound(mu_pause)
	scr_sound(mu_options, true)
}

//have to hardcode this so there's an order
