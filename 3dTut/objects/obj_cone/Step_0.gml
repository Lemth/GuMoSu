//Roll
var REL_ROLL = keyboard_check(ord("E")) - keyboard_check(ord("Q"));
//Up-down pitch
var REL_PITCH = keyboard_check(ord("W")) - keyboard_check(ord("S"));
//Left-right yaw
var REL_YAW = keyboard_check(ord("D")) - keyboard_check(ord("A"));

var rotate_const = 5;
//YXZ transform order - Y is roll, X is pitch, Z is yaw
var matrix_to_add = matrix_build(0, 0, 0,
                                 REL_PITCH * rotate_const, 
                                 REL_ROLL * rotate_const, 
                                 REL_YAW * rotate_const,
                                 1, 1, 1);
                        
//I know I previously said the second matrix is the added one, and this is still true - I'm just bending it a little so the transforms become relative    
//current_matrix = matrix_multiply(matrix_to_add, current_matrix);
current_matrix = matrix_multiply(matrix_to_add,current_matrix);

/*
Although I have stated what is pitch, yaw and roll here, it doesn't really seem to matter (as long as you make it make sense to your input and models)
I just based them on the YXZ matrix build order of GameMaker
*/



/* */
/*  */

  var mouseDown = false;
  var lastMouseX = null;
  var lastMouseY = null;

  var moonRotationMatrix = mat4.create();
  mat4.identity(moonRotationMatrix);

  function handleMouseDown(event) {
    mouseDown = true;
    lastMouseX = event.clientX;
    lastMouseY = event.clientY;
  }

  function handleMouseUp(event) {
    mouseDown = false;
  }

  function handleMouseMove(event) {
    if (!mouseDown) {
      return;
    }
    var newX = event.clientX;
    var newY = event.clientY;

    var deltaX = newX - lastMouseX;
    var newRotationMatrix = mat4.create();
    mat4.identity(newRotationMatrix);
    mat4.rotate(newRotationMatrix, degToRad(deltaX / 10), [0, 1, 0]);

    var deltaY = newY - lastMouseY;
    mat4.rotate(newRotationMatrix, degToRad(deltaY / 10), [1, 0, 0]);

    mat4.multiply(newRotationMatrix, moonRotationMatrix, moonRotationMatrix);

    lastMouseX = newX
    lastMouseY = newY;
  }
