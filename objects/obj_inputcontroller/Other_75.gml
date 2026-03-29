var _type = async_load[? "event_type"];
var _index;

if (_type == "gamepad discovered")
{
    _index = async_load[? "pad_index"];
    
    // if theres no gamepad connected yet, we use the one created earlier
    // handles cases where the gamepad is at a weird index
    if (!gamepad_is_connected(main_gamepad.index))
    {
        main_gamepad.index = _index;
        gamepad_set_axis_deadzone(_index, DEADZONE);
    }
    else
    {
        // if the main gamepad is occupied add this as a new device
        if (gamepad_find(_index) == -1) 
            device_add(new InputDevice(INPUT_TYPE.CONTROLLER, _index));
    }
}
else if (_type == "gamepad lost")
{
    _index = async_load[? "pad_index"];
    device_remove(gamepad_find(_index));
}