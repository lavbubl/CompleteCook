enum DATA_TYPE
{
	STRING = 1,
	BOOL = 2,
	INT32 = 3,
	INT64 = 4,
	STRUCT = 5,
	UNDEFINED = 6,
	ARRAY = 7,
	NUMBER = 8,
	REF = 9,
	METHOD = 10,
	
}; 

function write_struct_to_buffer(_struct)
{
	var names = struct_get_names(_struct);
	array_sort(names, true);
	
	var stringBuffer = buffer_create(1, buffer_grow, 1);
	buffer_seek(stringBuffer, buffer_seek_start, 0);
	// lets write all of the strings
	for (var i = 0; i < array_length(names); i++)
	{
		var currentName = names[i];
		
		buffer_write(stringBuffer, buffer_string, currentName);
	}
	
	// create the main buffer
	var dataBuffer = buffer_create(1, buffer_grow, 1);
	buffer_seek(dataBuffer, buffer_seek_start, 0);
	
	
	// Reserve 4 bytes for the string chunk offset / size of data chunk
	buffer_write(dataBuffer, buffer_u32, 0);
	
	// write the total number of values inside the struct
	buffer_write(dataBuffer, buffer_u16, array_length(names));
	
	
	for (var i = 0; i < array_length(names); i++)
	{
		// write the index of the name
		buffer_write(dataBuffer, buffer_u16, i);
		// the value of the data
		save_value_to_buffer(dataBuffer, _struct[$ names[i]]);
	}
	
	var currentSeekPosition = buffer_get_size(dataBuffer);
	
	// put length of data chunk at start of file
	buffer_seek(dataBuffer, buffer_seek_start, 0);
	buffer_write(dataBuffer, buffer_u32, currentSeekPosition);
	
	
	buffer_seek(dataBuffer, buffer_seek_end, 0);
	buffer_copy(stringBuffer, 0, buffer_get_size(stringBuffer), dataBuffer, buffer_tell(dataBuffer));
	
	// kill the buffer
	buffer_delete(stringBuffer);
	
	buffer_seek(dataBuffer, buffer_seek_start, 0);
	return dataBuffer;
}

function read_struct_from_buffer(_buffer)
{
	buffer_seek(_buffer, buffer_seek_start, 0);
	// read data chunk length
	var stringChunkLocation = buffer_read(_buffer, buffer_u32);
	// read struct value count
	var nameCount = buffer_read(_buffer, buffer_u16);
	
	var savedPosition = buffer_tell(_buffer);
	
	// go to the string chunk
	buffer_seek(_buffer, buffer_seek_start, stringChunkLocation);
	
	// read all of the struct field names
	var names = [];
	while (buffer_tell(_buffer) < buffer_get_size(_buffer))
	{
		array_push(names, buffer_read(_buffer, buffer_string));
	}
	// go to the saved position so we can actually go and read the data now!
	buffer_seek(_buffer, buffer_seek_start, savedPosition);
	// loop through and read all of the data
	var struct = {};
	for (var i = 0; i < nameCount; i++)
	{
		var nameIndex = buffer_read(_buffer, buffer_u16);
		var currentName = names[nameIndex];
		struct[$ currentName] = read_value_from_buffer(_buffer);
	}
	
    buffer_delete(_buffer);
    
	return struct;
}

