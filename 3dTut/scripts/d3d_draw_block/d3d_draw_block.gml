/// @description Draws a simple 3D block.
/// @param x1 The initial x coordinate of the block. 
/// @param y1 The initial y coordinate of the block.
/// @param z1 The initial z coordinate of the block.
/// @param x2 The opposite x coordinate of the block.
/// @param y2 The opposite y coordinate of the block.
/// @param z2 The opposite z coordinate of the block.
/// @param tex The id of the texture to use (-1 for no texture)
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.
/// @returns 

var __x1 = argument0;
var __y1 = argument1;
var __z1 = argument2;
var __x2 = argument3;
var __y2 = argument4;
var __z2 = argument5;
var __tex = argument6;
var __hrepeat = argument7;
var __vrepeat = argument8;

//var __oldrep = gpu_get_texrepeat();
//gpu_set_texrepeat(true)	
vertex_format_begin();

vertex_format_add_position_3d();//Add 3D position info
vertex_format_add_normal();//Add 3D surface normal info
vertex_format_add_color();//Add color info

//End building the format, and assign the format to the variable "format"
format = vertex_format_end();
//Create the vertex buffer. Another function, vetex_create_buffer_ext can be used to create the buffer with its size predefined and fixed. 
//With the standard vertex_create_buffer, the buffer will just grow automatically as needed.
vb_cube = vertex_create_buffer();

//Begin building the buffer using the format defined previously
vertex_begin(vb_cube, format);


vertex_position_3d(vb_cube, __x1, __y1, __z1);
vertex_normal(vb_cube, 0, 0, -1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y2, __z1);
vertex_normal(vb_cube, 0, 0, -1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y2, __z1);
vertex_normal(vb_cube, 0, 0, -1);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x2, __y2, __z1);
vertex_normal(vb_cube, 0, 0, -1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y1, __z1);
vertex_normal(vb_cube, 0, 0, -1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y1, __z1);
vertex_normal(vb_cube, 0, 0, -1);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x1, __y1, __z2);
vertex_normal(vb_cube, 0, 0, 1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y1, __z2);
vertex_normal(vb_cube, 0, 0, 1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y2, __z2);
vertex_normal(vb_cube, 0, 0, 1);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x2, __y2, __z2);
vertex_normal(vb_cube, 0, 0, 1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y2, __z2);
vertex_normal(vb_cube, 0, 0, 1);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y1, __z2);
vertex_normal(vb_cube, 0, 0, 1);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x1, __y2, __z1);
vertex_normal(vb_cube, 0, 1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y2, __z2);
vertex_normal(vb_cube, 0, 1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y2, __z2);
vertex_normal(vb_cube, 0, 1, 0);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x2, __y2, __z2);
vertex_normal(vb_cube, 0, 1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y2, __z1);
vertex_normal(vb_cube, 0, 1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y2, __z1);
vertex_normal(vb_cube, 0, 1, 0);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x2, __y2, __z1);
vertex_normal(vb_cube, 1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y2, __z2);
vertex_normal(vb_cube, 1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y1, __z2);
vertex_normal(vb_cube, 1, 0, 0);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x2, __y1, __z2);
vertex_normal(vb_cube, 1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y1, __z1);
vertex_normal(vb_cube, 1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y2, __z1);
vertex_normal(vb_cube, 1, 0, 0);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x2, __y1, __z1);
vertex_normal(vb_cube, 0, -1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y1, __z2);
vertex_normal(vb_cube, 0, -1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y1, __z2);
vertex_normal(vb_cube, 0, -1, 0);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x1, __y1, __z2);
vertex_normal(vb_cube, 0, -1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y1, __z1);
vertex_normal(vb_cube, 0, -1, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x2, __y1, __z1);
vertex_normal(vb_cube, 0, -1, 0);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x1, __y1, __z1);
vertex_normal(vb_cube, -1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y1, __z2);
vertex_normal(vb_cube, -1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y2, __z2);
vertex_normal(vb_cube, -1, 0, 0);
vertex_color(vb_cube, c_gray, 1);

vertex_position_3d(vb_cube, __x1, __y2, __z2);
vertex_normal(vb_cube, -1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y2, __z1);
vertex_normal(vb_cube, -1, 0, 0);
vertex_color(vb_cube, c_gray, 1);
vertex_position_3d(vb_cube, __x1, __y1, __z1);
vertex_normal(vb_cube, -1, 0, 0);
vertex_color(vb_cube, c_gray, 1);


vertex_end(vb_cube);

vertex_submit(vb_cube, pr_trianglelist,-1);
//gpu_set_texrepeat(__oldrep);
