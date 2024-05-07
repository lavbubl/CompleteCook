function scr_initinput2()
{
	ini_open("saveData.ini")
	
	// I can't be bothered please
	global.key_upN = ini_read_string("ControlsKeys2", "up", 87)
	global.key_rightN = ini_read_string("ControlsKeys2", "right", 68)
	global.key_leftN = ini_read_string("ControlsKeys2", "left", 65)
	global.key_downN = ini_read_string("ControlsKeys2", "down", 83)
	global.key_jumpN = ini_read_string("ControlsKeys2", "jump", 76)
	global.key_slapN = ini_read_string("ControlsKeys2", "slap", 75)
	global.key_tauntN = ini_read_string("ControlsKeys2", "taunt", 79)
	global.key_shootN = ini_read_string("ControlsKeys2", "shoot", 73)
	global.key_attackN = ini_read_string("ControlsKeys2", "attack", 74)
	global.key_startN = ini_read_string("ControlsKeys2", "start", 80)
	global.key_chainsawN = ini_read_string("ControlsKeys", "chainsaw", 77)
	
	global.key_upCN = ini_read_string("ControllerButton", "up", 32781)
	global.key_rightCN = ini_read_string("ControllerButton", "right", 32784)
	global.key_leftCN = ini_read_string("ControllerButton", "left", 32783)
	global.key_downCN = ini_read_string("ControllerButton", "down", 32782)
	global.key_jumpCN = ini_read_string("ControllerButton", "jump", 32769)
	global.key_slapCN = ini_read_string("ControllerButton", "slap", 32771)
	global.key_tauntCN = ini_read_string("ControllerButton", "taunt", 32772)
	global.key_shootCN = ini_read_string("ControllerButton", "shoot", 32770)
	global.key_attackCN = ini_read_string("ControllerButton", "attack", 32774)
	global.key_startCN = ini_read_string("ControllerButton", "start", 32778)
	global.key_chainsawCN = ini_read_string("ControlsKeys", "chainsaw", 32773)
	
	ini_close()
}
