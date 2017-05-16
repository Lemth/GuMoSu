/// @description m3d_pointer_destroy(id)
/// @function m3d_pointer_destroy
/// @param id
/*
    Destroys the specified pointer and all of its data.
    
    Argument0   -   The id of the pointer to destroy
    
    Returns     -   N/A
 */
if (argument0[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
ds_list_destroy(argument0); 

return undefined;