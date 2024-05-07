if (obj_player.character == "S")
	sprite_index = spr_snickcollectible3
image_speed = 0.35
if (obj_player1.character == "P" && obj_player1.spotlight == 1 && obj_player1.ispeppino)
	sprite_index = spr_giantpizza
if ((obj_player1.character == "N" or (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
	sprite_index = spr_giantpizzahalloween
depth = 11
secret = 1
