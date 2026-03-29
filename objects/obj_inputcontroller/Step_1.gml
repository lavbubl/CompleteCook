for (var i = 0; i < array_length(handler_instances); i++)
{
    var _handler = handler_instances[i];
    if (_handler.to_cleanup)
    {
        array_delete(handler_instances, i--, 1);
        continue;
    }
    _handler.update();
}

