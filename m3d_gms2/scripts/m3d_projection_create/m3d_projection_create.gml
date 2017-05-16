/// @description m3d_projection_create(xport, yport, wport, hport)
/// @function m3d_projection_create
/// @param xport
/// @param  yport
/// @param  wport
/// @param  hport
/*
    Creates a new "projection" object that will sync with a pointer to
    return the 3D coordinates
    
    Argument0   -   The x-position on the screen of the projection
    Argument1   -   The y-position on the screen of the projection
    Argument2   -   The width of the projection on the screen
    Argument3   -   The height of the projection on the screen
    
    Returns     -   Id of the projection
 */
 
if (argument0 < 0 || argument1 < 0)
    show_error("M3D: xport/yport must be >= 0", true);

if (argument2 < 1 || argument3 < 1)
    show_error("M3D: wport/hport must be >= 1", true);
 
var __id = ds_list_create();
ds_list_add(__id, __M3D_GLOBAL.jmarker, argument0, argument1, argument2, argument3);
ds_list_add(__id, 0, 0, 0, 1, 0, 0, 0, 0, 1, 60, room_width / room_height); // Default camera values
ds_list_add(__id, 0, 0, 0); // The collision coordinates (default to 0)

return __id;
