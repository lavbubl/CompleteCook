winw = window_get_width();
winh = window_get_height();
apph = min(winh, winw * (540 / 960));
appw = min(apph * (960 / 540), winw);
appx = ((winw - appw) / 2);
appy = ((winh - apph) / 2);
appa = 1;
