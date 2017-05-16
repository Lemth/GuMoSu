/// @description m3d_intersect_triangle([ARRAY] data, x1, y1, z1, x2, y2, z2, x3, y3, z3)
/// @function m3d_intersect_triangle
/// @param [ARRAY] data
/// @param  x1
/// @param  y1
/// @param  z1
/// @param  x2
/// @param  y2
/// @param  z2
/// @param  x3
/// @param  y3
/// @param  z3
/*
    Returns whether a given ray intersects a triangle.
    
    Argument0   -   [ARRAY] calculated projection data / projection id
    Argument1   -   triangle x1
    Argument2   -   triangle y1
    Argument3   -   triangle z1
    Argument4   -   triangle x2
    Argument5   -   triangle y2
    Argument6   -   triangle z2
    Argument7   -   triangle x3
    Argument8   -   triangle y3
    Argument9   -   triangle z3
    
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
var __ux = argument4 - argument1,
    __uy = argument5 - argument2,
    __uz = argument6 - argument3,
    __vx = argument7 - argument1,
    __vy = argument8 - argument2,
    __vz = argument9 - argument3;
    
// Calculate normal vector
var __nx = __uy * __vz - __uz * __vy,
    __ny = __uz * __vx - __ux * __vz,
    __nz = __ux * __vy - __uy * __vx,
// Record the "position" of the triangle (aka, initial point)
    __px = argument1,
    __py = argument2,
    __pz = argument3;
    
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
    
// Check if the point is inside the triangle
var __uu = sqr(__ux) + sqr(__uy) + sqr(__uz),       // Dot product
    __uv = __ux * __vx + __uy * __vy + __uz * __vz, // Dot product
    __vv = sqr(__vx) + sqr(__vy) + sqr(__vz),       // Dot product
    __w2x = __ix - __px,
    __w2y = __iy - __py,
    __w2z = __iz - __pz;
var __wu = __w2x * __ux + __w2y * __uy + __w2z * __uz,
    __wv = __w2x * __vx + __w2y * __vy + __w2z * __vz;
var __d = __uv * __uv - __uu * __vv;
var __s, __t;
__s = (__uv * __wv - __vv * __wu) / __d;
    // Point is outside
if (__s < 0 || __s > 1)
    return false;
__t = (__uv * __wu - __uu * __wv) / __d;
if (__t < 0 || (__s + __t) > 1)
    return false;
    
// Record where the collision took place
__projection[| __M3D_JPORT.lcx] = __ix;
__projection[| __M3D_JPORT.lcy] = __iy;
__projection[| __M3D_JPORT.lcz] = __iz;
    
// Point falls inside
return true;
