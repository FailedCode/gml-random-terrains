/// @description create a 2d Array with random numbers [0-1]
/// @param {int} size square size
/// @param {float} factor multiplyed with the value, default 1

var size = argument[0];

var factor = 1.0;
if (argument_count > 1) {
	var factor = argument[1];
}

map[size, size] = 0;

for(var yy = 0; yy <= size; yy += 1) {
	for(var xx = 0; xx <= size; xx += 1) {
		map[yy, xx] = factor * random(1.0)
	}
}

return map;