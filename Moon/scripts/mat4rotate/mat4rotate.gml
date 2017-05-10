///@desc mat4rotate(a,b,c,d)

var count = argument_count;
if(count>0) {
	var a=argument[0];
	count--;
}
if(count>0) {
	var b=argument[1];
	count--;
}
if(count>0) {
	var c=argument[2];
	count--;
}
if(count>0) {
	var d=argument[3];
	count--;
} else {
	var d=[];
}


var e = c[0];
var g = c[1];
c = c[2];
var f = sqrt(e * e + g * g + c * c);
if (!f) {
	exit;
}
if (f != 1) {
	f = 1 / f;
	e *= f;
	g *= f;
	c *= f
}
var h = sin(b), i = cos(b), j = 1 - i;
b = a[0];
f = a[1];
var k = a[2];
var l = a[3];
var o = a[4];
var m = a[5];
var n = a[6];
var p = a[7];
var r = a[8];
var s = a[9];
var A = a[10];
var B = a[11];
var t = e * e * j + i;
var u = g * e * j + c * h;
var v = c * e * j - g * h;
var w = e * g * j - c * h
var xx = g * g * j + i;
var yy = c * g * j + e * h;
var z = e * c * j + g * h;
e = g * c * j - e * h;
g = c * c * j + i;
if (is_matrix(d)) {
	if (a != d) {
		d[12] = a[12];
		d[13] = a[13];
		d[14] = a[14];
		d[15] = a[15];
	}
} else {
	d = matrix_multiply(a,matrix_build_identity());
}
d[0] = b * t + o * u + r * v;
d[1] = f * t + m * u + s * v;
d[2] = k * t + n * u + A * v;
d[3] = l * t + p * u + B * v;
d[4] = b * w + o * xx + r * yy;
d[5] = f * w + m * xx + s * yy;
d[6] = k * w + n * xx + A * yy;
d[7] = l * w + p * xx + B * yy;
d[8] = b * z + o * e + r * g;
d[9] = f * z + m * e + s * g;
d[10] = k * z + n * e + A * g;
d[11] = l * z + p * e + B * g;
return d;