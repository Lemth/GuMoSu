moonTexture = sprite_get_texture(sprite_index,0);

mvMatrix = matrix_build_identity();
mvMatrixStack = [];
pMatrix = matrix_build_identity();

mouseDown = false;
lastMouseX = 0;
lastMouseY= 0;

moonRotationMatrix = matrix_build_identity();


moonVertexPositionBuffer=noone;
moonVertexNormalBuffer=noone;
moonVertexTextureCoordBuffer=noone;
moonVertexIndexBuffer=noone;