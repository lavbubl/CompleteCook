#macro DEADZONE 0.2 // the deadzone for analog input

// the type of input
enum INPUT_TYPE
{
	KEYBOARD,
	CONTROLLER,
	MOUSE
}

// flags for choosing what ways to check input.
enum INPUT_FLAGS
{
    CHECK = 1,
    PRESSED = 2,
    RELEASED = 4,
    VALUE = 8, // for analog
    
    ALL = INPUT_FLAGS.CHECK | INPUT_FLAGS.PRESSED | INPUT_FLAGS.RELEASED | INPUT_FLAGS.VALUE
}

// analog stick constants
#macro stick_left_up    20001
#macro stick_left_down  20002
#macro stick_left_left  20003
#macro stick_left_right 20004

#macro stick_right_up    20005
#macro stick_right_down  20006
#macro stick_right_left  20007
#macro stick_right_right 20008

global.input_map = {};

///@description Constructs an input array.
///@param {Array.Real} _input_keyboard The keyboard values to check for input. e.g: keyboard_check(_input_keyboard)
///@param {Array.Real} _input_controller The gamepad values to check for input. e.g: gamepad_button_check(_device, _input_controller)
///@param {Array.Real} _input_mouse The mouse values to check for input. e.g: mouse_check_button(_input_mouse)
function construct_input_array(_input_keyboard = [], _input_controller = [], _input_mouse = [])
{
    var _input = array_create(3, undefined);
    _input[INPUT_TYPE.KEYBOARD] = _input_keyboard;
    _input[INPUT_TYPE.CONTROLLER] = _input_controller;
    _input[INPUT_TYPE.MOUSE] = _input_mouse;
    
    return _input;
}

///@description Declares an input constant
///@param {String} _input_name The name of the input, when adding this as an input to an InputHandler, this will be the name you refer to it as.
///@param {Array.Real} _input_keyboard The keyboard values to check for input. e.g: keyboard_check(_input_keyboard)
///@param {Array.Real} _input_controller The gamepad values to check for input. e.g: gamepad_button_check(_device, _input_controller)
///@param {Array.Real} _input_mouse The mouse values to check for input. e.g: mouse_check_button(_input_mouse)
function declare_input(_input_name, _input_array = construct_input_array())
{
    global.input_map[$ _input_name] = _input_array;
}

///@description Change an input key declared by declare_input().
///@param {String} _input_name The name (key) of the input.
///@param {Real} _input The value to change.
///@param {Real} _type The type of the input, see INPUT_TYPE.
function change_input(_input_name, _input, _type)
{
    global.input_map[$ _input_name][_type] = _input;
}

///@description A device used for input.
///@param {Real} _input_type The type of input the device uses, see INPUT_FLAGS.
///@param {Real} _index The index of the input device, if it has one.
function InputDevice(_input_type = INPUT_TYPE.KEYBOARD, _index = -1) constructor 
{
    input_type = _input_type;
    index = _index;
    // set deadzone
    if (input_type == INPUT_TYPE.CONTROLLER)
        gamepad_set_axis_deadzone(index, DEADZONE);
}

///@description Data about the current input
///@param {Bool} _check Whether a _check function returned true.
///@param {Bool} _pressed Whether a _check_pressed function returned true.
///@param {Bool} _released Whether a _check_released function returned true.
///@param {Bool} _value The current positional data for the analog stick.
function InputData(_check, _pressed, _released, _value) constructor 
{
    check = _check;
    pressed = _pressed;
    released = _released;
    value = _value;
}

