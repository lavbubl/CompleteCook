room_goto(tower_1)
global.score = 0
global.level_data.treasure = false
with obj_player
{
	state = states.backtohub
	vsp = 0
	sprite_index = spr_player_slipbanana1
}
