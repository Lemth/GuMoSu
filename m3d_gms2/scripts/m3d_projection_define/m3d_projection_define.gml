/// @description m3d_projection_define(id, xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, angle, aspect)
/// @function m3d_projection_define
/// @param id
/// @param  xfrom
/// @param  yfrom
/// @param  zfrom
/// @param  xto
/// @param  yto
/// @param  zto
/// @param  xup
/// @param  yup
/// @param  zup
/// @param  angle
/// @param  aspect
/*
    Defines the values for the in-game camera aspect of the projection.
    
    Argument0   -   id of the projection
    Argument1   -   Camera x
    Argument2   -   Camera y
    Argument3   -   Camera z
    Argument4   -   Camera x focus
    Argument5   -   Camera y focus
    Argument6   -   Camera z focus
    Argument7   -   xup
    Argument8   -   yup
    Argument9   -   zup
    Argument10   -  FOV
    Argument11  -   Aspect Ratio
    
    Returns     -   N/A
 */
 
if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
    
argument0[| __M3D_JPORT.xfrom] =    argument1;
argument0[| __M3D_JPORT.yfrom] =    argument2;
argument0[| __M3D_JPORT.zfrom] =    argument3;
argument0[| __M3D_JPORT.xto] =      argument4;
argument0[| __M3D_JPORT.yto] =      argument5;
argument0[| __M3D_JPORT.zto] =      argument6;
argument0[| __M3D_JPORT.xup] =      argument7;
argument0[| __M3D_JPORT.yup] =      argument8;
argument0[| __M3D_JPORT.zup] =      argument9;
argument0[| __M3D_JPORT.angle] =    argument10;
argument0[| __M3D_JPORT.aspect] =   argument11;
 
return undefined;