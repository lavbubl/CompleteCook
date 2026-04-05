/*

    Put me in the init room!

*/

// ensure only one of me exists
if (instance_number(obj_inputcontroller) > 1)
{
    instance_destroy();
    exit;
}

devices = []; // the devices that are used for input, this can be controllers, keyboard input, etc.
handler_instances = []; // the instances of InputHandlers that will be updated at begin step.

// jsdoc inside of the anonymous functions because of event naming issues

device_add = function(_input_device)
{
    ///@description Add a device
    ///@param {Struct.InputDevice} _input_device The InputDevice to push to the devices.
    array_push(devices, _input_device);
}

device_remove = function(_index)
{
    ///@description Remove a device
    ///@param {Real} _index The index of the array to delete.
    array_delete(devices, _index, 1);
}

gamepad_find = function(_gamepad_id)
{
    ///@description Finds the position of a gamepad in the devices
    ///@param {Real} _gamepad_id The gamepad index to look for.
    for (var i = 0; i < array_length(devices); i++)
    {
        var _device = devices[i];
        if (_device.index == _gamepad_id && _device.input_type == INPUT_TYPE.CONTROLLER)
            return i;
    }
    return -1;
}

// add a device for the main keyboard input
keyboard_device = new InputDevice(); // always at index 0
device_add(keyboard_device);

// always add main gamepad so it can be referenced immediately in other parts
main_gamepad = new InputDevice(INPUT_TYPE.CONTROLLER, 0);
device_add(main_gamepad);


