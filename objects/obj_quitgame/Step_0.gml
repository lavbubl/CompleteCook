if obj_menuhandler.input.left.pressed || obj_menuhandler.input.right.pressed
	quit = !quit

if (obj_menuhandler.input.accept.pressed && !quit) || obj_menuhandler.input.deny.pressed
	instance_destroy()
else if obj_menuhandler.input.accept.pressed && quit
	game_end()
