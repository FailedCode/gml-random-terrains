
var helpText = [
	"space: generate new",
	"Q/A  : switch theme",
	"W/S  : switch generator",
	"E/D  : change tilesize (" + string(tileSize) + ")",
	"TAB  : blur",
];
var helpTextLen = array_length_1d(helpText);

if (showHelp) {
	draw_set_colour(c_black);
	draw_rectangle(5, 5, 255, 15 + helpTextLen * 15, false);
	draw_set_colour(c_orange);
	for(var i = 0; i < helpTextLen; i += 1) {
		draw_text(10, 10 + i * 15, helpText[i]);
	}
} else {
	draw_set_colour(c_orange);
	draw_text(10, 10, "F1: help");
}
