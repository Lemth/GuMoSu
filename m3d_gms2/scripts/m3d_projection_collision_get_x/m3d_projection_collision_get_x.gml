/// @description m3d_projection_collision_get_x(id)
/// @function m3d_projection_collision_get_x
/// @param id
/*
    Returns the x-coordinate for the last collision found in this projection.
    Default is 0, if there was no collision in the last check, the value WILL NOT
    be update.
    
    Argument0   -   id of the projection to check
    
    Returns     -   value for the x-coordinate
 */
 
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
    
return argument0[| __M3D_JPORT.lcx];
