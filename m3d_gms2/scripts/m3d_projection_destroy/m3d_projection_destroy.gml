/// @description m3d_projection_destroy(id)
/// @function m3d_projection_destroy
/// @param id
/*
    Destroys the specified projection and all of its data.
    
    Argument0   -   The id of the projection to destroy
    
    Returns     -   N/A
 */
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true); 
    
ds_list_destroy(argument0);

return undefined;