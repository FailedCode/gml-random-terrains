/// @description Mix adjacent array values
/// @param {array} input

var inputArray = argument[0];

var outputArray;
for(var yy = 0; yy < array_height_2d(inputArray); yy += 1) {
	for(var xx = 0; xx < array_length_2d(inputArray, yy); xx += 1) {
		var yMax = array_height_2d(inputArray);
		var xMax = array_length_2d(inputArray, yy);
		var xa1 = (xx + 1 + xMax) mod xMax;
		var xs1 = (xx - 1 + xMax) mod xMax;
		var ya1 = (yy + 1 + yMax) mod yMax;
		var ys1 = (yy - 1 + yMax) mod yMax;
		
		var v;
		v[0] = inputArray[yy, xx];
		v[1] = inputArray[ya1, xa1];
		v[2] = inputArray[ya1, xs1];
		v[3] = inputArray[ys1, xa1];
		v[4] = inputArray[ys1, xs1];
		v[5] = inputArray[yy, xa1];
		v[6] = inputArray[yy, xs1];
		v[7] = inputArray[ya1, xx];
		v[8] = inputArray[ys1, xx];
		
		// mix adjacent values but let the current value still dominate
		outputArray[yy, xx] = (8 * v[0] + v[1] + v[2] + v[3] + v[4] + v[5] + v[6] + v[7] + v[8]) / 16.0;
	}
}

return outputArray;