/// @description Generate an array via Simplex noise algorithm
/// @param {int} xsb
/// @param {int} ysb
/// @param {float} dx
/// @param {float} dy
/// @param {array} perm
// Based on the Implementation by Kurt Spencer
// https://gist.github.com/KdotJPG/b1270127455a94ac5d19

var xsb = argument[0];
var ysb = argument[1];
var dx = argument[2];
var dy = argument[3];
var perm = argument[4];

var gradients2D = [
	5, 2, 2, 5,
	-5, 2, -2, 5,
	5, -2, 2, -5,
	-5, -2, -2, -5,
];

var index = perm[(perm[xsb & 0xFF] + ysb) & 0xFF] & 0x0E;
return gradients2D[index] * dx + gradients2D[index + 1] * dy;