vsp = random_range(-10, -18)
hsp = (sign((x - obj_player.x)) * random_range(10, 18))
grav = 0.4
angle = 0
randomize()
spinspeed = choose(0, 0, 0, 10, 20)
alarm[0] = 5
cigar = 0
stomped = 0
buffer = 10
if (x != obj_player.x)
	image_xscale = (-(sign((x - obj_player.x))))
depth = -999
paletteselect = 0
spr_palette = spr_plug
d = 255
