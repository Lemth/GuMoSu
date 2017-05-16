/// @description m3d_pointer_create()
/// @function m3d_pointer_create
/*
    Creates a new pointer that will be used with a given projection. The pointer
    can be updated as desired in 2D screen coordinates, then data about it can be
    retrieved in 3D coordinates.
    
    An ID is returned.
 */
 
var __id = ds_list_create();
ds_list_add(__id, __M3D_GLOBAL.pmarker, 0, 0); // Sets to default (0,0) position

// Return the pointer ID
return __id;