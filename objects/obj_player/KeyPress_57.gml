if keyboard_check(vk_shift)
	game_restart()
else {
	character = character == char.peppino ? char.noise : char.peppino
	spr = get_charactersprites()
}