function save_value_to_buffer(_buffer, _value)
{
	var _type = typeof(_value)
	switch (_type)
	{
		case "number":
			buffer_write(_buffer, buffer_u8, DATA_TYPE.NUMBER);
			buffer_write(_buffer, buffer_f64, _value);
			break;
		case "string":
			buffer_write(_buffer, buffer_u8, DATA_TYPE.STRING);
			buffer_write(_buffer, buffer_string, _value);
			break;
		case "array":
			buffer_write(_buffer, buffer_u8, DATA_TYPE.ARRAY);
			// write length
			buffer_write(_buffer, buffer_u16, array_length(_value));
			for (var i = 0; i < array_length(_value); i++)
				save_value_to_buffer(_buffer, _value[i]);
			break;
		case "bool":
			buffer_write(_buffer, buffer_u8, DATA_TYPE.BOOL);
			buffer_write(_buffer, buffer_bool, _value);
			break;
		case "int32":
			buffer_write(_buffer, buffer_u8, DATA_TYPE.INT32);
			buffer_write(_buffer, buffer_s32, _value);
			break;
		case "int64":
			buffer_write(_buffer, buffer_u8, DATA_TYPE.INT64);
			buffer_write(_buffer, buffer_f64, _value); // s64 doesnt exist
			break;
		case "struct":
			buffer_write(_buffer, buffer_u8, DATA_TYPE.STRUCT);
			var buf = write_struct_to_buffer(_value);
			buffer_write(_buffer, buffer_u32, buffer_get_size(buf)); // write length
			buffer_copy(buf, 0, buffer_get_size(buf), _buffer, buffer_tell(_buffer));
			buffer_seek(_buffer, buffer_seek_start, buffer_tell(_buffer) + buffer_get_size(buf));
			buffer_delete(buf);
			break;
		case "undefined":
			buffer_write(_buffer, buffer_s8, DATA_TYPE.UNDEFINED);
			buffer_write(_buffer, buffer_s8, _value);
			break;
		case "ref":
			buffer_write(_buffer, buffer_s8, DATA_TYPE.REF);
			buffer_write(_buffer, buffer_string, asset_from_ref(string(_value)));
			break;
		case "method":
			buffer_write(_buffer, buffer_s8, DATA_TYPE.METHOD);
			buffer_write(_buffer, buffer_s8, noone);
			break;
		default:
			return show_error($"unimplemented case: \"{_type}\".", true);
	}
}
function read_value_from_buffer(_buffer)
{
	var type = buffer_read(_buffer, buffer_u8);
	var _value = 0;
	
	switch (type)
	{
		case DATA_TYPE.NUMBER: return buffer_read(_buffer, buffer_f64);
		case DATA_TYPE.STRING: return buffer_read(_buffer, buffer_string);
		
		case DATA_TYPE.ARRAY:
			var arrayLength = buffer_read(_buffer, buffer_u16);
			var array = array_create(arrayLength, undefined);
			for (var i = 0; i < arrayLength; i++)
			{
				array[i] = read_value_from_buffer(_buffer);
			}
			return array;
			
		case DATA_TYPE.BOOL: return buffer_read(_buffer, buffer_bool);
		case DATA_TYPE.INT32: return buffer_read(_buffer, buffer_s32);
		case DATA_TYPE.INT64: return buffer_read(_buffer, buffer_f64);
		
		case DATA_TYPE.STRUCT:
			var size = buffer_read(_buffer, buffer_u32);
			var temp_buf = buffer_create(size, buffer_fixed, 1);
			buffer_copy(_buffer, buffer_tell(_buffer), size, temp_buf, 0);
			buffer_seek(_buffer, buffer_seek_relative, size);
			return read_struct_from_buffer(temp_buf);
			
		case DATA_TYPE.UNDEFINED: return buffer_read(_buffer, buffer_s8);
		case DATA_TYPE.REF: return asset_get_index(buffer_read(_buffer, buffer_string));
		case DATA_TYPE.METHOD: return buffer_read(_buffer, buffer_s8);
	}
	return _value;
}

function asset_from_ref(_ref)
{
	if (!is_string(_ref))
		_ref = string(_ref);
	var data = string_split(_ref, " ", true);
	// ref {assetname} {id}
	var assetType = data[1];
	var index = data[2]
	switch (assetType)
	{
		case "object": return object_get_name(real(index));
		case "sprite": return sprite_get_name(real(index));
		case "room": return room_get_name(real(index));
		case "path": return path_get_name(real(index));
		case "script": return script_get_name(real(index));
		case "shader": return shader_get_name(real(index));
		case "font": return font_get_name(real(index));
		case "audio": return audio_get_name(real(index));
		case "tileset": return tileset_get_name(real(index));
		case "timeline": return timeline_get_name(real(index));
		default: return show_error($"unimplemented case: {data[2]}.", true);
	}
}