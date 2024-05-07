scr_getinput()
for (var i = 0; i < array_length(optionarr); i++) {
	if (key_escape)
		instance_destroy(optionarr[i][1])
}
if canchoose
{
	bgalpha = Approach(bgalpha, 0, 0.05)
	selected += (key_down2 - key_up2)
	if (selected > array_length(optionarr) - 1)
		selected = 0
	if (selected < 0)
		selected = array_length(optionarr) - 1
	if key_jump
	{
		bgindex = optionarr[selected][2]
		canchoose = false
		instance_create(x, y, (optionarr[selected][1]))
	}
}
else
	bgalpha = Approach(bgalpha, 1, 0.1)
if key_escape
	instance_destroy()
x--
y--