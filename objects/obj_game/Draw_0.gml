
for(var yy = 0; yy < tileNumber; yy += 1) {
	for(var xx = 0; xx < tileNumber; xx += 1) {
		var value = heightmap[yy, xx];

		if (selectedDisplayType == displayTypes.hue) {
			draw_set_colour(make_color_hsv(value, 128, 128));
		} else if (selectedDisplayType == displayTypes.saturation) {
			draw_set_colour(make_color_hsv(140, value, 240));
		} else if (selectedDisplayType == displayTypes.luminosity) {
			draw_set_colour(make_color_hsv(80, 180, value));
		} else if (selectedDisplayType == displayTypes.greyscale) {
			draw_set_colour(make_colour_rgb(value, value, value));
		} else if (selectedDisplayType == displayTypes.terrain) {
			if(value > 0.8 * 255) {
				draw_set_colour(c_white);
			} else if (value > 0.6 * 255) {
				draw_set_colour(c_dkgray);
			} else if (value > 0.4 * 255) {
				draw_set_colour(c_green);
			} else if (value > 0.2 * 255) {
				draw_set_colour(c_teal);
			} else {
				draw_set_colour(c_blue);
			}
		}
		
		draw_rectangle(xx*tileSize, yy*tileSize, xx*tileSize+tileSize, yy*tileSize+tileSize, false);
	}
}
