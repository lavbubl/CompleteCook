depth = -200
binds = [ 
	{input: global.keybinds.left,		image_index: 3,		name: "Left",		globalname: "left"},
	{input: global.keybinds.right,		image_index: 2,		name: "Right",		globalname: "right"},
	{input: global.keybinds.up,			image_index: 0,		name: "Up",			globalname: "up"},
	{input: global.keybinds.down,		image_index: 1,		name: "Down",		globalname: "down"},
	{input: global.keybinds.jump,		image_index: 4,		name: "Jump",		globalname: "jump"},
	{input: global.keybinds.grab,		image_index: 5,		name: "Grab",		globalname: "grab"},
	{input: global.keybinds.dash,		image_index: 6,		name: "Dash",		globalname: "dash"},
	{input: global.keybinds.taunt,		image_index: 7,		name: "Taunt",		globalname: "taunt"},
	{input: global.keybinds.ui_left,	image_index: 3,		name: "Menu Left",	globalname: "ui_left"},
	{input: global.keybinds.ui_right,	image_index: 2,		name: "Menu Right",	globalname: "ui_right"},
	{input: global.keybinds.ui_up,		image_index: 0,		name: "Menu Up",	globalname: "ui_up"},
	{input: global.keybinds.ui_down,	image_index: 1,		name: "Menu Down",	globalname: "ui_down"},
	{input: global.keybinds.ui_accept,	image_index: 7,		name: "Accept",		globalname: "ui_accept"},
	{input: global.keybinds.ui_deny,	image_index: 8,		name: "Deny",		globalname: "ui_deny"}
]

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
