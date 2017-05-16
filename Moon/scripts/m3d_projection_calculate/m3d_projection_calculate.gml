/// @description m3d_projection_calculate(projection id, pointer id)
/// @function m3d_projection_calculate
/*
    Calculates the 3D directional vector of the pointer.
    A 1D array of 3 values will then be returned, a value for each axis
    
    
    Returns     -   [1D ARRAY] Of 4 unit vector values:
                    0   -   x-vec direction
                    1   -   y-vec direction
                    2   -   z-vec direction
 */

// Grab all the projection values:
var __xport  = view_xport,
    __yport  = view_yport,
    __wport  = view_wport,
    __hport  = view_hport,
    __xfrom  = 0,
    __yfrom  = 0,
    __zfrom  = -5,
    __xto    = 0,
    __yto    = 0,
    __zto    = 0,
    __xup    = 0,
    __yup    = 1,
    __zup    = 0,
    __angle  = 45,
    __aspect = window_get_width()/window_get_height();
    
var __vector; // The final vector to be returned
__vector[2] = 0;

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
    show_debug_message("M3D: Viewing distance too small! Must be at least 1 unit in length.");

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
    show_debug_message("M3D: Incorrect cam-up vector!");

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
var __pointerx = window_mouse_get_x(),
    __pointery = window_mouse_get_y();
    
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
    show_debug_message("M3D: Invalid directional vector! Pointer has no distance.");
    
// Record the normalized vector:
__vector[0] = __mx / __mm;
__vector[1] = __my / __mm;
__vector[2] = __mz / __mm;

// Return the directional vector for use in other scripts
return __vector;
