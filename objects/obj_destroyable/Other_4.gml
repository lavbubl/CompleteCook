if ds_list_find_index(global.ds_destroyables, id) != -1 {
    instance_destroy();
    exit;
}
