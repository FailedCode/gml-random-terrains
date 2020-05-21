/// @description Transform the array values so that the lowest value is 0 and the highest 1
/// @param {array} input
/// @param {float} factor

var inputArray = argument[0];

var factor = 1.0;
if (argument_count > 1) {
	var factor = argument[1];
}

// step one: find lowest an highest values
var bounds = getExtremaValuesArray2D(inputArray);
var valueMin = bounds[0];
var valueMax = bounds[1];

if (valueMin == 0 && valueMax == real(factor)) {
	//show_debug_message("no normalizing needed");
	return inputArray;
}

// subtract the lowest values from all elements to set the lowest value to 0
// divide all elements by the highest value to put them in the 0-1 range
// multiply by the users chosen factor
var outputArray;
for(var yy = 0; yy < array_height_2d(inputArray); yy += 1) {
	for(var xx = 0; xx < array_length_2d(inputArray, yy); xx += 1) {
		var value = inputArray[yy, xx];
		value -= valueMin;
		value /= (valueMax - valueMin);
		value *= factor;
		outputArray[yy, xx] = value;
	}
}

return outputArray;