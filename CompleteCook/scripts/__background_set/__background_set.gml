function __background_set(__prop, __bind, __val)
{
	var __backinfo = __background_get_element(__bind)
	__background_set_internal(__prop, __bind, __val, __backinfo)
	var __res = __background_get_internal(__prop, __bind, __backinfo)
	return __res;
}

