scr_sound(sfx_tvswitch)
scr_sound_3d(sfx_groundpound, obj_player.x, obj_player.y)
image_speed = 0.35
sprite_index = spr_techdiff_static
depth = -999
techdiff_spr = obj_player.character == characters.noise ? spr_techdiffN : spr_techdiffP
state = 0
t_ix = 0
