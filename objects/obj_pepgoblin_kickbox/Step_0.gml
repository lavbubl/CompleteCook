if baddieID == noone || !instance_exists(baddieID) {
	instance_destroy()
	exit
}

image_xscale = baddieID.xscale
x = baddieID.x + (baddieID.xscale * 50)
y = baddieID.y