y = min(y + vsp, ystart)

if state == 0
{
	text_y = min(text_y + vsp, 0)

	if text_y >= 0
	{
		state++
		rank_scale = 3
	}
}	
else
	rank_scale = max(rank_scale - 0.2, 1)
