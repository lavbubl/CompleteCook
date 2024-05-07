global.breaksound = 0
if (obj_player1.character == "P" && obj_player1.spotlight == 1 && obj_player1.ispeppino)
	sprite_index = spr_destroyable2
if ((obj_player1.character == "N" or (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
	sprite_index = spr_halloweensmallblock
image_index = random_range(0, (image_number - 1))
depth = 1
