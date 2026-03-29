update_input();

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
				global.keybinds[$ bindname] = global.keybinds[$ bindname];
			else if is_string(global.keybinds[$ bindname])
				global.keybinds[$ bindname] = ord(global.keybinds[$ bindname]);
			
		}
		
		binds[selected].input = global.keybinds[$ bindname];
		binding = false;
        
        update_binds();
	}
}
else
{
	if ui_input.addbind.pressed
		binding = true;
	else if ui_input.clearbind.pressed
	{
		global.keybinds[$ bindname] = vk_nokey;
		binds[selected].input = global.keybinds[$ bindname];
	}
	else if ui_input.resetallbinds.pressed
	{
		array_foreach(binds, function(_element)
        {
			_element.input = _element.defaultbind;
			global.keybinds[$ _element.globalname] = _element.defaultbind;
		});
        update_binds();
	}
	if ui_input.deny.pressed
		instance_destroy()
}
