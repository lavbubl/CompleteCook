// update input
ui_input.up.update([global.keybinds.ui_up]);
ui_input.down.update([global.keybinds.ui_down]);
ui_input.accept.update([global.keybinds.ui_accept]);
ui_input.deny.update([global.keybinds.ui_deny]);

if !binding
	selected = clamp(selected + (-ui_input.up.pressed + ui_input.down.pressed), -1, array_length(binds) - 1)

if selected == -1
{
	if ui_input.accept.pressed
		instance_destroy()

	if ui_input.deny.pressed
		instance_destroy()
	exit;
}

if binding 
{
	if keyboard_check_pressed(vk_anykey)
	{
		var bindname = binds[selected].globalname
		global.keybinds[$ bindname] = keyboard_key
		
		ini_open("globalsave.ini")
		ini_write_real("keybinds", bindname, keyboard_key)
		ini_close()
		
		binds[selected].input = keyboard_key
		binding = false
	}
}
else
{
	if ui_input.accept.pressed
		binding = true
	if ui_input.deny.pressed
		instance_destroy()
}
