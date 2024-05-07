instance_create((room_width / 2), (room_height / 2), obj_rank)
if instance_exists(obj_treasureviewer)
	exit;
obj_player1.visible = false
obj_player2.visible = false
if (global.collect >= global.collectN)
{
	with (instance_create(obj_player2.x, obj_player2.y, obj_dashcloud))
		sprite_index = spr_bombexplosion
	repeat (6)
		instance_create(obj_player2.x, obj_player2.y, obj_baddiegibs)
}
if (global.collectN > global.collect)
{
	with (instance_create(obj_player1.x, obj_player1.y, obj_dashcloud))
		sprite_index = spr_bombexplosion
	repeat (6)
		instance_create(obj_player1.x, obj_player1.y, obj_baddiegibs)
	scr_soundeffect(sfx_explosion)
}
