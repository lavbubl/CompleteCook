/*

    Declare your inputs here!

*/
/*
declare_input("up", construct_input_array([vk_up], [stick_left_up]));
declare_input("down", construct_input_array([vk_down], [stick_left_down]));
declare_input("left", construct_input_array([vk_left], [stick_left_left]));
declare_input("right", construct_input_array([vk_right], [stick_left_right]));
declare_input("jump", construct_input_array([ord("Z")], [gp_face1]));
declare_input("grab", construct_input_array([ord("X")], [gp_face2]));
declare_input("dash", construct_input_array([vk_shift], [gp_shoulderrb]));
declare_input("taunt", construct_input_array([ord("C")], [gp_face4]));
declare_input("superjump", construct_input_array([vk_nokey]));
declare_input("groundpound", construct_input_array([vk_nokey]));
declare_input("ui_up", construct_input_array([vk_up], [stick_left_up]));
declare_input("ui_down", construct_input_array([vk_down], [stick_left_down]));
declare_input("ui_left", construct_input_array([vk_left], [stick_left_left]));
declare_input("ui_right", construct_input_array([vk_right], [stick_left_right]));
declare_input("ui_accept", construct_input_array([ord("Z"), vk_enter, vk_escape], [gp_face1]));
declare_input("ui_deny", construct_input_array([ord("X"), vk_escape, vk_backspace], [gp_face2]));


// static binds, should not be changed
// obj_keyconfig
declare_input("addbind", construct_input_array([ord("Z")], [gp_face1]));
declare_input("clearbind", construct_input_array([ord("C")], [gp_face2]));
declare_input("resetallbinds", construct_input_array([vk_f1], [gp_select]));
