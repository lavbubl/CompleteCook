if (obj_player1.sprite_index != spr_player_breakdance)
{
    instance_create(x, y, obj_genericpoofeffect)
    instance_destroy()
	audio_stop_sound(beatboxsnd)
}
scr_collide()

