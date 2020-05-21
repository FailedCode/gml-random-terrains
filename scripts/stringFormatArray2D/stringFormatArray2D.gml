/// @description Format array for output
/// @param {array} input

var inputArray = argument[0];

if (!is_array(inputArray)) {
	return "[Not an Array]";
}

var output = "\n\r";
for(var yy = 0; yy < array_height_2d(inputArray); yy += 1) {
	for(var xx = 0; xx < array_length_2d(inputArray, yy); xx += 1) {
		output += string(inputArray[yy, xx]);
		if (xx != array_length_2d(inputArray, yy) - 1) {
			output += ", ";
		}
	}
	output += "\n\r";
}

return output;