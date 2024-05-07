if (room == Titlescreen && obj_player.state == states.titlescreen)
{
	obj_player1.sprite_index = spr_player_machfreefall
	obj_player1.state = states.backbreaker
	obj_player1.movespeed = 6
	obj_player1.vsp = 5
	obj_player1.xscale = 1
	obj_player1.player_x = 50
	obj_player1.player_y = 50
}
if (obj_player.state == states.taxi)
{
	if (!global.pizzadelivery)
	{
		with (instance_create((obj_stopsign.x - 480), obj_stopsign.y, obj_taxidud))
			playerid = obj_player1
	}
	else
	{
		with (instance_create((obj_checkpoint.x - 480), (obj_checkpoint.y - 50), obj_taxidud))
			playerid = obj_player1
		with (obj_player)
		{
			x = obj_checkpoint.x
			y = (obj_checkpoint.y - 50)
		}
	}
}
if (obj_player.state == states.policetaxi)
{
	with (obj_player)
	{
		visible = true
		state = states.normal
	}
}
