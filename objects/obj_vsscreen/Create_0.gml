var offset = 400

player = {
	x: -offset,
	y: screen_h,
	sprite_index: spr_bossportrait_peppino,
	shadow_sprite: spr_bossportrait_peppinoshadow,
	title_sprite: spr_bosstitle_peppino
}
boss = {
	x: screen_w + offset,
	y: screen_h,
	sprite_index: spr_bossportrait_pepperman,
	title_sprite: spr_bosstitle_pepperman
}

bgy = 0
state = 0
fade_alpha = 0
whitealpha = 0
t_room = noone
t_door = "a"