///@description The handler for inputs.
///@param {Struct.InputDevice} _device Information about the target input device.
function InputHandler(_device = obj_inputcontroller.keyboard_device) constructor 
{
    device = _device;
    inputs = {};
    
    // for GC
    to_cleanup = false;
    
    ///@description Gets data about the input
    ///@returns {Struct.InputData} The current state of the input
    static get_input = function(_input_name)
    {
        return inputs[$ _input_name]; 
    }
    
    ///@description Update every Input instance inside of inputs.
    static update = function()
    {
        struct_foreach(inputs, function(_name, _value)
        {
            _value.update();
        });
    }
    
    ///@description Used for checking inputs on a specific key.
    ///@param {String} _input_name The name of the input, declared by declare_input().
    ///@param {Struct.InputDevice} _device Information about the input device.
    ///@param {Real} _flags Flags for what to actually check input for, see INPUT_FLAGS.
    static Input = function(_input_name, _device, _flags) constructor 
    {
        input_name = _input_name;
        device = _device;
        flags = _flags;
        
        __mapping_ref = global.input_map[$ input_name];
        
        // declare input values
        check = false;
        pressed = false;
        released = false;
        value = 0; // -1 to 1
        __pad_check = false; // this is specifically to get release to work
        
        __flag_do_check = (flags & INPUT_FLAGS.CHECK);
        __flag_do_pressed = (flags & INPUT_FLAGS.PRESSED);
        __flag_do_released = (flags & INPUT_FLAGS.RELEASED);
        __flag_do_analog = (flags & INPUT_FLAGS.VALUE);
        
        ///@description Check input
        static update = function()
        {
            // store previous to emulate pressed and released on analog
            var _prev_check = check;
            var _prev_pad_check = __pad_check;
            
            // reset
            check = false;
            pressed = false;
            released = false;
            value = 0;
            
            __pad_check = false;
            
            if (__mapping_ref == undefined)
            {
                return;    
            }
            
            // keyboard
            var _kb_keys = __mapping_ref[INPUT_TYPE.KEYBOARD];
            if (_kb_keys != undefined)
            {
                for (var i = 0; i < array_length(_kb_keys); i++)
                {
                    var _k = _kb_keys[i];
                    if (__flag_do_check) check = check || keyboard_check(_k);
                    if (__flag_do_pressed) pressed = pressed || keyboard_check_pressed(_k);
                    if (__flag_do_released) released = released || keyboard_check_released(_k);
                }
                // spoof analog
                value = max(value, real(check));
            }
            
            // mouse
            var _ms_keys = __mapping_ref[INPUT_TYPE.MOUSE];
            if (_ms_keys != undefined)
            {
                for (var i = 0; i < array_length(_ms_keys); i++)
                {
                    var _m = _ms_keys[i];
                    if (__flag_do_check) check = check || mouse_check_button(_m);
                    if (__flag_do_pressed) pressed = pressed || mouse_check_button_pressed(_m);
                    if (__flag_do_released) released = released || mouse_check_button_released(_m);
                }
                // spoof analog
                value = max(value, real(check));
            }
            
            // gamepad
            if (device.input_type == INPUT_TYPE.CONTROLLER)
            {
                var _pad_keys = __mapping_ref[INPUT_TYPE.CONTROLLER];
                if (_pad_keys != undefined)
                {
                    var _pad_index = device.index;
                    
                    for (var i = 0; i < array_length(_pad_keys); i++)
                    {
                        var _p = _pad_keys[i]; // The specific button/axis to check
                        var _axis_val = 0;
                        var _is_directional_axis = false;
                        
                        var _current_pad_check = false;
                        var _current_pad_pressed = false;
                        var _current_pad_released = false;
                        var _current_pad_val = 0;
                        
                        switch (_p)
                        {
                            case stick_left_up:    _axis_val = -gamepad_axis_value(_pad_index, gp_axislv); _is_directional_axis = true; break;
                            case stick_left_down:  _axis_val =  gamepad_axis_value(_pad_index, gp_axislv); _is_directional_axis = true; break;
                            case stick_left_left:  _axis_val = -gamepad_axis_value(_pad_index, gp_axislh); _is_directional_axis = true; break;
                            case stick_left_right: _axis_val =  gamepad_axis_value(_pad_index, gp_axislh); _is_directional_axis = true; break;
                            
                            case stick_right_up:    _axis_val = -gamepad_axis_value(_pad_index, gp_axisrv); _is_directional_axis = true; break;
                            case stick_right_down:  _axis_val =  gamepad_axis_value(_pad_index, gp_axisrv); _is_directional_axis = true; break;
                            case stick_right_left:  _axis_val = -gamepad_axis_value(_pad_index, gp_axisrh); _is_directional_axis = true; break;
                            case stick_right_right: _axis_val =  gamepad_axis_value(_pad_index, gp_axisrh); _is_directional_axis = true; break;
                        }
                        
                        if (_is_directional_axis) 
                        {
                            if (__flag_do_analog) _current_pad_val = max(0, _axis_val); 
                            if (__flag_do_check) _current_pad_check = _current_pad_val > gamepad_get_axis_deadzone(_pad_index); 
                            
                            // calculate pressed and released
                            if (__flag_do_pressed) _current_pad_pressed = (_current_pad_check && !_prev_pad_check);
                            if (__flag_do_released) _current_pad_released = (!_current_pad_check && _prev_pad_check);
                        } 
                        else if (_p >= gp_axislh && _p <= gp_axisrv) 
                        {
                            // fallback
                            if (__flag_do_analog) _current_pad_val = gamepad_axis_value(_pad_index, _p);
                            if (__flag_do_check) _current_pad_check = abs(_current_pad_val) > 0.2; 
                        }
                        else 
                        {
                            // the normal buttons
                            if (__flag_do_check) _current_pad_check = gamepad_button_check(_pad_index, _p);
                            if (__flag_do_pressed) _current_pad_pressed = gamepad_button_check_pressed(_pad_index, _p);
                            if (__flag_do_released) _current_pad_released = gamepad_button_check_released(_pad_index, _p);
                            
                            _current_pad_val = real(_current_pad_check);
                        }
                        
                        // Accumulate the checks for multibinds
                        __pad_check = __pad_check || _current_pad_check;
                        check = check || _current_pad_check;
                        pressed = pressed || _current_pad_pressed;
                        released = released || _current_pad_released;
                        value = max(value, _current_pad_val);
                    }
                }
            }
        }
    }
    
    ///@description Adds an input to the inputs array.
    ///@param {String} _input_name The name of the input, declared by declare_input(). Optionally supports an array of names.
    ///@param {Real} _flags Flags for what to actually check input for, see INPUT_FLAGS.
    static AddInput = function(_input_name, _flags = INPUT_FLAGS.ALL)
    {
        // if its an array, then iterate through all
        if (is_array(_input_name))
        {
            for (var i = 0; i < array_length(_input_name); i++)
                AddInput(_input_name[i], _flags);
        }
        else
        {
            inputs[$ _input_name] = new Input(_input_name, self.device, _flags);
        }
        
        return self;
    }
    
    ///@description Finalize the InputHandler, pushes it to obj_inputcontroller.
    static Finalize = function()
    {
        array_push(obj_inputcontroller.handler_instances, self);
        return self;
    }
    
    ///@description Mark the InputHandler for garbage collection on the next frame.
    static Cleanup = function()
    {
        to_cleanup = true;
    }

}
