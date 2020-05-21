/// @description Generate an array via Diamond-square algorithm
/// @param {int} size square size
/// @param {float} factor multiplyed with the value, default 1
// https://en.wikipedia.org/wiki/Diamond-square_algorithm
// https://stackoverflow.com/questions/2755750/diamond-square-algorithm

var size = argument[0];

var factor = 1.0;
if (argument_count > 1) {
	var factor = argument[1];
}

// we need a 2^n+1 array
var calcSize = 0;
var n = 2;
repeat(20) {
	var s = power(2, n) + 1;
	if (s >= size) {
		calcSize = s;
		break;
	}
	n += 1;
}
var maxSize = calcSize - 1;

// initalize array
var map;
for (var i = 0; i < calcSize; i += 1) {
	for (var j = 0; j < calcSize; j += 1) {
		map[i, j] = 0;
	}
}

// seed corners
var heightMax = 1000.0;
map[maxSize-1, maxSize-1] = random(heightMax);
map[0, 0] = random(heightMax);
map[0, maxSize-1] = random(heightMax);
map[maxSize-1, 0] = random(heightMax);

// begin algorithm
for(var stepSize = maxSize; stepSize >= 2; stepSize /= 2) {
	var halfStep = stepSize / 2;
	
	// squares
	for(var xx = 0; xx < maxSize; xx += stepSize){
		for(var yy = 0; yy < maxSize; yy += stepSize){
			var avg = map[xx, yy] +
				map[xx + stepSize, yy] +
				map[xx, yy + stepSize] +
				map[xx + stepSize, yy + stepSize];
			avg /= 4.0;

			map[xx + halfStep, yy + halfStep] = avg + (random(1.0) * 2 * heightMax) - heightMax;
		}
	}
	
	// diamonds
	for(var xx = 0; xx < maxSize; xx += halfStep){
		for(var yy = (xx + halfStep) mod stepSize; yy < maxSize; yy += stepSize){
			var avg = 
				map[(xx - halfStep + maxSize) mod maxSize, yy] +
				map[(xx + halfStep) mod maxSize, yy] +
				map[xx, (yy + halfStep) mod maxSize] +
				map[xx, (yy - halfStep + maxSize) mod maxSize];
			avg /= 4.0;

			avg = avg + (random(1.0) * 2 * heightMax) - heightMax;
			map[xx, yy] = avg;

			if(xx == 0) {
				map[maxSize, yy] = avg;
			}
			if(yy == 0) {
				map[xx, maxSize] = avg;
			} 
		}
	}
	
	heightMax /= 2;
}

// fast-pass: if the requestet size is the calculated, no copy needed
if (size == calcSize) {
	return normalizeArray2D(map, factor);
}

// only return the size required
var resultMap;
resultMap[size-1, size-1] = 0;
for(var yy = 0; yy < size; yy += 1) {
	for(var xx = 0; xx < size; xx += 1) {
		resultMap[yy, xx] = map[yy, xx];
	}
}

return normalizeArray2D(resultMap, factor);