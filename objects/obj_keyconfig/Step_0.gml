get_input()

if !binding
	selected = clamp(selected + (-uikey_up.pressed + uikey_down.pressed), -1, array_length(binds) - 1)

if selected == -1
{
	if uikey_accept.pressed
		instance_destroy()

	if uikey_deny.pressed
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
	if uikey_accept.pressed
		binding = true
	if uikey_deny.pressed
		instance_destroy()
}
