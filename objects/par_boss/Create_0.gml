collide_init()

xscale = 1
yscale = 1
flash = false
warp = 0

state = states.normal
hanged = false
movespeed = 0
scared_timer = 0
stun_timer = 0
blur_timer = 0
do_turn = false
hurtbox_id = -4
taunted = false
vulnerable = false
hitstun = 0
bounces = 3
alarm[1] = 200
image_speed = 0.35
hurtplayer = false
afterimage_timer = 0

sprs = {
	move: spr_pepperman_idle,
	scared: spr_pepperman_scared,
	dead: spr_pepperman_scared,
	stun: spr_pepperman_stun,
	turn: spr_pepperman_idle
}
