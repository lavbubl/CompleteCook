if other.key_up.pressed
{
	clothes_selected++
	if clothes_selected == array_length(clothes_arr)
		clothes_selected = 0
		
	var palette = clothes_arr[clothes_selected].pal_ix
	var pattern = clothes_arr[clothes_selected].pattern
	
	with obj_player
	{
		scr_sound_3d_pitched(sfx_clothesswitch, x, y, 0.9, 1.1)
		
		with instance_create(x, y, obj_enemycorpse)
		{
			pal_select = other.pal_select
			pattern_spr = other.pattern_spr
			dopalette = true
            hsp = irandom_range(-5, 5)
            vsp = irandom_range(-6, -11)
			sprite_index = spr_palettedresserdebris
			depth = -400
		}
		
		pal_select = palette
		pattern_spr = pattern
		
		ini_open(global.savestring)
		ini_write_real("Clothes", "palette_index", pal_select)
		ini_write_real("Clothes", "pattern_sprite", pattern_spr)
		ini_close()
	}
}
