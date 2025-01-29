if ds_list_find_index(global.ds_destroyables, id) == -1 {
    ds_list_add(global.ds_destroyables, id)
    particle_create(x, y, particles.genericpoof)
}