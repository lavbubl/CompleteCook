switch room
{
	case hub_room1:
		world = 1
		break
}

ini_open(concat("saveData", global.currentsavefile, ".ini"))
ini_write_real("PigTotal", concat("world", world), global.pigtotal)
ini_close()
