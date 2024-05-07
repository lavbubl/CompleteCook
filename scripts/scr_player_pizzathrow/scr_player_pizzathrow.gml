function scr_player_pizzathrow()
{
	movespeed = 0
	mach2 = 0
	hsp = 0
	xscale = -1
	jumpstop = 0
	if (global.shroomfollow == 0 && global.cheesefollow == 0 && global.tomatofollow == 0 && global.sausagefollow == 0 && global.pineapplefollow == 0)
	{
		state = states.normal
		landAnim = 0
		mach2 = 0
		image_index = 0
	}
	exit;
}

