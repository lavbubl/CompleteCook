depth = -500

var player_hp = 6

player = {
	hp: player_hp,
	prevhp: player_hp,
	maxhp: player_hp,
	hpspr: spr_bosshp_peppino,
	hpix: 0,
	hphudpos: {
		x: 0,
		y: 0
	}
}

opponent = {
	hp: boss_hp,
	prevhp: boss_hp,
	maxhp: boss_hp,
	hpspr: boss_hp_spr,
	hpix: 0,
	rows: boss_hp_rows,
	hphudpos: {
		x: 0,
		y: 0
	}
}

state = 0

circ_surf = surface_create(screen_w, screen_h)
circ_goaway = true
circ_size = 100

fade_alpha = 0
player_alpha = 1

extrahats = 0

global.boss_room = true
