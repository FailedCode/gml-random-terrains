/// @description Fix DPI, centers window

// Take DPI into account and reset window size
var w = window_get_width();
var h = window_get_height();
var dpixf = display_get_dpi_x()/96;
var dpiyf = display_get_dpi_y()/96;

// scale up
var userFactor = 1.0;
var wSize = w * dpixf * userFactor;
var hSize = h * dpiyf * userFactor;

window_set_size(wSize, hSize);
window_set_position((display_get_width() - wSize)/2, (display_get_height() - hSize)/2);