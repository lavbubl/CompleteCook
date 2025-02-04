if ds_list_find_index(global.ds_collect, id) == -1 {
    global.score += 10
    ds_list_add(global.ds_collect, id)
    instance_destroy()
}