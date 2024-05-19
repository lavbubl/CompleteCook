if (!fadedin || fadeout)
	fadealpha = Approach(fadealpha, 1, 0.1)
else
	fadealpha = Approach(fadealpha, 0, 0.1)
if (fadealpha == 1)
	fadedin = true
