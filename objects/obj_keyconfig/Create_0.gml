// declare input
input_handler = new InputHandler(obj_inputcontroller.main_gamepad).AddInput(["ui_up", "ui_down", "ui_accept", "ui_deny", "addbind", "clearbind", "resetallbinds"]).Finalize();

ui_input = 
{
    up: false,
    down: false,
    accept: false,
    deny: false,
    addbind: false,
    clearbind: false,
    resetallbinds: false
}

update_input = function()
{
    ui_input.up = input_handler.get_input("ui_up");
    ui_input.down = input_handler.get_input("ui_down");
    ui_input.accept = input_handler.get_input("ui_accept");
    ui_input.deny = input_handler.get_input("ui_deny");
    ui_input.addbind = input_handler.get_input("addbind");
    ui_input.clearbind = input_handler.get_input("clearbind");
    ui_input.resetallbinds = input_handler.get_input("resetallbinds");
}

depth = -3000
binds = [ 
	{input: global.keybinds.left,			image_index: 3,		name: "Left",			globalname: "left",			defaultbind: vk_left},
	{input: global.keybinds.right,			image_index: 2,		name: "Right",			globalname: "right",		defaultbind: vk_right},
	{input: global.keybinds.up,				image_index: 0,		name: "Up",				globalname: "up",			defaultbind: vk_up},
	{input: global.keybinds.down,			image_index: 1,		name: "Down",			globalname: "down",			defaultbind: vk_down},
	{input: global.keybinds.jump,			image_index: 4,		name: "Jump",			globalname: "jump",			defaultbind: "Z"},
	{input: global.keybinds.grab,			image_index: 5,		name: "Grab",			globalname: "grab",			defaultbind: "X"},
	{input: global.keybinds.dash,			image_index: 6,		name: "Dash",			globalname: "dash",			defaultbind: vk_shift},
	{input: global.keybinds.taunt,			image_index: 7,		name: "Taunt",			globalname: "taunt",		defaultbind: "C"},
	{input: global.keybinds.superjump,		image_index: 9,		name: "Superjump",		globalname: "superjump",	defaultbind: vk_nokey},
	{input: global.keybinds.groundpound,	image_index: 10,	name: "Groundpound",	globalname: "groundpound",	defaultbind: vk_nokey},
	{input: global.keybinds.ui_left,		image_index: 3,		name: "Menu Left",		globalname: "ui_left",		defaultbind: vk_left},
	{input: global.keybinds.ui_right,		image_index: 2,		name: "Menu Right",		globalname: "ui_right",		defaultbind: vk_right},
	{input: global.keybinds.ui_up,			image_index: 0,		name: "Menu Up",		globalname: "ui_up",		defaultbind: vk_up},
	{input: global.keybinds.ui_down,		image_index: 1,		name: "Menu Down",		globalname: "ui_down",		defaultbind: vk_down},
	{input: global.keybinds.ui_accept,		image_index: 7,		name: "Accept",			globalname: "ui_accept",	defaultbind: "Z"},
	{input: global.keybinds.ui_deny,		image_index: 8,		name: "Deny",			globalname: "ui_deny",		defaultbind: "X"}
] //dont mind these warnings

c_x = 0
offset = 0
selected = 0
binding = false
//have to hardcode this so there's an order
