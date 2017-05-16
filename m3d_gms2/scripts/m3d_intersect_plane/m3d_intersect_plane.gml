/// @description m3d_intersect_plane([ARRAY] data, vx1, vy1, vz1, vx2, vy2, vz2, px, py, pz)
/// @function m3d_intersect_plane
/// @param [ARRAY] data
/// @param  vx1
/// @param  vy1
/// @param  vz1
/// @param  vx2
/// @param  vy2
/// @param  vz2
/// @param  px
/// @param  py
/// @param  pz
/*
    Returns whether a given ray intersects an infinite plane, given two
    vectors that rest perpendicular to the plane.
    
    Argument0   -   [ARRAY] calculated projection data / projection id
    Argument1   -   x-axis of vector 1
    Argument2   -   y-axis of vector 1
    Argument3   -   z-axis of vector 1
    Argument4   -   x-axis of vector 2
    Argument5   -   y-axis of vector 2
    Argument6   -   z-axis of vector 2
    Argument7   -   x-position of point in plane
    Argument8   -   y-position of point in plane
    Argument9   -   z-position of point in plane
    
    Returns     -   true if there was an intersection
 */
 
// Grab the needed camera values
var __projection = argument0[3]; // Projection for camera data

var __camx = __projection[| __M3D_JPORT.xfrom], // Look-from values
    __camy = __projection[| __M3D_JPORT.yfrom],
    __camz = __projection[| __M3D_JPORT.zfrom];
var __rayx = argument0[0],  // pointer directional vector
    __rayy = argument0[1],
    __rayz = argument0[2];

// Calculate vectors between two points in the triangle
var __ux = argument1,
    __uy = argument2,
    __uz = argument3,
    __vx = argument4,
    __vy = argument5,
    __vz = argument6;
    
// Calculate normal vector
var __nx = __uy * __vz - __uz * __vy,
    __ny = __uz * __vx - __ux * __vz,
    __nz = __ux * __vy - __uy * __vx,
// Record the "position" of the triangle (aka, initial point)
    __px = argument7,
    __py = argument8,
    __pz = argument9;
    
// Check if the ray is parallel
var __wx = __camx - __px,
    __wy = __camy - __py,
    __wz = __camz - __pz;
var __a = -(__nx * __wx + __ny * __wy + __nz * __wz),       // Dot product
    __b = (__nx * __rayx + __ny * __rayy + __nz * __rayz);  // Dot product
    
if (abs(__b) < 0.0001) // Close enough to parallel
{
    // Check if ray is INSIDE plane
    if (__a == 0)
        return true;
    else // Not inside, so never intersects
        return false;
}

// Check if pointing away from face
var __r = __a / __b;
if (__r < 0)
    return false;
    
// Find intersect point:
var __ix = __camx + __rayx * __r,
    __iy = __camy + __rayy * __r,
    __iz = __camz + __rayz * __r;

// Record where the collision took place
__projection[| __M3D_JPORT.lcx] = __ix;
__projection[| __M3D_JPORT.lcy] = __iy;
__projection[| __M3D_JPORT.lcz] = __iz;
    
// Point falls inside
return true;