if ((!graffiti) && other.state == states.backbreaker && global.graffiticutscene)
{
	other.state = states.graffiti
	other.sprite_index = other.spr_victory
	other.image_index = 0
	global.factorygraffiti = 1
	graffiti = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "factorygraffiti", 1)
}
