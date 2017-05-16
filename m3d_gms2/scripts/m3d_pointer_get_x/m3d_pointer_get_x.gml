/// @description m3d_pointer_get_x(id)
/// @function m3d_pointer_get_x
/// @param id
/*
    Returns the current x-position of the specified pointer
    
    Argument0   -   id of the pointer object
    
    Returns     -   current x-position
 */
 
if (argument0[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
return argument0[| __M3D_AXIS.x];
