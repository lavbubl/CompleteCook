var _x = savedx - savedcx;
var _y = savedy - savedcy;
while _x > screen_w - 100
	_x -= 20
while _y > screen_h - 100
	_y -= 20
while _x < 100
	_x += 20
while _y < 100
	_y += 20
with (instance_create(_x, _y, obj_shakeanddie))
	sprite_index = spr_pizzaface_dead
//fmod_event_one_shot_3d("event:/sfx/misc/explosion", _x, _y);
//fmod_event_one_shot_3d("event:/sfx/pep/groundpound", _x, _y);
scr_sound(sfx_groundpound)
