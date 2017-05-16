/// @description m3d_pointer_setpos(id, x, y)
/// @function m3d_pointer_setpos
/// @param id
/// @param  x
/// @param  y
/*
    Sets the position of the pointer on the screen.
    
    Argument0   -   id of the pointer
    Argument1   -   x-pos in screen coords
    Argument2   -   y-pos in screen coords
    
    Returns     -   N/A
 */
 
if (argument0[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
// Set the new position of the marker
argument0[| __M3D_AXIS.x] = argument1;
argument0[| __M3D_AXIS.y] = argument2;
 
return undefined;