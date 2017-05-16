/// @description m3d_projection_calculate(projection id, pointer id)
/// @function m3d_projection_calculate
/// @param projection id
/// @param  pointer id
/*
    Calculates the 3D directional vector of the pointer.
    A 1D array of 4 values will then be returned, a value for each axis and the projection id
    
    Argument0   -   The projection id to use
    Argument1   -   The pointer id to use
    
    Returns     -   [1D ARRAY] Of 4 unit vector values:
                    0   -   x-vec direction
                    1   -   y-vec direction
                    2   -   z-vec direction
                    3   -   id of projection
 */

if (argument0[| __M3D_JPORT.marker] != __M3D_GLOBAL.jmarker)
    show_error("M3D: Expected id of type [projection]", true);
 
if (argument1[| __M3D_AXIS.marker] != __M3D_GLOBAL.pmarker)
    show_error("M3D: Expected id of type [pointer]", true);
    
// Grab all the projection values:
var __xport  = argument0[| __M3D_JPORT.xport],
    __yport  = argument0[| __M3D_JPORT.yport],
    __wport  = argument0[| __M3D_JPORT.wport],
    __hport  = argument0[| __M3D_JPORT.hport],
    __xfrom  = argument0[| __M3D_JPORT.xfrom],
    __yfrom  = argument0[| __M3D_JPORT.yfrom],
    __zfrom  = argument0[| __M3D_JPORT.zfrom],
    __xto    = argument0[| __M3D_JPORT.xto],
    __yto    = argument0[| __M3D_JPORT.yto],
    __zto    = argument0[| __M3D_JPORT.zto],
    __xup    = argument0[| __M3D_JPORT.xup],
    __yup    = argument0[| __M3D_JPORT.yup],
    __zup    = argument0[| __M3D_JPORT.zup],
    __angle  = argument0[| __M3D_JPORT.angle],
    __aspect = argument0[| __M3D_JPORT.aspect];
    
var __vector; // The final vector to be returned
__vector[3] = 0;

// Create values for the math to come
var __mm, __dx, __dy, __dz,
    __vx, __vy, __vz,
    __tfov,__mX, __mY, __mZ;
    
// Delta between camera location and viewing location
__dx = __xto - __xfrom;
__dy = __yto - __yfrom;
__dz = __zto - __zfrom;

// Distance from camera position to viewing location
__mm = sqrt(sqr(__dx) + sqr(__dy) + sqr(__dz));
if (__mm < 1)
    show_error("M3D: Viewing distance too small! Must be at least 1 unit in length.", true);

// Normalize directional vector
__dx /= __mm;
__dy /= __mm;
__dz /= __mm;

// Reassign __mm to only the distance of the "up" axis
__mm = __xup * __dx + __yup * __dy + __zup * __dz;

// Subtract the distance on the "up" axis multiplied by the delta on the respective axis
__xup -= __mm * __dx;
__yup -= __mm * __dy;
__zup -= __mm * __dz;

// Reassign __mm to the length of the new "up" vectors:
__mm = sqrt(sqr(__xup) + sqr(__yup) + sqr(__zup));
if (__mm == 0)
    show_error("M3D: Incorrect cam-up vector!", true);

// Normalize the *up vector
__xup /= __mm;
__yup /= __mm;
__zup /= __mm;

// Perform cross product to find perpendicular vector
__vx = __yup * __dz - __dy * __zup;
__vy = __zup * __dx - __dz * __xup;
__vz = __xup * __dy - __dx * __yup;

// Account for field of view
__tfov = dtan(__angle / 2);
__xup *= __tfov;
__yup *= __tfov;
__zup *= __tfov;

    // Account for aspect ratio:
__vx *= __tfov * __aspect;
__vy *= __tfov * __aspect;
__vz *= __tfov * __aspect;

// Grab the position of the pointer ID
var __pointerx = argument1[| __M3D_AXIS.x],
    __pointery = argument1[| __M3D_AXIS.y];
    
// Compensate for the view port:
__pointerx -= __xport;
__pointery -= __yport;
    
// Calculate 3D position of the 2D pointer given the calculated vector values
__mx = __dx + __xup * (1 - 2 * __pointery / __hport) + __vx * (2 * __pointerx / __wport - 1);
__my = __dy + __yup * (1 - 2 * __pointery / __hport) + __vy * (2 * __pointerx / __wport - 1);
__mz = __dz + __zup * (1 - 2 * __pointery / __hport) + __vz * (2 * __pointerx / __wport - 1);

// Reassign __mm to the length of the directional vector
__mm = sqrt(sqr(__mx) + sqr(__my) + sqr(__mz));
if (__mm == 0)
    show_error("M3D: Invalid directional vector! Pointer has no distance.", true);
    
// Record the normalized vector:
__vector[0] = __mx / __mm;
__vector[1] = __my / __mm;
__vector[2] = __mz / __mm;
__vector[3] = argument0; // Record projection id for later function passing

// Return the directional vector for use in other scripts
return __vector;
