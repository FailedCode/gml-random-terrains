
DPIscaling();

randomize();
showHelp = false;

enum displayTypes {
  hue,
  saturation,
  luminosity,
  greyscale,
  terrain,
  wrap
}
selectedDisplayType = displayTypes.terrain;

enum generatorTypes {
  rand,
  diamondsquare,
  simplex,
  wrap
}
selectedGeneratorType = generatorTypes.simplex;

global.generatorNames = [
  "Random",
  "Diamond Square",
  "Simplex Noise"
];
window_set_caption("Generator: " + global.generatorNames[selectedGeneratorType]);

tileSize = 16;
tileNumber = window_get_width() / tileSize;

heightmap = generateSimplexNoise2D(tileNumber, 8, 255);