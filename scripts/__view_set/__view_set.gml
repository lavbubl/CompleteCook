function __view_set(__prop, __index, __val)
{
	__view_set_internal(__prop, __index, __val)
	var __res = __view_get(__prop, __index)
	return __res;
}
