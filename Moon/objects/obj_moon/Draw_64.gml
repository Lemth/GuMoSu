var str="mvMatrix: ";
for(var i=0;i<array_length_1d(mvMatrix);i++) {
	str+=string(mvMatrix[i])+" ";
}
draw_text(10,10,str);

var str="pMatrix: ";
for(var i=0;i<array_length_1d(pMatrix);i++) {
	str+=string(pMatrix[i])+" ";
}
draw_text(10,30,str);

var str="moonRotationMatrix: ";
for(var i=0;i<array_length_1d(moonRotationMatrix);i++) {
	str+=string(moonRotationMatrix[i])+" ";
}
draw_text(10,50,str);