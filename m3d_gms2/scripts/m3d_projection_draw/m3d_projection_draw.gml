/// @description m3d_projection_draw(id, near, far)
/// @function m3d_projection_draw
/// @param id
/// @param  near
/// @param  far
/*
    Draws the projection using d3d_* funtions just like a normal camera.
    This function is optional and for convenience.
    
    Argument0   -   id of the projection to use
    Argument1   -   Near-clipping plane
    ARgument2   -   Far-clipping plane
    
    Returns     -   N/A
 */
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
 
d3d_set_projection_ext(argument0[| __M3D_JPORT.xfrom], argument0[| __M3D_JPORT.yfrom], argument0[| __M3D_JPORT.zfrom],
                       argument0[| __M3D_JPORT.xto], argument0[| __M3D_JPORT.yto], argument0[| __M3D_JPORT.zto],
                       argument0[| __M3D_JPORT.xup], argument0[| __M3D_JPORT.yup], argument0[| __M3D_JPORT.zup],
                       argument0[| __M3D_JPORT.angle], argument0[| __M3D_JPORT.aspect], argument1, argument2);
return undefined;