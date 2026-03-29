depth = -3000

input_handler = new InputHandler(obj_inputcontroller.main_gamepad).AddInput(["ui_accept", "ui_deny", "ui_left", "ui_right"]).Finalize();

update_input = function()
{
    ui_accept = input_handler.get_input("ui_accept");
    ui_deny = input_handler.get_input("ui_deny");
    left = input_handler.get_input("ui_left");
    right = input_handler.get_input("ui_right");
}

ui_accept = false;
ui_deny = false;
left = false;
right = false;

timer = 60 * 5; // 5 seconds

confirm = false;
