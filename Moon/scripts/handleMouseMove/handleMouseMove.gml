///@desc handleMouseMove(event)
///@arg event argument0

//var event = argument0;

if(!mouseDown) {
	return;
}
var newX = mouse_x;
var newY = mouse_y;

var deltaX = newX - lastMouseX;
var newRotationMatrix = matrix_build_identity();
newRotationMatrix = mat4rotate(newRotationMatrix, degToRad(deltaX / 10), [0, 1, 0]);

var deltaY = newY - lastMouseY;
newRotationMatrix = mat4rotate(newRotationMatrix, degToRad(deltaY / 10), [1, 0, 0]);

moonRotationMatrix = mat4multiply(newRotationMatrix, moonRotationMatrix, moonRotationMatrix); // ??

lastMouseX = newX
lastMouseY = newY;
