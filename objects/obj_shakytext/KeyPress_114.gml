str = choose("hdjkhvkfdgbklfgkgh%", 
	"Lorem Ipsum\nLorem Ipsum {u}but {s}again [j][j]cheese\nLorem Ipsum but again again... #风雨廊桥전태«\npeep", 
	"{u}Press [j] to {s}JUMP!",
	"{u}[u][l][r][d][f][b][g][m][ds][j][t][gp][sj]{n}N{u}U{s}S",
	"Value 1: %, Value 2: %, Value 3: %, Value 4: %"
)

str = cc_text_insert_values(str, ["A", "B", "C", "D"])

show = true
alarm[0] = 9999
image_alpha = 0
