with (obj_player1)
{
	if ((place_meeting((x + hsp), y, other) or place_meeting((x + xscale), y, other)) && (obj_player1.state == states.mach3 or obj_player1.state == states.rocket or obj_player1.state == states.knightpepslopes or obj_player1.state == states.shoulderbash))
	{
		playerindex = 0
		instance_destroy(other)
	}
}
if (place_meeting(x, (y + 1), obj_player1) or place_meeting(x, (y - 1), obj_player1) or place_meeting((x - 1), y, obj_player1) or place_meeting((x + 1), y, obj_player1))
{
	if (place_meeting(x, (y - 1), obj_player1) && obj_player1.state == states.freefall && obj_player1.freefallsmash >= 10)
	{
		with (instance_place(x, (y - 1), obj_player1))
		{
			if (character == "M")
			{
				state = states.jump
				vsp = -7
				sprite_index = spr_jump
			}
		}
		playerindex = 0
		instance_destroy()
	}
	if (place_meeting(x, (y - 1), obj_player1) && (obj_player1.state == states.knightpep or obj_player1.state == states.hookshot))
	{
		playerindex = 0
		instance_destroy()
		tile_layer_delete_at(1, x, y)
	}
}
with (obj_player2)
{
	if ((place_meeting((x + hsp), y, other) or place_meeting((x + xscale), y, other)) && (obj_player2.state == states.mach3 or obj_player2.state == states.knightpepslopes or obj_player2.state == states.shoulderbash))
	{
		playerindex = 1
		instance_destroy(other)
	}
}
if (place_meeting(x, (y + 1), obj_player2) or place_meeting(x, (y - 1), obj_player2) or place_meeting((x - 1), y, obj_player2) or place_meeting((x + 1), y, obj_player2))
{
	if (place_meeting(x, (y - 1), obj_player2) && obj_player2.state == states.freefall && obj_player2.freefallsmash >= 10)
	{
		playerindex = 1
		instance_destroy()
	}
	if (place_meeting(x, (y - 1), obj_player2) && (obj_player2.state == states.knightpep or obj_player2.state == states.hookshot))
	{
		playerindex = 1
		instance_destroy()
		tile_layer_delete_at(1, x, y)
	}
}
