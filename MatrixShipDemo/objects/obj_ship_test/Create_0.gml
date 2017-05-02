
//Just init_3d for now
d3d_start();
//*
//Lighting to make edges a little more visible

d3d_light_define_ambient(c_gray);
d3d_light_define_direction(0, -1, 1, 1, c_white);
d3d_light_enable(0, true);
d3d_set_shading(false);//*/

//Current rotation matrix - default with no rotation
current_matrix = matrix_build(0, 0, 0, 
                              0, 0, 0,
                              1, 1, 1);
                              

z = 0;



//The pointer - just makes things quicker
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();

var VF = vertex_format_end();

vbuff = vertex_create_buffer();

var size = 64;//2048;
vertex_begin(vbuff, VF);

vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_red, 1);
vertex_position_3d(vbuff,size,0,0);
vertex_colour(vbuff, c_red, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_lime, 1);
vertex_position_3d(vbuff,0,size,0);
vertex_colour(vbuff, c_lime, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_blue, 1);
vertex_position_3d(vbuff,0,0,size);
vertex_colour(vbuff, c_blue, 1);


//Negatives..

vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_maroon, 1);
vertex_position_3d(vbuff,-size,0,0);
vertex_colour(vbuff, c_maroon, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_green, 1);
vertex_position_3d(vbuff,0,-size,0);
vertex_colour(vbuff, c_green, 1);


vertex_position_3d(vbuff,0,0,0);
vertex_colour(vbuff, c_navy, 1);
vertex_position_3d(vbuff,0,0,-size);
vertex_colour(vbuff, c_navy, 1);

vertex_end(vbuff);vertex_freeze(vbuff);

/* */
/*  */
