enum tv_states {
	off,
	normal,
	transition,
	expr
}

pattern_init()

image_speed = 0.35
x = screen_w - 115
y = 80
depth = -200
xstart = x
ystart = y

expr_sprite = spr_tv_mach3
state_togo = tv_states.expr
state = tv_states.off
idletimer = 240

combo = {
	state: 0,
	ghost: {
		image_index: 0,
		x: 0,
		y: 0
	},
	x: 0,
	y: -500,
	vsp: 0
}
