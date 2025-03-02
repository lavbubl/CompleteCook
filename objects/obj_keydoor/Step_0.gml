if obj_player.sprite_index == spr_player_enterkeydoor && obj_player.image_index >= 40 && !obj_fade.fade
{
	obj_player.image_speed = 0
	do_fade(t_room, t_door, fade_types.door)
}
