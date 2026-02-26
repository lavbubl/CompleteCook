// update input
ui_input.up.update(global.keybinds.ui_up);
ui_input.down.update(global.keybinds.ui_down);
ui_input.accept.update(global.keybinds.ui_accept);
ui_input.deny.update(global.keybinds.ui_deny);
ui_input.addbind.update("Z");
ui_input.clearbind.update("C");
ui_input.resetallbinds.update(vk_f1);

if !binding
	selected = clamp(selected + (-ui_input.up.pressed + ui_input.down.pressed), -1, array_length(binds) - 1)

if selected == -1
{
	if ui_input.accept.pressed || ui_input.deny.pressed
		instance_destroy()
	exit;
}

var bindname = binds[selected].globalname

if binding 
{
	if keyboard_check_pressed(vk_anykey)
	{	
		if binds[selected].input == vk_nokey
			global.keybinds[$ bindname] = keyboard_key
		else
		{
			if is_real(global.keybinds[$ bindname])
				global.keybinds[$ bindname] = [global.keybinds[$ bindname]] //convert it to array
			else if is_string(global.keybinds[$ bindname])
				global.keybinds[$ bindname] = [ord(global.keybinds[$ bindname])]
			
			if !array_contains(global.keybinds[$ bindname], keyboard_key) //check if the key isnt set already
				array_push(global.keybinds[$ bindname], keyboard_key) //then add the key
		}
		
		binds[selected].input = global.keybinds[$ bindname]
		binding = false
	}
}
else
{
	if ui_input.addbind.pressed
		binding = true
	else if ui_input.clearbind.pressed
	{
		global.keybinds[$ bindname] = vk_nokey
		binds[selected].input = global.keybinds[$ bindname]
	}
	else if ui_input.resetallbinds.pressed
	{
		array_foreach(binds, function(_element) {
			_element.input = _element.defaultbind
			global.keybinds[$ _element.globalname] = _element.defaultbind
		})
	}
	if ui_input.deny.pressed
		instance_destroy()
}
