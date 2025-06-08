switch state
{
	case 0:
		fade_alpha += 0.1
		if fade_alpha >= 1
			state++
		break;
	case 1:
		if round(player.x) <= -10
			player.x = lerp(player.x, 0, 0.1)
		else
			state++
		break;
	case 2:
		if round(boss.x) >= screen_w + 10
			boss.x = lerp(boss.x, screen_w, 0.1)
		else
		{
			state++
			alarm[0] = 30
		}
		break;
	case 3:
		whitealpha += 0.02
		if whitealpha >= 2
		{
			state++
			shakemag = 20
			alarm[1] = 300
		}
		break;
	case 4:
		var shakeaccel = 0.2
		shakemag = approach(shakemag, 0, shakeaccel)
		break;
}
