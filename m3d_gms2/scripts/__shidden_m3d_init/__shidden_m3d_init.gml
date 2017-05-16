/*
    Sets up enums and other useful systems that will be used throughout the extension's
    lifetime.
 */
 
//  Pointer array positions
enum __M3D_AXIS
{
    marker,
    x, 
    y, 
    z,
}
//  Projection array positions
enum __M3D_JPORT
{
    marker,
    xport,
    yport,
    wport,
    hport,
    
    xfrom,
    yfrom,
    zfrom,
    xto,
    yto,
    zto,
    xup,
    yup,
    zup,
    angle,
    aspect,
    
    lcx, // Collision coords for the last collision in the projection
    lcy,
    lcz
}

//  Global misc constants
enum __M3D_GLOBAL
{
    pmarker = -9188,    // Pointer marker
    jmarker = -9189     // Projection marker
}

return undefined;
