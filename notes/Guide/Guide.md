So theres some changes and general pointers i need to give so you can understand this engine:

- first things obj_door[letter] has been replaced with obj_doorpoint and you must change
a variable definition called spawn, although stuff like obj_door and obj_hallway basically work the 
same, just targetRoom is a variable definition called t_room.

- ive tried to simplify enemies, theres a function called do_enemy_generics() and you just gotta 
sandwich code between that and collide() if you need to, in the create event you just do event inhereted 
and set variables in the sprs struct and add states with:

states_struct.x = {x: e_states.x, func: enemy_x}.

- You dont need to set the view port size in rooms, obj_camera already does that, you only need to set
it to visible.

---------------------------------------------------------------

Guide unfinished, i most likely am missing explanations.
