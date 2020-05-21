
if (keyboard_check_pressed(vk_escape)) {
	game_end();
}

showHelp = false;
if (keyboard_check(vk_f1) || keyboard_check(ord("1"))) {
	showHelp = true;
}

if (keyboard_check_pressed(ord("Q"))) {
	selectedDisplayType = (selectedDisplayType + 1) mod displayTypes.wrap;
}
if (keyboard_check_pressed(ord("A"))) {
	selectedDisplayType = (selectedDisplayType - 1 + displayTypes.wrap) mod displayTypes.wrap;
}


if (keyboard_check_pressed(ord("W"))) {
	selectedGeneratorType = (selectedGeneratorType + 1) mod generatorTypes.wrap;
	window_set_caption("Generator: " + global.generatorNames[selectedGeneratorType]);
}
if (keyboard_check_pressed(ord("S"))) {
	selectedGeneratorType = (selectedGeneratorType - 1 + generatorTypes.wrap) mod generatorTypes.wrap;
	window_set_caption("Generator: " + global.generatorNames[selectedGeneratorType]);
}

var recalc = false;
if (keyboard_check_pressed(ord("E")) && tileSize < 64) {
	tileSize *= 2;
	tileNumber = window_get_width() / tileSize;
	recalc = true;
}
if (keyboard_check_pressed(ord("D")) && tileSize > 4) {
	tileSize /= 2;
	tileNumber = window_get_width() / tileSize;
	recalc = true;
}

if (keyboard_check_pressed(vk_space) || recalc) {
	switch (selectedGeneratorType) {
	  case generatorTypes.rand:
	    heightmap = generateRandom(tileNumber, 255);
		break;
	  case generatorTypes.diamondsquare:
	    heightmap = generateDiamondSquare(tileNumber, 255);
		break;
	  case generatorTypes.simplex:
	    heightmap = generateSimplexNoise2D(tileNumber, 8, 255);
		break;
	}
}

if (keyboard_check_pressed(vk_tab)) {
	heightmap = blurValuesArray2D(heightmap);
}
