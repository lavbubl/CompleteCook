draw_set_color(c_white)
switch state
{
	case 0:
		draw_set_alpha(fade_alpha)
		draw_rectangle_color(0, 0, screen_w, screen_h, c_black, c_black, c_black, c_black, false)
		draw_set_alpha(1)
		break;
	case 1:
	case 2:
	case 3:
		draw_set_alpha(1)
		draw_rectangle(0, 0, screen_w, screen_h, false)
		draw_sprite(player.shadow_sprite, 0, player.x, player.y)
		draw_sprite_ext(boss.sprite_index, 0, boss.x, boss.y, 1, 1, 0, c_black, 1)
		draw_set_alpha(whitealpha)
		draw_rectangle(0, 0, screen_w, screen_h, false)
		draw_set_alpha(1)
		break;
	case 4:
		bgy -= 4
		draw_sprite_tiled(bg_bossversus, 0, 0, bgy)
		
		draw_sprite(player.sprite_index, 0, player.x - irandom(shakemag), player.y + irandom(shakemag))
		draw_sprite(boss.sprite_index, 0, boss.x + irandom(shakemag), boss.y + irandom(shakemag))
		
		var titleshakemag = max(shakemag, 1)
		var titleshake_x = irandom_range(-titleshakemag, titleshakemag)
		var titleshake_y = irandom_range(-titleshakemag, titleshakemag)
		var vspos_x = (screen_w / 2) - 40 + titleshake_x
		var vspos_y = screen_h / 2 + titleshake_y
		draw_sprite(spr_bosstitle_vs, 0, vspos_x, vspos_y)
		draw_sprite(player.title_sprite, 0, vspos_x - 280, vspos_y - 110)
		draw_sprite(boss.title_sprite, 0, vspos_x + 280, vspos_y - 110)
		break;
}

