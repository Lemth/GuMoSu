///@desc initBuffers()
/*
var latitudeBands = 30;
var longitudeBands = 30;
var radius = 2;

var vertexPositionData = [];
var normalData = [];
var textureCoordData = [];
for (var latNumber=0; latNumber <= latitudeBands; latNumber++) {
    var theta = latNumber * pi / latitudeBands;
    var sinTheta = sin(theta);
    var cosTheta = cos(theta);

    for (var longNumber=0; longNumber <= longitudeBands; longNumber++) {
        var phi = longNumber * 2 * pi / longitudeBands;
        var sinPhi = sin(phi);
        var cosPhi = cos(phi);

        var x = cosPhi * sinTheta;
        var y = cosTheta;
        var z = sinPhi * sinTheta;
        var u = 1 - (longNumber / longitudeBands);
        var v = 1 - (latNumber / latitudeBands);

        normalData.push(x);
        normalData.push(y);
        normalData.push(z);
        textureCoordData.push(u);
        textureCoordData.push(v);
        vertexPositionData.push(radius * x);
        vertexPositionData.push(radius * y);
        vertexPositionData.push(radius * z);
    }
}

var indexData = [];
for (var latNumber=0; latNumber < latitudeBands; latNumber++) {
    for (var longNumber=0; longNumber < longitudeBands; longNumber++) {
        var first = (latNumber * (longitudeBands + 1)) + longNumber;
        var second = first + longitudeBands + 1;
        indexData.push(first);
        indexData.push(second);
        indexData.push(first + 1);

        indexData.push(second);
        indexData.push(second + 1);
        indexData.push(first + 1);
    }
}

moonVertexNormalBuffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, moonVertexNormalBuffer);
gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(normalData), gl.STATIC_DRAW);
moonVertexNormalBuffer.itemSize = 3;
moonVertexNormalBuffer.numItems = normalData.length / 3;

moonVertexTextureCoordBuffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, moonVertexTextureCoordBuffer);
gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(textureCoordData), gl.STATIC_DRAW);
moonVertexTextureCoordBuffer.itemSize = 2;
moonVertexTextureCoordBuffer.numItems = textureCoordData.length / 2;

moonVertexPositionBuffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, moonVertexPositionBuffer);
gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertexPositionData), gl.STATIC_DRAW);
moonVertexPositionBuffer.itemSize = 3;
moonVertexPositionBuffer.numItems = vertexPositionData.length / 3;

moonVertexIndexBuffer = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, moonVertexIndexBuffer);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, new Uint16Array(indexData), gl.STATIC_DRAW);
moonVertexIndexBuffer.itemSize = 1;
moonVertexIndexBuffer.numItems = indexData.length;
*/