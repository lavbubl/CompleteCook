image_speed = 0.35
state = 0
image_xscale = choose(-1, 1)
alarm[0] = 80 + irandom(70)
hsp = 0
sprs = {
	idle: noone,
	move: noone,
	taunt: noone
}
depth = -11
while scr_solid(x, y)
    y--
