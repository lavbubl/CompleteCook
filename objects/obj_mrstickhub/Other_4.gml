switch room
{
	case hub_room1:
		world = 1
		break
	case hub_room2:
		world = 2
		break
}

ini_open(concat("saveData", global.currentsavefile, ".ini"))
currentscore = ini_read_real("StickScore", concat("world", world), 0)
global.pigreduction = currentscore
ini_close()
