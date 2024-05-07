if ((obj_player1.character == "P" or obj_player1.character == "V") && obj_player1.spotlight == 1 && obj_player1.ispeppino)
	sprite_index = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5)
if ((obj_player1.character == "N" or (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
	sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
image_speed = 0.35
if (obj_player.character == "S")
	sprite_index = spr_snickcollectible2
depth = 11
