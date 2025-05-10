clothes_arr = [	
	new make_clothes_inst("Classic Cook",		"The one and only.",											1),
	new make_clothes_inst("Unfunny Cook",		"Ha.",															3),	
	new make_clothes_inst("Money Green",		"Green, like money!",											4),	
	new make_clothes_inst("SAGE Blue",			"Nostalgia bait.",												5),	
	new make_clothes_inst("Blood Red",			"Don't worry, it's just stained in pizza sauce.",				6),	
	new make_clothes_inst("TV Purple",			"You are purple perfection.",									7),	
	new make_clothes_inst("Dark Cook",			"For masochists.",												8),	
	new make_clothes_inst("Shitty Cook",		"You smell like shit.",											9),	
	new make_clothes_inst("Golden God",			"Try P ranking next time!",										10),	
	new make_clothes_inst("Garish Cook",		"Flashy!",														11),	
	new make_clothes_inst("Mooney Orange",		"Donating to the poor, how sweet!",								15),	
	new make_clothes_inst("Funny Polka",		"HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA",				12,		pat_funny),	
	new make_clothes_inst("Itchy Sweater",		"Thanks granny.",												12,		pat_itchy),	
	new make_clothes_inst("Pizza Man",			"BECOME THE PIZZA!",											12,		pat_pizza),	
	new make_clothes_inst("Bowling Stripes",	"Strike!",														12,		pat_stripes),	
	new make_clothes_inst("Goldemanne",			"Ooooh, Shiny!",												12,		pat_goldemanne),	
	new make_clothes_inst("Bad Bones",			"Good job, you're doing awful.",								12,		pat_bones),	
	new make_clothes_inst("PP Shirt",			"Register now for 25% off your next order at Peppino Pizza.",	12,		pat_pp),	
	new make_clothes_inst("War Camo",			"Is he a war veteran? Or is he just crazy?",					12,		pat_war),	
	new make_clothes_inst("John Suit",			"Made from the dead remains of johns.",							12,		pat_john),
	new make_clothes_inst("Candy Wrapper",		"Not tacky at all.",											12,		pat_candy),
	new make_clothes_inst("Bloodstained",		"Only a little sauce, scary!",									12,		pat_bloodstained),
	new make_clothes_inst("Autumn",				"That one flannel you wear for Thanksgiving",					12,		pat_autumn),
	new make_clothes_inst("Pumpkin",			"I'm going to carve you.",										12,		pat_pumpkin),
	new make_clothes_inst("Fur",				"Furry!",														12,		pat_fur),
	new make_clothes_inst("Eyes",				"I see you.",													12,		pat_eyes),
]

clothes_selected = 1

switch obj_player.pal_select
{
	case 0:
	case 1:
	case 2: 
	case 13:
	case 14: 
			 clothes_selected = 0  break;
	case 3:	 clothes_selected = 1 break;
	case 4:	 clothes_selected = 2 break;
	case 5:	 clothes_selected = 3 break;
	case 6:	 clothes_selected = 4 break;
	case 7:	 clothes_selected = 5 break;
	case 8:	 clothes_selected = 6 break;
	case 9:	 clothes_selected = 7 break;
	case 10: clothes_selected = 8 break;
	case 11: clothes_selected = 9 break;
	case 15: clothes_selected = 10 break;
	case 12: 
		switch obj_player.pattern_spr
		{
			case pat_funny: clothes_selected = 11 break;
			case pat_itchy: clothes_selected = 12 break;
			case pat_pizza: clothes_selected = 13 break;
			case pat_stripes: clothes_selected = 14 break;
			case pat_goldemanne: clothes_selected = 15 break;
			case pat_bones: clothes_selected = 16 break;
			case pat_pp: clothes_selected = 17 break;
			case pat_war: clothes_selected = 18 break;
			case pat_john: clothes_selected = 19 break;
			case pat_candy: clothes_selected = 20 break;
			case pat_bloodstained: clothes_selected = 21 break;
			case pat_autumn: clothes_selected = 22 break;
			case pat_pumpkin: clothes_selected = 23 break;
			case pat_fur: clothes_selected = 24 break;
			case pat_eyes: clothes_selected = 25 break;
		}
		break;
}
//hopefully theres a better way to map these

alph = 0

function make_clothes_inst(_name, _desc, _pal_ix, _pattern = noone) constructor
{
	name = _name
	description = _desc
	pal_ix = _pal_ix
	pattern = _pattern
}
