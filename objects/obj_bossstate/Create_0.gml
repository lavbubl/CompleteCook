depth = -500

player = {
	hp: 6,
	maxhp: 6,
	hpspr: spr_bosshp_peppino,
	hpix: 0
}

opponent = {
	hp: boss_hp,
	maxhp: boss_hp,
	hpspr: boss_hp_spr,
	hpix: 0,
	rows: boss_hp_rows,
}

circ_surf = surface_create(screen_w, screen_h)
circ_goaway = true
circ_size = 100

fade_alpha = 0

if obj_player.pal_select == 12
	pattern_init()

global.boss_room = true
