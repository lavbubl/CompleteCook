function scr_is_prank()
{
	if (global.treasure && global.secretfound >= 3 && global.collect > global.srank && global.lap && !global.combodropped)
		return true;
	else
		return false;
}