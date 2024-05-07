if ((!instance_exists(baddieID)) or (!baddieID.thrown) or baddieID.state != states.stun)
{
	instance_destroy()
	exit;
}
x = baddieID.x
y = baddieID.y
image_xscale = (-baddieID.image_xscale)
