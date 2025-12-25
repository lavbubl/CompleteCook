lb_pos = wrap(array_length(lb_sprs), lb_pos + 1)

ini_open("globalsave.ini")
ini_write_real("options", "letterbox_index", lb_pos)
ini_close()
