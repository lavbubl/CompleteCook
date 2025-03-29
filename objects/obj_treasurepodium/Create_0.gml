depth = 20

ini_open($"saves/saveData{global.savefile}.ini")

treasure = ini_read_real(level_name, "treasure", false)

ini_close()
